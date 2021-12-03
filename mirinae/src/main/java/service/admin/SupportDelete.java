package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SupportListDao;
import service.main.CommandProcess;

public class SupportDelete implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int sup_no = Integer.parseInt(request.getParameter("sup_no"));
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		int total_price = Integer.parseInt(request.getParameter("total_price"));
		String pageNum = request.getParameter("pageNum");
		SupportListDao sld = SupportListDao.getInstance();
		
		int result = 0;
		
		result = sld.delete_s(sup_no);
		
		if (result == 1) {
			result = sld.p_del(p_no, total_price);
		}
		if (result == 1) {
			result = sld.delete_sd(sup_no);
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		return "/admin/sup_delete";
	}

}
