package service.member;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class Join implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String m_id = request.getParameter("m_id");
		String m_pass = request.getParameter("m_pass");
		String m_nick = request.getParameter("m_nick");
		String m_email = request.getParameter("m_email");
		String m_name = request.getParameter("m_name");
		String tel = request.getParameter("tel");
		Date birth = Date.valueOf(request.getParameter("birth"));
		String address = request.getParameter("address");
		String address_d = request.getParameter("address_detail");
		
		Member member = new Member();
		member.setM_id(m_id);
		member.setM_pass(m_pass);
		member.setM_nick(m_nick);
		member.setM_email(m_email);
		member.setM_name(m_name);
		member.setTel(tel);
		member.setBirth(birth);
		member.setAddress(address);
		member.setAddress_d(address_d);
		
		MemberDao md = MemberDao.getInstance();
		Member member2 = md.select(m_id);
		Member member3 = md.nick_Chk(m_nick);
		
		int result = 0; // 입력실패
		if(member2 == null) {
			if(member3 == null) result = md.insert(member); // 성공한 갯수 1
			else result = -1; // 닉네임 중복
		}
		else result = -1; // 아이디 중복
		
		request.setAttribute("result", result);
		return "/member/join";
	}

}
