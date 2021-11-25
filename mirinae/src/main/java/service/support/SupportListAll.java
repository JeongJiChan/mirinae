package service.support;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SupportDao;
import dao.SupportListDao;
import model.Support;
import model.SupportList;
import service.main.CommandProcess;

public class SupportListAll implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		SupportDao sd = SupportDao.getInstance();
		SupportListDao sld = SupportListDao.getInstance();
		
		int m_no = sd.setM_no(id);
		
		final int ROW_PER_PAGE = 10; // 한 페이지에 게시글 10개 씩
		final int PAGE_PER_BLOCK = 5; // 한 블럭에 5페이지 씩 
		
		String pageNum = request.getParameter("pageNum"); // 페이지 번호
		if (pageNum == null || pageNum.equals("")) // 페이지 초기값 1로 설정
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지

		int totalN = sd.getTotalN(m_no); // 삭제되지 않은 총 게시글 수 (del='n')
		int totalPage = (int) Math.ceil((double)totalN/ROW_PER_PAGE); // 총 페이지 수
		
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작 번호(변수 num의 제일 마지막)
		int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호(변수 num = 1)

		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
		int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지
		
		if (endPage > totalPage) endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우
		
		List<SupportList> sp_list = new ArrayList<SupportList>();
		List<Integer> sup_no = sd.getSup_no(m_no);
		Iterator<Integer> it = sup_no.iterator();
		
		while(it.hasNext()) {
			int temp = it.next();
			sp_list.addAll((List<SupportList>)sld.list(temp));
		}

		List<Support> s_list = sd.s_list(startRow, endRow, m_no);
		request.setAttribute("totalN", totalN);
		request.setAttribute("s_list", s_list);
		request.setAttribute("sp_list", sp_list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		return "/support/sup_list";
	}
}