package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.MemberDao;
import dao.ProjectDao;
import model.Member;
import service.main.CommandProcess;

public class Delete implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberDao md = MemberDao.getInstance();
		ProjectDao pd = ProjectDao.getInstance();
		
		int result = 0;
		
		if(pd.idSearch(id) == 0) {
			result = md.delete(id);
			session.invalidate();
		}
		System.out.println(result);
		request.setAttribute("result", result);
		return "/member/delete";
	}

}
