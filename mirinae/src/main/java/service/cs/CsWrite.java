package service.cs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CsDao;
import model.Cs;
import service.main.CommandProcess;

public class CsWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Cs cs = new Cs();
		int cs_no = Integer.parseInt(request.getParameter("cs_no"));
		String pageNum = request.getParameter("pageNum");
		String title = request.getParameter("cs_title");
		/* String nick = request.getParameter("m_nick"); */
		String content = request.getParameter("cs_content");
		int cs_ref = Integer.parseInt(request.getParameter("cs_ref"));
		int cs_re_level = Integer.parseInt(request.getParameter("cs_re_level"));
		int cs_re_step = Integer.parseInt(request.getParameter("cs_re_step"));
		
		cs.setCs_no(cs_no);
		cs.setCs_title(title);
		cs.setCs_ref(cs_ref);
		cs.setCs_re_level(cs_re_level);
		cs.setCs_re_step(cs_re_step);
		/* cs.setM_nick(nick); */
		cs.setCs_content(content);
		
		CsDao cd = CsDao.getInstance();
		int result = cd.insert(cs);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return "cs/cs_write";
	}

}
