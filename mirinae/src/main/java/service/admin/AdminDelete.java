package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.main.CommandProcess;

public class AdminDelete implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String m_id = request.getParameter("m_id");
		String pageNum = request.getParameter("pageNum");
		MemberDao md = MemberDao.getInstance();
		int result = md.delete(m_id);
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "/admin/admin_delete";
	}
}