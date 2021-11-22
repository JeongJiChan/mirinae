package service.notice;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;
import model.Notice;
import service.main.CommandProcess;

public class NoticeUpdate implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int no_no = Integer.parseInt(request.getParameter("no_no"));
		String no_title = request.getParameter("no_title");
		String no_content = request.getParameter("no_content");
		
		
		Notice notice = new Notice();
		notice.setNo_no(no_no);
		notice.setNo_title(no_title);
		notice.setNo_content(no_content);
		NoticeDao nd = NoticeDao.getInstance();
		int result = nd.update(notice);
		
		request.setAttribute("notice", notice);
		request.setAttribute("result", result);
		request.setAttribute("no_title", no_title);
		request.setAttribute("no_content", no_content);
		request.setAttribute("result", result);
		
		return "/notice/notice_update";
	}

}
