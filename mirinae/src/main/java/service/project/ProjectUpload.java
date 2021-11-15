package service.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.main.CommandProcess;

public class ProjectUpload implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		return "/project/p_upload";
	}

}
