package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class UpdatePass implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String m_id = request.getParameter("m_id");
		String m_pass = request.getParameter("m_pass");
		
		Member up_member = new Member();
		up_member.setM_id(m_id);
		up_member.setM_pass(m_pass);
		
		MemberDao md = MemberDao.getInstance();
		int result = md.updatePass(up_member);
		request.setAttribute("result", result);
		
		return "/member/updatePassResult";
	}
}