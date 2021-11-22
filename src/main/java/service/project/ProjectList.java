package service.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjectDao;
import model.Project;
import service.main.CommandProcess;

public class ProjectList implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		ProjectDao pd = ProjectDao.getInstance();
		List<Project> project = pd.selectList();

		request.setAttribute("project", project);
		return "/project/p_list";
	}

}
