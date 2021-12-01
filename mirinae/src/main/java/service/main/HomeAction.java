package service.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjectDao;
import model.Project;

public class HomeAction implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
//		캐러셀 핫토픽
		ProjectDao pd = ProjectDao.getInstance();
		int count = pd.getTotal2();
		int[] p_no = new int[5];
		String[] p_name = new String[5];
		Project project = new Project();
		
		if(count > 4) {
			for(int i = 0; i < 5; i++) {
				p_no[i] = pd.hot_select(i+1);
				project = pd.select(p_no[i]);
				p_name[i] = project.getP_name();
				request.setAttribute("hot_p_no"+(i+1), p_no[i]);
				request.setAttribute("hot_p_name"+(i+1), p_name[i]);
			}
		} else {
			for(int i = 0; i < count; i++) {
				p_no[i] = pd.hot_select(i+1);
				project = pd.select(p_no[i]);
				p_name[i] = project.getP_name();
				request.setAttribute("hot_p_no"+(i+1), p_no[i]);
				request.setAttribute("hot_p_name"+(i+1), p_name[i]);
			}
		}
		
//		달성률 높은 프로젝트
		if(count > 4) {
			for(int i = 0; i < 5; i++) {
				p_no[i] = pd.finishing_select(i+1);
				project = pd.select(p_no[i]);
				p_name[i] = project.getP_name();
				request.setAttribute("finishing_p_no"+(i+1), p_no[i]);
				request.setAttribute("finishing_p_name"+(i+1), p_name[i]);
			}
		} else {
			for(int i = 0; i < count; i++) {
				p_no[i] = pd.finishing_select(i+1);
				project = pd.select(p_no[i]);
				p_name[i] = project.getP_name();
				request.setAttribute("finishing_p_no"+(i+1), p_no[i]);
				request.setAttribute("finishing_p_name"+(i+1), p_name[i]);
			}
		}
		
		System.out.println(p_name[0]);
		
		return "/main/home";
	}
}
