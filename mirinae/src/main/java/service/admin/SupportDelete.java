package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SupportDao;
import dao.SupportDetailDao;
import service.main.CommandProcess;

public class SupportDelete implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int sup_no = Integer.parseInt(request.getParameter("sup_no"));
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		int total_price = Integer.parseInt(request.getParameter("total_price"));
		String pageNum = request.getParameter("pageNum");
		SupportDao sup_d = SupportDao.getInstance();
		SupportDetailDao supd_d = SupportDetailDao.getInstance();
		
		int result = 0;
		
		result = sup_d.delete(sup_no);
		System.out.println("result1 : " + result);
		
		if (result == 1) {
			result = supd_d.p_del(p_no, total_price);
			System.out.println("result2 : " + result);
		}
		if (result == 1) {
			result = supd_d.delete(sup_no);
			System.out.println("result3 : " + result);
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		return "/admin/sup_delete";
	}

}
