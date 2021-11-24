package service.cs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CsDao;
import model.Cs;
import service.main.CommandProcess;

public class CsReWriteForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int cs_no = Integer.parseInt(request.getParameter("cs_no"));
		CsDao cd = CsDao.getInstance();
		Cs cs = cd.select(cs_no);
		String cs_title = cs.getCs_title();
		
		request.setAttribute("cs_title", cs_title);
		request.setAttribute("cs_no", cs_no);
		return "cs/cs_rewriteForm";
	}

}
