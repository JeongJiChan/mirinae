package service.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NoticeDao;
import model.Notice;
import service.main.CommandProcess;

public class NoticeView implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int no_no = Integer.parseInt(request.getParameter("no_no"));
		
		NoticeDao nd = NoticeDao.getInstance();
		
		//조회수 카운트
		nd.viewcountUpdate(no_no);
		
		//데이터 가져오기
		Notice notice = nd.select(no_no);
		
		request.setAttribute("notice", notice);

		return "/notice/notice_view";
		
	}

}
