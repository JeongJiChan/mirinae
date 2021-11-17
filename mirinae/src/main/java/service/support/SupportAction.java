package service.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.main.CommandProcess;

public class SupportAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		return "/support/sup_action";
	}

}
