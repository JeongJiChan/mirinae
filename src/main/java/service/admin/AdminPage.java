package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.main.CommandProcess;

public class AdminPage implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		return "/admin/admin_page";
	}

}
