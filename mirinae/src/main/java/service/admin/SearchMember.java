package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class SearchMember implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		final int ROW_PER_PAGE = 10; // 한페이지당 몇개의 데이터
		final int PAGE_PER_BLOCK = 5; // 블럭당 숫자 갯수
		
		String part = request.getParameter("part"); // 검색 분류
		String searchData = request.getParameter("searchData"); // 검색단어
		
		System.out.println(part);
		System.out.println(searchData);
		
		String pageNum = request.getParameter("pageNum"); // 페이지 번호
		if (pageNum == null || pageNum.equals("")) pageNum="1"; // 페이지 초기값을 1로 설정
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지
		MemberDao md = MemberDao.getInstance();
		
		int total = md.getTotal(); // 총 회원수
		int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE); // 총 페이지 수
		
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작번호
		int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호
		
		int startPage = currentPage - (currentPage-1)%PAGE_PER_BLOCK; // 한 블럭당 시작 페이지(1, 11, 21, ...)
		int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭당 마지막 페이지
		if(endPage > totalPage) endPage = totalPage;
		
		List<Member> search_list = md.search_list(startRow, endRow, part, searchData);
		
		request.setAttribute("search_list", search_list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("totalPage", totalPage);
		
		
		return "/admin/member_search";
	}

}
