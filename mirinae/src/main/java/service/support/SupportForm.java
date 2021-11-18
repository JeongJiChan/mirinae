package service.support;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Options;
import service.main.CommandProcess;

public class SupportForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
//		받아 옴 프로젝트번호 프로젝트명 회원번호 옵션명 수량 총 금액
//		입력 받아 support로 보냄 프로젝트 받는 분, 프로젝트 받는 분 전화번호, 프로젝트 받는 분 주소/상세주소
		String p_name = request.getParameter("p_name");
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		String[] opt_code = request.getParameterValues("opt_cod");
		String[] opt_name = request.getParameterValues("opt_name");
		String[] opt_price = request.getParameterValues("opt_price");
		String[] supd_cnt = request.getParameterValues("supd_cnt");
		String result = "";
		int[] oc_price = new int[opt_name.length];
		int total_price = 0;
		for(int i = 0; i < opt_name.length; i++) {
			oc_price[i] = Integer.valueOf(opt_price[i]) * Integer.valueOf(supd_cnt[i]); 
		}
		for(int i = 0; i < oc_price.length; i++) {
			total_price += Integer.valueOf(oc_price[i]); 
		}
		for(int i = 0; i < opt_name.length; i++) {
			result += opt_name[i] + " x ";
			result += supd_cnt[i] + " : ";
			result += oc_price[i] + "<br>";
		}
		request.setAttribute("p_name", p_name);
		request.setAttribute("m_no", m_no);
		request.setAttribute("opt_code", opt_code);
		request.setAttribute("supd_cnt", supd_cnt);
		request.setAttribute("result", result);
		request.setAttribute("total_price", total_price);
		return "/support/sup_form";
	}
}