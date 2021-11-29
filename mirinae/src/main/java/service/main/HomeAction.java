package service.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjectDao;

public class HomeAction implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		ProjectDao pd = ProjectDao.getInstance();
		int p_no1 = pd.hot_select1();
		int p_no2 = pd.hot_select2();
		int p_no3 = pd.hot_select3();
		int p_no4 = pd.hot_select4();
		int p_no5 = pd.hot_select5();
		request.setAttribute("p_no1", p_no1);
		request.setAttribute("p_no2", p_no2);
		request.setAttribute("p_no3", p_no3);
		request.setAttribute("p_no4", p_no4);
		request.setAttribute("p_no5", p_no5);
		return "/main/home";
	}
}
