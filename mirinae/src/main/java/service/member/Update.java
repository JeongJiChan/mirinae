package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class Update implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String m_id = request.getParameter("m_id");
		String m_pass = request.getParameter("m_pass");
		String m_nick = request.getParameter("m_nick");
		String m_email = request.getParameter("m_email");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		String address_d = request.getParameter("address_detail");
		
		Member member = new Member();
		member.setM_id(m_id);
		member.setM_pass(m_pass);
		member.setM_nick(m_nick);
		member.setM_email(m_email);
		member.setTel(tel);
		member.setAddress(address);
		member.setAddress_d(address_d);
		
		MemberDao md = MemberDao.getInstance();
		
		int result = md.update(member);
		request.setAttribute("result", result);
		
		return "/member/update";
	}

}
