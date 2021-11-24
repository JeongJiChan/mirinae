package service.cs;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDao;
import dao.CsDao;
import dao.MemberDao;
import model.Admin;
import model.Cs;
import model.Member;
import service.main.CommandProcess;

public class CsList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if(session.getAttribute("id") != null) {
			String m_id = (String) session.getAttribute("id");
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(m_id);
			int m_no = member.getM_no();
			request.setAttribute("m_no", m_no);
		}
		
		if(session.getAttribute("admin_id") != null) {
			String admin_id = (String)session.getAttribute("admin_id");
			AdminDao ad = AdminDao.getInstance();
			Admin admin = ad.ad_select(admin_id);
			int admin_no = admin.getAdmin_no();
			request.setAttribute("admin_no", admin_no);
		}
		

		CsDao cd = CsDao.getInstance();
		
		
		final int ROW_PER_PAGE = 15; // 한 페이지에 게시글 6개 씩
		final int PAGE_PER_BLOCK = 5; // 한 블럭에 5페이지 씩
		
		String pageNum = request.getParameter("pageNum"); // 페이지 번호
		if (pageNum == null || pageNum.equals("")) // 페이지 초기값 1로 설정
			pageNum = "1";
		
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지
		
		int total = cd.getTotalB(); // 총 게시글 수
		int totalPage = (int) Math.ceil((double)total/ROW_PER_PAGE); // 총 페이지 수
		
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작 번호(변수 num의 제일 마지막)
		int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호(변수 num = 1)

		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
		int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지
		if (endPage > totalPage) endPage = totalPage;
		
		
		List<Cs> list = cd.list(startRow, endRow); // order by bno (최신순)
		
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("totalPage", totalPage);
		
		
		return "cs/cs_list";
	}

}
