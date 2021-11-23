package service.cs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class CsWriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		 HttpSession session = request.getSession();
		 String m_id = (String)session.getAttribute("id"); 
		 MemberDao md = MemberDao.getInstance();
		 Member member = md.select(m_id);
		 String m_nick = member.getM_nick();
		
		 request.setAttribute("m_nick", m_nick); 
		return "cs/cs_writeForm";
	}

}
