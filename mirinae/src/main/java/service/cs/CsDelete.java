package service.cs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CsDao;
import service.main.CommandProcess;

public class CsDelete implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cs_ref = Integer.parseInt(request.getParameter("cs_ref"));
		String pageNum = request.getParameter("pageNum");
		CsDao cd = CsDao.getInstance();
		int result = cd.delete(cs_ref);
		System.out.println();
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return "cs/cs_delete";
	}

}
