package service.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.main.CommandProcess;

public class NoticeWrite implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "/notice/notice_write";
	}

}
