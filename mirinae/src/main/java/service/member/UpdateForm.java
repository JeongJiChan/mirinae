package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class UpdateForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("id");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(m_id);
		
		request.setAttribute("member", member);
		
		return "/member/updateForm";
	}
}