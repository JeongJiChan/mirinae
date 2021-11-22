package service.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDao;
import dao.NoticeDao;
import model.Admin;
import model.Notice;
import service.main.CommandProcess;

public class NoticeWrite implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String admin_id = (String)session.getAttribute("admin_id");

		/* 관리자 번호 불러오기 */
		AdminDao ad = AdminDao.getInstance();
		Admin admin = ad.ad_select(admin_id);
		int admin_no = admin.getAdmin_no();
		
		String no_title = request.getParameter("no_title");
		String no_content = request.getParameter("no_content");
		Notice notice = new Notice();
		notice.setNo_title(no_title);
		notice.setNo_content(no_content);
		notice.setAdmin_no(admin_no);
		
		
		NoticeDao nd = NoticeDao.getInstance();
		int result = nd.insert(notice);
		
		
		request.setAttribute("admin_no", admin_no);
		request.setAttribute("result", result);
		return "/notice/notice_write";
	}

}
