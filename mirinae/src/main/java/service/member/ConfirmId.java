package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class ConfirmId implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String m_id = request.getParameter("m_id");
		String msg = "";
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(m_id);

//		if(member == null) {
//			if(m_id.equals("master") || m_id.equals("admin"))
//				msg = "2";
//			else msg = "0";
//		}
		
		if(member == null) msg = "0";
		else msg = "1";

		request.setAttribute("msg", msg);
		return "/member/confirmId";
	}
}
