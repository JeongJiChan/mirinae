package service.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDao;
import dao.NoticeDao;
import model.Notice;
import service.main.CommandProcess;

public class NoticeView implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("admin_id");
		
		int no_no = Integer.parseInt(request.getParameter("no_no"));
		String pageNum = request.getParameter("pageNum");

		NoticeDao nd = NoticeDao.getInstance();
		
		// 총 게시글 수
		int total = nd.getTotal(); 
		int totalN = nd.getTotalN(); 
		//조회수 카운트
		nd.viewcountUpdate(no_no);
			
		//데이터 가져오기
		Notice notice = nd.select(no_no);
		String no_del = notice.getNo_del();
		AdminDao ad = AdminDao.getInstance();
		String writer = ad.ad_selectN(no_no);
		
		//admin ID 체크
		int result =0;
		if(id != null) 
			result = nd.adminChk(id);
		
		//해당글의 페이지번호 조회
		int curPageNum = 1;
		final int ROW_PER_PAGE = 10; // 한 페이지에 게시글 10개 씩
		totalN = nd.getTotalN(); // 삭제되지 않은 총 게시글 수 (no_del='n')
		if( no_del.equals("n")) {
			int cul_no = nd.curPageNum(no_no);
			curPageNum = (totalN-cul_no) / ROW_PER_PAGE;
		}
		
		request.setAttribute("curPageNum", curPageNum);
		request.setAttribute("writer", writer);
		request.setAttribute("admin_id", id);
		request.setAttribute("result", result);
		request.setAttribute("no_no", no_no);
		request.setAttribute("total", total);
		request.setAttribute("totalN", totalN);
		request.setAttribute("no_del", no_del);
		request.setAttribute("notice", notice);
		request.setAttribute("pageNum", pageNum);
		return "/notice/notice_view";
		
	}

}
