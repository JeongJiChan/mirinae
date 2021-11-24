package service.support;


import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SupportDao;
import service.main.CommandProcess;

public class SupportForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
//		받아 옴 프로젝트번호 프로젝트명 회원번호 옵션명 수량 총 금액
//		입력 받아 support로 보냄 프로젝트 받는 분, 프로젝트 받는 분 전화번호, 프로젝트 받는 분 주소/상세주소
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		String[] opt_code = request.getParameterValues("opt_code");
		String[] supd_cnt = request.getParameterValues("supd_cnt");
		
		SupportDao sup_d = SupportDao.getInstance();
		String result = "";
		String opt_name = "";
		int opt_price;
		int[] opt_prices;
		opt_prices = new int [opt_code.length];
		for(int i = 0; i < opt_code.length; i++) {
				opt_name += sup_d.getOpt_name(opt_code[i]) + ",";
				opt_price = sup_d.getOpt_price(opt_code[i]);
				opt_prices[i] = opt_price;
		}
		
		String[] opt_names = opt_name.substring(0, opt_name.length()).split(",");

		int[] oc_price = new int[opt_prices.length];
		int total_price = 0;
		for(int i = 0; i < opt_prices.length; i++) {
			oc_price[i] = Integer.valueOf(opt_prices[i]) * Integer.valueOf(supd_cnt[i]); 
		}
		for(int i = 0; i < oc_price.length; i++) {
			total_price += Integer.valueOf(oc_price[i]); 
		}
		for(int i = 0; i < opt_code.length; i++) {
			result += opt_names[i] + " x ";
			result += supd_cnt[i] + " : ";
			result += oc_price[i] + "<br>";
		}		
		
		int m_no = sup_d.setM_no(id);
		String p_name = sup_d.getP_name(p_no);
		
		String a = Arrays.toString(opt_code);
		String b = Arrays.toString(supd_cnt);
		String c = Arrays.toString(opt_prices);
		request.setAttribute("p_name", p_name);
		request.setAttribute("p_no", p_no);
		request.setAttribute("m_no", m_no);
		request.setAttribute("opt_code", a);
		request.setAttribute("supd_cnt", b);
		request.setAttribute("opt_price", c);
		request.setAttribute("result", result);
		request.setAttribute("total_price", total_price);
		return "/support/sup_form";
	}
}