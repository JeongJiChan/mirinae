

package service.project;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProjectDao;
import dao.MemberDao;
import dao.OptionsDao;
import model.Project;
import model.Member;
import model.Options;
import service.main.CommandProcess;

public class ProjectUpload implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		int cate_code = Integer.parseInt(request.getParameter("category"));
		String p_name = request.getParameter("name");
		String p_content = request.getParameter("content");
	//	String m_id = (String)session.getAttribute("id");
	//	MemberDao memberDao = MemberDao.getInstance();
	//  Member member = memberDao.select(m_id);
	//	String p_writer = member.getM_name();
		Date s_date = Date.valueOf(request.getParameter("s_date"));
		Date e_date = Date.valueOf(request.getParameter("e_date"));
		int goal_money = Integer.parseInt(request.getParameter("goal_money"));
//		int p_view 조회수
//		String p_del 삭제 여부
//		Date reg_date 작성일자
//		int cur_money 현재 달성 금액
		
//		여러데이터를 구현해야함
	 	String opt_name1 = request.getParameter("name_arr");
	 	String opt_price1 = request.getParameter("price_arr");
	 	String[] price = opt_price1.split(",");
	 	String[] name = opt_name1.split(",");
		String[] opt_name = new String[name.length];
		for(int i =0; i < name.length; i++) {
			opt_name[i] = name[i];
		} 
	 	int[] opt_price = new int[price.length];
		for(int i =0; i < price.length; i++) {
			opt_price[i] = Integer.parseInt(price[i]);
		}  
 

		Project project = new Project();
		project.setCate_code(cate_code);
		project.setP_name(p_name);
		project.setP_content(p_content);
	//	project.setP_writer(p_writer);
		project.setS_date(s_date);
		project.setE_date(e_date);
		project.setGoal_money(goal_money);
		
		int result = 0;
		ProjectDao pd = ProjectDao.getInstance();
		int p_no = pd.find_p_no();
		project.setP_no(p_no);
		int resultpro = pd.insert(project); 
		
		int resultopt = 0;

		OptionsDao od = OptionsDao.getInstance();
		int opt_code = od.find_opt_code();
		for(int i = 0; i < opt_price.length; i++) {
			Options options = new Options();
			options.setOpt_code(opt_code);
			options.setOpt_name(opt_name[i]);
			options.setOpt_price(opt_price[i]);
			options.setP_no(p_no);
			resultopt = od.insert(options); 
			opt_code++;
		}
		
		if(resultpro == 1 && resultopt == 1) {
			result = 1;
		}
			
		request.setAttribute("result", result);
		return "/project/p_upload";
	}

}
