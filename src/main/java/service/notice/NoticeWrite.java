package service.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;
import model.Notice;
import service.main.CommandProcess;

public class NoticeWrite implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String no_title = request.getParameter("no_title");
		String no_content = request.getParameter("no_content");
		//String admin_no = request.getParameter("admin_no");
		Notice notice = new Notice();
		notice.setNo_title(no_title);
		notice.setNo_content(no_content);
		//notice.setAdmin_no(admin_no);
		
		
		NoticeDao nd = NoticeDao.getInstance();
		int result = nd.insert(notice);
		
		request.setAttribute("result", result);
		return "/notice/notice_write";
	}

}
