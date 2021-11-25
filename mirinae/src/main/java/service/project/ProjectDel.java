package service.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjectDao;
import service.main.CommandProcess;

public class ProjectDel implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		ProjectDao pd = ProjectDao.getInstance();
		int result = pd.delete(p_no);
		
		request.setAttribute("result", result);
		return "/project/p_del";
	}

}
