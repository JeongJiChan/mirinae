package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDao;
import model.Admin;
import service.main.CommandProcess;

public class AdminPage implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String admin_id = (String)session.getAttribute("admin_id");
		AdminDao ad = AdminDao.getInstance();
		Admin admin = ad.ad_select(admin_id);
		
		request.setAttribute("admin", admin);
		
		return "/admin/admin_page";
	}

}
