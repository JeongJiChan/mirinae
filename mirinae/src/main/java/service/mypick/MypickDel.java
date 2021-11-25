package service.mypick;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MypickDao;
import service.main.CommandProcess;

public class MypickDel implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		
		MypickDao md = MypickDao.getInstance();
		int result = md.delete(p_no, m_no);
		
		request.setAttribute("result", result);
		return "/mypick/mypick_del";
	}
	
}
