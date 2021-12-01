package service.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDao;
import dao.ProjectDao;
import model.Notice;
import model.Project;

public class HomeAction implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
//		캐러셀 핫토픽
		ProjectDao pd = ProjectDao.getInstance();
		NoticeDao nd = NoticeDao.getInstance();
		int count = pd.getTotal2();
		int no_count = nd.getTotalN();
		int[] p_no = new int[5];
		int[] no_no = new int[3];
		String[] p_name = new String[5];
		String[] no_title = new String[3];
		Project project = new Project();
		Notice notice = new Notice();
		
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
				int curmoney = project.getCur_money();
				int goalmoney = project.getGoal_money();
				request.setAttribute("finishing_p_no"+(i+1), p_no[i]);
				request.setAttribute("finishing_p_name"+(i+1), p_name[i]);
				request.setAttribute("curmoney"+(i+1), curmoney);
				request.setAttribute("goalmoney"+(i+1), goalmoney);
			}
		} else {
			for(int i = 0; i < count; i++) {
				p_no[i] = pd.finishing_select(i+1);
				project = pd.select(p_no[i]);
				p_name[i] = project.getP_name();
				int curmoney = project.getCur_money();
				int goalmoney = project.getGoal_money();
				request.setAttribute("finishing_p_no"+(i+1), p_no[i]);
				request.setAttribute("finishing_p_name"+(i+1), p_name[i]);
				request.setAttribute("curmoney"+(i+1), curmoney);
				request.setAttribute("goalmoney"+(i+1), goalmoney);
			}
		}
		
//		공지사항
		if(no_count > 2) {
			for(int i = 0; i < 3; i++) {
				no_no[i] = nd.newSelect(i+1);
				notice = nd.select(no_no[i]);
				no_title[i] = notice.getNo_title();
				request.setAttribute("no_no"+(i+1), no_no[i]);
				request.setAttribute("no_title"+(i+1), no_title[i]);
			}
		} else {
			for(int i = 0; i < no_count; i++) {
				no_no[i] = nd.newSelect(i+1);
				notice = nd.select(no_no[i]);
				no_title[i] = notice.getNo_title();
				request.setAttribute("no_no"+(i+1), no_no[i]);
				request.setAttribute("no_title"+(i+1), no_title[i]);
			}
		}
		request.setAttribute("count", count);
		request.setAttribute("no_count", no_count);
		return "/main/home";
	}
}
