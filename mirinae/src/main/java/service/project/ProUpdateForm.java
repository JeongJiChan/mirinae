package service.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OptionsDao;
import dao.ProjectDao;
import model.Options;
import model.Project;
import service.main.CommandProcess;

public class ProUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		ProjectDao pd = ProjectDao.getInstance();
		Project project = pd.proview(p_no);
		OptionsDao od = OptionsDao.getInstance();
		List<Options> options = od.optionsList(p_no);
		
		request.setAttribute("options", options);
		request.setAttribute("project", project);
		return "/project/p_updateFrom";
	}

}
