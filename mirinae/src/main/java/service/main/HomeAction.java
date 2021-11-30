package service.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjectDao;

public class HomeAction implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		ProjectDao pd = ProjectDao.getInstance();
		int count = pd.getTotal();
		int[] p_no = new int[5];
		if(count > 4) {
			for(int i = 0; i < 5; i++) {
				p_no[i] = pd.hot_select(i+1);
				request.setAttribute("p_no"+(i+1), p_no[i]);
			}
		} else {
			for(int i = 0; i < count; i++) {
				p_no[i] = pd.hot_select(i+1);
				request.setAttribute("p_no"+(i+1), p_no[i]);
			}
		}
		return "/main/home";
	}
}
