package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.main.CommandProcess;

public class UpdatePassForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String m_id = request.getParameter("m_id");

		request.setAttribute("m_id", m_id);
		return "/member/updatePassForm";
    }
}