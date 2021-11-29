package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class UpdatePassForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		return "/member/updatePassResult";
	}
}