package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class SearchMember implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
//		String part = request.getParameter("part");
		String searchData = request.getParameter("searchData");
//		System.out.println(part);
		System.out.println(searchData);
		MemberDao md = MemberDao.getInstance();
//		List<Member> list = md.s_id(part, searchData);
//		request.setAttribute("list", list);
		return "/admin/member_list";
	}

}
