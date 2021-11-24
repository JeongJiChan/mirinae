package service.cs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CsDao;
import dao.MemberDao;
import model.Cs;
import model.Member;
import service.main.CommandProcess;

public class CsWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("id"); 
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(m_id);
		String m_nick = member.getM_nick();
		int m_no = member.getM_no();
		
		Cs cs = new Cs();
		String pageNum = request.getParameter("pageNum");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		cs.setM_no(m_no);
		cs.setCs_writer(m_nick);
		cs.setCs_title(title);
		cs.setCs_content(content);
	
		
		CsDao cd = CsDao.getInstance();
		int result = cd.insert(cs);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return "cs/cs_write";
	}

}
