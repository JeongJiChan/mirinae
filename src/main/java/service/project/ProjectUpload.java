

package service.project;

import java.io.File;
import java.sql.Date;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		String real = request.getSession().getServletContext().getRealPath("/p_images");
		int maxSize = 1024 * 1024 * 10;
		try {
		MultipartRequest mr = new MultipartRequest(request, real, maxSize,
				"utf-8", new DefaultFileRenamePolicy());
		
		HttpSession session = request.getSession();

		int cate_code = Integer.parseInt(mr.getParameter("category"));
		String p_name = mr.getParameter("name");
		String p_content = mr.getParameter("content");
		String m_id = (String)session.getAttribute("id");
		MemberDao memberDao = MemberDao.getInstance();
	    Member member = memberDao.select(m_id);
		String p_writer = member.getM_name();
		Date s_date = Date.valueOf(mr.getParameter("s_date"));
		Date e_date = Date.valueOf(mr.getParameter("e_date"));
		int goal_money = Integer.parseInt(mr.getParameter("goal_money"));

	//  프로젝트 셋팅
		Project project = new Project();
		project.setCate_code(cate_code);
		project.setP_name(p_name);
		project.setP_content(p_content);
		project.setP_writer(p_writer);
		project.setS_date(s_date);
		project.setE_date(e_date);
		project.setGoal_money(goal_money);
		
		int result = 0;
		ProjectDao pd = ProjectDao.getInstance();
		//프로젝트 넘버 알아오기
		int p_no = pd.find_p_no();
		project.setP_no(p_no);
		int resultpro = pd.insert(project); 
		
		
		//옵션 세팅
		int resultopt = 0;
	 	String opt_name1 = mr.getParameter("name_arr");
	 	String opt_price1 = mr.getParameter("price_arr");
		OptionsDao od = OptionsDao.getInstance();
		//옵션 코드 알아오기
		int opt_code = od.find_opt_code();
	 	if(opt_name1.contains(",")) {
	 		//옵션 다중 저장
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
			for(int i = 0; i < opt_price.length; i++) {
				Options options = new Options();
				options.setOpt_code(opt_code);
				options.setOpt_name(opt_name[i]);
				options.setOpt_price(opt_price[i]);
				options.setP_no(p_no);
				resultopt = od.insert(options);
				opt_code++;
			}
	 	}else {
	 		//옵션 한 건 저장
	 		String opt_name = opt_name1;
	 		int opt_price = Integer.parseInt(opt_price1);
			Options options = new Options();
			options.setOpt_code(opt_code);
			options.setOpt_name(opt_name);
			options.setOpt_price(opt_price);
			options.setP_no(p_no);
			resultopt = od.insert(options);
	 	}
	
	 	//파일 이름 변경
	 	 
 	    String fileName = mr.getFilesystemName("filename");
 	    String now = String.valueOf(p_no);	 	 
 	    int i = -1;
 	   	i = fileName.lastIndexOf("."); // 파일 확장자 위치
 	   	//이름과 확장자 결합
 	   	String realFileName = now + fileName.substring(i, fileName.length());     
 	    File oldFile = new File(real +"/"+ fileName);
 	    File newFile = new File(real +"/"+ realFileName);
	 	   
 	    oldFile.renameTo(newFile); // 파일명 변경

		if(resultpro == 1 && resultopt == 1) {
			result = 1;
		}
	
		 request.setAttribute("result", result);
		}catch (Exception e) {
			System.out.println("연결에러 : "+e.getMessage());
		}
		return "/project/p_upload";
	}
}
