package service.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.main.CommandProcess;

public class SupportForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
//		프로젝트명 옵션명 수량 총 금액
		return "/support/sup_form";
	}
}
