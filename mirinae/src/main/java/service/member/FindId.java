package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class FindId implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result;
		String m_name = request.getParameter("m_name");
		String m_email = request.getParameter("m_email");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.find_Id(m_name, m_email);
		
		if(member == null) result = -1; // 데이터 없음
		else result = 1;
		
		request.setAttribute("result", result);
		request.setAttribute("member", member);
		
		return "/member/findIdResult";
	}
}
