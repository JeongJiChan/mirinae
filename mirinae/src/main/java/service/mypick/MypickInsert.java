package service.mypick;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MypickDao;
import service.main.CommandProcess;

public class MypickInsert implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("m_id");
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		// 마이픽 조회
		MypickDao md = MypickDao.getInstance();
		int myResult = md.insertMypick(p_no,id);

		request.setAttribute("myResult", myResult);
		return "/mypick/mypick_insert";
	}

}
