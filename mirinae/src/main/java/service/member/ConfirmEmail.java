package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class ConfirmEmail implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String m_email = request.getParameter("m_email");
		String msg = "";
		MemberDao md = MemberDao.getInstance();
		Member member = md.nick_Email(m_email);
		
		if(member == null) msg = "0";
		else msg = "1";
		
		request.setAttribute("msg", msg);
		return "/member/confirmEmail";
	}
}
