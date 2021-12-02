package service.support;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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

		List<Integer> op_list = supl_d.op_list(temp);
		List<Integer> sup_cnt = supl_d.cnt_list(temp);
		Iterator<Integer> it = op_list.iterator();
		Iterator<Integer> cnt = sup_cnt.iterator();
		
		String[] opt_name = new String[op_list.size()];
		int[] counts = new int[op_list.size()];
		int[] opt_price = new int[op_list.size()];
		int[] oc_price = new int[op_list.size()];

		String result = "";
		
		while (it.hasNext()) {
			for (int i = 0; i < op_list.size(); i++) {
				int op_code = it.next();
				int count = cnt.next();
				opt_name[i] = (String)supl_d.opt_name(op_code);
				counts[i] = count;
				opt_price[i] = supl_d.price_list(op_code);
			}
		}
		for(int i = 0; i < opt_price.length; i++) {
			oc_price[i] = opt_price[i] * counts[i]; 
		}		
		for (int i = 0; i < opt_name.length; i++) {
			result += opt_name[i] + " x ";
			result += counts[i] + " : ";
			result += oc_price[i] + "원<br>";
		}

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("sp", sp);
		request.setAttribute("result", result);
		return "/support/sup_view";
	}
}
