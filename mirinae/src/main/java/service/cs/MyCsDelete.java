package service.cs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CsDao;
import service.main.CommandProcess;

public class MyCsDelete implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cs_no = Integer.parseInt(request.getParameter("cs_no"));
		String pageNum = request.getParameter("pageNum");
		CsDao cd = CsDao.getInstance();
		int result = cd.delete(cs_no);
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return "cs/my_cs_delete";
	}

}
