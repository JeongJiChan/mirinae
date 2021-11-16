package service.project;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProjectDao;
import model.Project;
import service.main.CommandProcess;

public class ProjectUpload implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		int cate_code = Integer.parseInt(request.getParameter("category"));
		String p_name = request.getParameter("name");
		String p_content = request.getParameter("content");
//		String p_writer 작성자 정보
		String p_writer = (String)session.getAttribute("m_nick");
		Date s_date = Date.valueOf(request.getParameter("s_date"));
		Date e_date = Date.valueOf(request.getParameter("e_date"));
		int goal_money = Integer.parseInt(request.getParameter("goal_money"));
//		int p_view 조회수
//		String p_del 삭제 여부
//		Date reg_date 작성일자
//		int cur_money 현재 달성 금액
		
		Project project = new Project();
		project.setCate_code(cate_code);
		project.setP_name(p_name);
		project.setP_content(p_content);
		project.setP_writer(p_writer);
		project.setS_date(s_date);
		project.setE_date(e_date);
		project.setGoal_money(goal_money);
		
		ProjectDao pd = ProjectDao.getInstance();
		int result = pd.update(project);
		
		
		request.setAttribute("project", project);
		return "/project/p_upload";
	}

}
