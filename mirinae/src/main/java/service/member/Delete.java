package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.MemberDao;
import service.main.CommandProcess;

public class Delete implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberDao md = MemberDao.getInstance();
		int result = md.delete(id);
		if(result > 0) {
			session.invalidate();
		}
		request.setAttribute("result", result);
		return "/member/delete";
	}

}
