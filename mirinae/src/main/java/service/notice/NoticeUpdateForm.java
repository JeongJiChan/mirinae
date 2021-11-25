package service.notice;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;
import model.Notice;
import service.main.CommandProcess;

public class NoticeUpdateForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int no_no = Integer.parseInt(request.getParameter("no_no"));
		String no_title = request.getParameter("no_title");
		String admin_id = request.getParameter("admin_id");
		
		Notice notice = new Notice();
		NoticeDao nd = NoticeDao.getInstance();
		notice=nd.select(no_no);
		
		
		request.setAttribute("notice", notice);
		request.setAttribute("admin_id", admin_id);
		return "/notice/notice_updateForm";
	}

}
