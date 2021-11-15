package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.main.CommandProcess;

public class MyPage implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		return "/member/my_page";
	}

}
