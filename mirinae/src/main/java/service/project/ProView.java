package service.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OptionsDao;
import dao.ProjectDao;
import model.Options;
import model.Project;
import service.main.CommandProcess;

public class ProView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		ProjectDao pd = ProjectDao.getInstance();
		pd.p_viewUpload(p_no);
		Project project = pd.proview(p_no);
		OptionsDao od = OptionsDao.getInstance();
		List<Options> options = od.optionsList(p_no);
				
		request.setAttribute("project", project);
		request.setAttribute("options", options);
		return "/project/p_view";
	}

}
