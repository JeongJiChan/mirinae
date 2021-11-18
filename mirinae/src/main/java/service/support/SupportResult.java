package service.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SupportDao;
import dao.SupportDetailDao;
import model.Support;
import model.SupportDetail;
import service.main.CommandProcess;

public class SupportResult implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		String sup_name = request.getParameter("sup_name");
		String sup_tel = request.getParameter("sup_tel");
		String sup_address = request.getParameter("address");
		String address_d = request.getParameter("address_detail");
		String[] opt_code = request.getParameterValues("opt_code");
		String[] supd_cnt = request.getParameterValues("supd_cnt");
		
		int result = 0;
		Support support = new Support();
		SupportDao sup_d = SupportDao.getInstance();
		int sup_no = sup_d.setSup_no();
		support.setSup_no(sup_no);
		support.setM_no(m_no);
		support.setSup_address(sup_address);
		support.setAddress_d(address_d);
		support.setSup_tel(sup_tel);
		support.setSup_name(sup_name);
		
		sup_d.insert(support);
		
		SupportDetail detail = new SupportDetail();
		SupportDetailDao supd_d = SupportDetailDao.getInstance();
		if (result == 1) {
			int supd_no = supd_d.setSupd_no();
			support.setSup_no(sup_no);
			for (int i = 0; i < opt_code.length; i++ ) {
				int opt_codeInt = Integer.valueOf(opt_code[i]);
				int supd_cntInt = Integer.valueOf(supd_cnt[i]);
				detail.setSupd_no(supd_no);
				detail.setOpt_code(opt_codeInt);
				detail.setSupd_cnt(supd_cntInt);
				detail.setSup_no(sup_no);
			}
		}
		supd_d.insert(detail);
		
		request.setAttribute("result", result);
		return "/support/sup_result";
	}
}
