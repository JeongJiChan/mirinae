package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDao;
import dao.MemberDao;
import model.Admin;
import model.Member;
import service.main.CommandProcess;

public class Login implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result;
		String m_id = request.getParameter("id");
		String m_pass = request.getParameter("pass");
		String admin_id = request.getParameter("id");
		String admin_pass = request.getParameter("pass");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(m_id);
		
		AdminDao ad = AdminDao.getInstance();
		Admin admin = ad.ad_select(admin_id);
		
		if(member == null) result = -1; // 데이터 없음
		else if(member.getM_pass().equals(m_pass)) {
			HttpSession session = request.getSession();
			session.setAttribute("id", m_id);
			result = 1; // 암호 일치
		} 
		else result = 0; // 비밀번호 틀림
		
		if(admin != null) {
			if(admin.getAdmin_pass().equals(admin_pass)) {
				HttpSession session = request.getSession();
				session.setAttribute("admin_id", admin_id);
				result = 2; // 암호 일치
			}
			else result = 0; // 비밀번호 틀림
		}
		
		if(member != null && member.getDel().equals("y")) result = -2; // 탈퇴한 회원
		
		request.setAttribute("result", result);
		return "/member/login";
	}
}
