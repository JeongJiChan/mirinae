package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class ConfirmMyNick implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String my_nick = request.getParameter("m_nick");
		String msg = "";
		MemberDao md = MemberDao.getInstance();
		Member member3 = md.ud_nick_Chk(my_nick);

		if(member3 == null) msg = "0";
		else msg = "1";
		System.out.println(msg);
		request.setAttribute("msg", msg);
		return "/member/confirmMyNick";
	}

}
