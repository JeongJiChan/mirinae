package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SupportListDao;
import model.SupportList;
import service.main.CommandProcess;

public class SupportView implements CommandProcess {


	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int sup_no = Integer.parseInt(request.getParameter("sup_no"));
		
		
		SupportListDao supl_d = SupportListDao.getInstance();
		
		int temp = sup_no;
		SupportList sp = supl_d.oneList(temp);

		request.setAttribute("sp", sp);
		return "/admin/sup_view";
	}
}
