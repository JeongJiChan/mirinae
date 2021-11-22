package service.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeAction implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		return "/main/home";
	}
}
