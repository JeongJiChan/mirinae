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
		if(member == null) msg = "사용 가능한 아이디입니다";
		else msg = "이미 사용중인 아이디입니다";
		request.setAttribute("msg", msg);
		System.out.println("msg = "+msg);
		return "/member/confirm";
	}

}
