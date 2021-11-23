package service.cs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CsDao;
import dao.MemberDao;
import model.Cs;
import service.main.CommandProcess;

public class CsView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cs_no = Integer.parseInt(request.getParameter("cs_no"));
		
		CsDao cd = CsDao.getInstance();
		// 조회수 카운트
		cd.readcountUpdate(cs_no);
		
		// 데이터 가져오기
		Cs cs = cd.select(cs_no);
		

		/*
		 * int m_no = cs.getM_no(); // cs에 저장된 m_no MemberDao md =
		 * MemberDao.getInstance(); String cs_nick = md.selectNick(m_no);
		 */
		
		request.setAttribute("cs_no", cs_no);
		request.setAttribute("cs", cs);
		/* request.setAttribute("cs_nick", cs_nick); */
		
		return "cs/cs_view";
	}

}
