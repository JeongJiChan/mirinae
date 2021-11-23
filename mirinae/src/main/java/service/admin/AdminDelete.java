package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.MemberDao;
import service.main.CommandProcess;

public class AdminDelete implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String m_id = request.getParameter("delMid");
		System.out.println(m_id);
		MemberDao md = MemberDao.getInstance();
		int result = md.delete(m_id);
//		if(result > 0) {
//			session.invalidate();
	//	}
		request.setAttribute("result", result);
		return "/admin/admin_delete";
	}

}
