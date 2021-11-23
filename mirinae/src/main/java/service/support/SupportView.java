package service.support;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SupportDao;
import dao.SupportDetailDao;
import model.Support;
import model.SupportDetail;
import service.main.CommandProcess;

public class SupportView implements CommandProcess {


	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int sup_no = Integer.parseInt(request.getParameter("sup_no"));
		String pageNum = request.getParameter("pageNum");
		
		SupportDao sup_d = SupportDao.getInstance();
		SupportDetailDao supd_d = SupportDetailDao.getInstance();
		
		Support support = sup_d.select(sup_no);
		List<SupportDetail> list = supd_d.select(sup_no);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("support", support);
		request.setAttribute("list", list);
		return "/support/sup_view";
	}
}
