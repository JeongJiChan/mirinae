package service.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MypickDao;
import dao.NoticeDao;
import dao.OptionsDao;
import dao.ProjectDao;
import model.Options;
import model.Project;
import service.main.CommandProcess;

public class ProView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		ProjectDao pd = ProjectDao.getInstance();
		pd.p_viewUpload(p_no);
		Project project = pd.proview(p_no);
		OptionsDao od = OptionsDao.getInstance();
		List<Options> options = od.optionsList(p_no);
		
		int mypick=0;
		String imgSrc="";
		if(id != null) {
			MypickDao md = MypickDao.getInstance();
			mypick = md.count(id,p_no);
			if(mypick > 0 ) {
				imgSrc = "/mirinae/images/star-fill.png";
			}else if (mypick == 0) {
				imgSrc = "/mirinae/images/star-empty.png";
			}
		} else {
			imgSrc = "/mirinae/images/star-empty.png";
		}
		
		request.setAttribute("imgSrc", imgSrc);
		request.setAttribute("mypick", mypick);
		request.setAttribute("project", project);
		request.setAttribute("options", options);
		return "/project/p_view";
	}

}
