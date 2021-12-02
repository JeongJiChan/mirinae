package service.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.NoticeDao;
import model.Notice;
import service.main.CommandProcess;

public class NoticeAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("admin_id");
		
		NoticeDao nd = NoticeDao.getInstance();
		
		//admin ID 체크
		int result =0;
		if(id != null) 
			result = nd.adminChk(id);
		
		final int ROW_PER_PAGE = 10; // 한 페이지에 게시글 10개 씩
		final int PAGE_PER_BLOCK = 5; // 한 블럭에 5페이지 씩 
		
		String pageNum = request.getParameter("pageNum"); // 페이지 번호
		if (pageNum == null || pageNum.equals("")) // 페이지 초기값 1로 설정
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지

		int total = nd.getTotal(); // 총 게시글 수
		int totalN = nd.getTotalN(); // 삭제되지 않은 총 게시글 수 (no_del='n')
		int totalPage = (int) Math.ceil((double)totalN/ROW_PER_PAGE); // 총 페이지 수
		
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작 번호(변수 num의 제일 마지막)
		int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호(변수 num = 1)

		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
		int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지
		
		if (endPage > totalPage) endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우
		
		int number = totalN - startRow+1;
		List<Notice> list = nd.list(startRow, endRow);
		request.setAttribute("result", result);
		request.setAttribute("totalN", totalN);
		request.setAttribute("total", total);
		request.setAttribute("number", number);
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);	
		
		return "/notice/notice_list";
	}

}
