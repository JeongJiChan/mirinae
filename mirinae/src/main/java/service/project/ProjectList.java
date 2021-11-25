package service.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProjectDao;
import model.Project;
import service.main.CommandProcess;

public class ProjectList implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		final int ROW_PER_PAGE = 9; //한페이지당 9개
		final int PAGE_PER_BLOCK = 5; // 한블럭당 5개의 페이지
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		//시작번호	(페이지번호 - 1) * 페이지당 갯수+ 1	
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		//끝번호 	시작번호 + 페이지당개수 - 1			
		int endRow = startRow + ROW_PER_PAGE - 1;
		ProjectDao pd = ProjectDao.getInstance();
		int total = pd.getTotal();  
		int number = total - startRow + 1;
		List<Project> project = pd.list(startRow,endRow);  
//		(double) 나눗셈 결과를 실수로 바꾸기 위해 사용 적지 않으면 소숫점 이하가 사라진다.
		int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE); //총 페이지
		//시작페이지	현재페이지 - (현재페이지 - 1)%10				
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
//		끝페이지	시작페이지 + 블록당페이지 수 -1				
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		//총 페이지 수보다 큰 endPage는 나올 수 없다;
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		request.setAttribute("number", number);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("project", project);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);
		return "/project/p_list";
	}

}
