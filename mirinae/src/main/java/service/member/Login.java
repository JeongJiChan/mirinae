package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class Login implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String m_id = request.getParameter("m_id");
		String m_pass = request.getParameter("m_pass");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(m_id);
		int result = 0; // 암호가 다르다
		if(member == null || member.getDel().equals("y")) result = -1; // 데이터 없음
		else
			if(member.getM_pass().equals(m_pass)) {
				HttpSession session = request.getSession();
				session.setAttribute("id", m_id);
				result = 1; // 암호 일치
			}
		request.setAttribute("result", result);
		return "/member/login";
	}

}
