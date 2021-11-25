package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.main.CommandProcess;

public class AdminSearchDelete implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String m_id = request.getParameter("m_id");
		String pageNum = request.getParameter("pageNum");
		String part = request.getParameter("part"); // 검색 분류
		String searchData = request.getParameter("searchData"); // 검색단어
		
		MemberDao md = MemberDao.getInstance();
		int result = md.delete(m_id);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("part", part);
		request.setAttribute("searchData", searchData);
		
		return "/admin/admin_search_delete";
	}
}