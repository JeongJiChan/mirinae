package service.cs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.main.CommandProcess;

public class CsWriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// session에서 닉네임 가져오기
		/*
		 * HttpSession session = request.getSession();
		 * 
		 * if(session.getAttribute("m_no") != null) { String m_nick = (String)
		 * session.getAttribute("m_nick"); request.setAttribute("m_nick", m_nick); }
		 */
		return "cs/cs_writeForm";
	}

}
