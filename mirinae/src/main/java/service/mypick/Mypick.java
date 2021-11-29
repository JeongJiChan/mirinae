package service.mypick;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MypickDao;
import service.main.CommandProcess;

public class Mypick implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		
		System.out.println("p_no = "+p_no);
		// 마이픽 조회
		MypickDao md = MypickDao.getInstance();
		int mypick=0;
		String imgSrc = "";
		String msg = "";
		mypick = md.count(id, p_no);
		
		System.out.println("id = "+id);
		System.out.println("p_no = "+p_no);
		System.out.println("mypick = "+mypick);
		
		if(mypick > 0 ) { // 마이픽 테이블에 있으면
			md.delete(p_no, id); // 마이픽 삭제
			imgSrc = "/mirinae/images/star-empty.png";
			msg = "마이픽이 삭제되었습니다";
		}else if(mypick == 0 ) {
			md.insert(p_no, id);
			imgSrc = "/mirinae/images/star-fill.png";
			msg = "마이픽이 등록되었습니다";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("imgSrc", imgSrc);
		request.setAttribute("mypick", mypick);
		return "/mypick/mypick";
	}

}
