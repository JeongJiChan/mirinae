package service.cs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDao;
import dao.CsDao;
import dao.MemberDao;
import model.Admin;
import model.Cs;
import model.Member;
import service.main.CommandProcess;

public class CsReWrite implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String cs_title = request.getParameter("cs_title");
		String content = request.getParameter("content");
		String admin_id = (String)session.getAttribute("admin_id");
		
		int cs_ref = Integer.parseInt(request.getParameter("cs_no"));
		
		
		Cs cs = new Cs();
		String pageNum = request.getParameter("pageNum");
	
		AdminDao ad = AdminDao.getInstance();
		Admin admin = ad.ad_select(admin_id);
		int admin_no = admin.getAdmin_no();
		
		
		cs.setCs_title(cs_title);
		cs.setCs_content(content);
		cs.setCs_ref(cs_ref);
		cs.setAdmin_no(admin_no);
		
		CsDao cd = CsDao.getInstance();
		int result = cd.insert2(cs);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return "cs/cs_rewrite";
	}

}
