package service.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SupportListDao;
import model.SupportList;
import service.main.CommandProcess;

public class SupportView implements CommandProcess {


	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int sup_no = Integer.parseInt(request.getParameter("sup_no"));
		String pageNum = request.getParameter("pageNum");
		
		SupportListDao supl_d = SupportListDao.getInstance();
		
		int temp = sup_no;
		SupportList sp = supl_d.oneList(temp);

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("sp", sp);
		return "/support/sup_view";
	}
}
