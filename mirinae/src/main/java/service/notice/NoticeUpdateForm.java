package service.notice;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Notice;
import service.main.CommandProcess;

public class NoticeUpdateForm implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int no_no = Integer.parseInt(request.getParameter("no_no"));
		String no_title = request.getParameter("no_title");
		String no_content = request.getParameter("no_content");
		int admin_no = Integer.parseInt(request.getParameter("admin_no"));
		
		Notice notice = new Notice();
		
		notice.setNo_content(no_content);
		notice.setAdmin_no(admin_no);
		notice.setNo_no(no_no);
		notice.setNo_title(no_title);
		
		request.setAttribute("notice", notice);
		return "/notice/notice_updateForm";
	}

}
