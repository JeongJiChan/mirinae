package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class ConfirmNick implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String m_nick = request.getParameter("m_nick");
		String msg = "";
		MemberDao md = MemberDao.getInstance();
		Member member = md.select2(m_nick);

		if(member == null) msg = "0";
		else msg = "1";

		request.setAttribute("msg", msg);
		return "/member/confirmNick";
	}

}
