package service.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;
import model.Notice;
import service.main.CommandProcess;

public class NoticeView implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int no_no = Integer.parseInt(request.getParameter("no_no"));
		String pageNum = request.getParameter("pageNum");
		NoticeDao nd = NoticeDao.getInstance();
		
		// 총 게시글 수
		int total = nd.getTotalN(); 
		//조회수 카운트
		nd.viewcountUpdate(no_no);
			
		//데이터 가져오기
		Notice notice = nd.select(no_no);
		String no_del = notice.getNo_del();
		
		System.out.println(no_no);
		System.out.println(total);
		
		request.setAttribute("no_no", no_no);
		request.setAttribute("total", total);
		request.setAttribute("no_del", no_del);
		request.setAttribute("notice", notice);
		request.setAttribute("pageNum", pageNum);
		return "/notice/notice_view";
		
	}

}
