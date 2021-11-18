package service.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;
import service.main.CommandProcess;

public class NoticeDel implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int no_no = Integer.parseInt(request.getParameter("no_no"));
		NoticeDao nd = NoticeDao.getInstance();
		
		int result = 0;
		result = nd.del(no_no);
		
		request.setAttribute("result", result);
		return "/notice/notice_del";
	}  

}
