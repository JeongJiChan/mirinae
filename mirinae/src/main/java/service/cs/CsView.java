package service.cs;

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

public class CsView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int cs_no = Integer.parseInt(request.getParameter("cs_no"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		CsDao cd = CsDao.getInstance();
		
		
		// 조회수 카운트
		cd.readcountUpdate(cs_no);
				
		// 데이터 가져오기
		Cs cs = cd.select(cs_no);
		
		int m_no, admin_no;
		// 문의글을 조회할 때
		
		String id = (String) session.getAttribute("id");
		String admin_id = (String) session.getAttribute("admin_id");
		
		if(cs.getCs_re_level() == 0) { // 문의글이면(작성자 : 일반회원)
			Member member = cd.select2(cs.getM_no());
			String cs_id = member.getM_id();
			request.setAttribute("cs_id", cs_id);
		};
		
		if(cs.getCs_re_level() == 1) { // 답변글이면(작성자 : 관리자)
			Admin admin = cd.select3(cs.getAdmin_no());
			String cs_admin_id = admin.getAdmin_id();
			request.setAttribute("cs_admin_id", cs_admin_id);
		};
		
		
		request.setAttribute("id", id);
		request.setAttribute("admin_id", admin_id);
		
	
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("cs_no", cs_no);
		request.setAttribute("cs", cs);
		return "cs/cs_view";
	}

}
