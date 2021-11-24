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

public class MyCsView implements CommandProcess {

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

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("cs_no", cs_no);
		request.setAttribute("cs", cs);
		return "cs/my_cs_view";
	}

}
