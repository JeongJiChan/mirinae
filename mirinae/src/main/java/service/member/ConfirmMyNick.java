package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class ConfirmMyNick implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String m_id = (String)session.getAttribute("id"); // 세션에 있는 id가져옴
		String new_nick = request.getParameter("m_nick"); // 수정폼에서 input에 쓴 닉네임
		String msg = "";
		
		MemberDao md = MemberDao.getInstance();
		String my_nick = md.ud_nick_Chk(m_id); // 세션id를 가지고 닉네임 조회
		Member member = md.nick_Chk(new_nick);
		
		if(my_nick.equals(new_nick)) msg = "2"; // input에 새로 입력한 닉네임과 기존 닉네임 같을 경우
		else if(member != null) msg = "1"; // 기존 닉네임이랑 다르지만, 닉네임 중복
		else msg = "0"; // input에 새로 입력한 닉네임과 기존 닉네임이 다르고, 닉네임은 중복되지 않은 경우 
		
		request.setAttribute("msg", msg);
		return "/member/confirmMyNick";
	}

}
