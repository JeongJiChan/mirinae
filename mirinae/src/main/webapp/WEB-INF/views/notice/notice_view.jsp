<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<c:url value="notice_view.la" var="nvu1">
	<c:param name="no_no" value="${no_no}"/>
	<c:param name="pageNum" value="${pageNum}"/>
</c:url>
<head>
<style type="text/css">@import url("/mirinae/css/bootstrap.css");</style>
<style type="text/css">
	#n_list { width: 100%; cursor: pointer; }
	.bottommargin { margin-bottom: 20px;}	
	.labeling {background-color: #2c3e50; color: white; border-radius: 1px;
			 border-collapse: collapse;
 			 border-radius: 10px;
 			 text-align: center;	
 			 width: 15%;
		}
	.labelingdate {background-color: #2c3e50; color: white; border-radius: 1px;
			 border-collapse: collapse;
 			 border-radius: 10px;
 			 text-align: center;	
 			 width: 20%;
		}
	.underlinewhite {border-bottom: 1px solid white; }
	.underlineblack {border-bottom: 1px solid black; }
	.titleheight { height: 35px; }
	.writeheight { height: 30px; }
	.botmar { margin-top: 15px; }
	.textbox {overflow: scroll; overflow-x:hidden; }
	.leftpadding { padding-left: 10px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function List() {
		location.href="notice_list.la?pageNum="+${pageNum};
	}
	function del() {
		var con = confirm("정말 삭제하시겠습니까?");
		if(con){
			location.href="notice_del.la?no_no="+${no_no };		
		}
	}
</script>
</head>
<body>
<div id="n_list">
	<h1 class="n_title bottommargin" style="font-size: 56px; line-height: 1.4em; text-align: center;" onclick="location.href='notice_list.la'">Notice</h1>
</div>
		<form action="notice_updateForm.la" method="post">
			<input type="hidden" name="no_no" value="${notice.no_no }"	>
			<input type="hidden" name="no_title" value="${notice.no_title }">
			<input type="hidden" name="admin_no" value="${writer }">
			<table width="800px;" align= "center">
			<!-- 게시물이 삭제되었을 때 -->
				<c:if test="${no_del == 'y' }">
					<tr><th colspan="4" style="text-align: center;"><h2>삭제된 게시물 입니다.</h2></th></tr>
				</c:if>
				<c:if test="${no_del == 'n' }">
				<tr><th class="labeling underlinewhite titleheight">제목</th><td colspan="3" class="leftpadding underlineblack">${notice.no_title }</td></tr>
	 			<tr><th class="labeling underlinewhite writeheight">작성자</th><td class="leftpadding underlineblack">${writer }</td>
	 			<td class="labelingdate">작성일 : ${notice.no_date }</td>
	 			<td class="labeling underlinewhite">조회수 : ${notice.no_view }</td></tr>
				<tr><th class="labeling underlinewhite">내용</th><td colspan="3"><div class="leftpadding textbox underlineblack" style="height: 300px;">${notice.no_content }</div></td></tr>
				</c:if>
				<tr><th colspan="4">
					<div align="center">

						<!-- 목록버튼 -->
						<input type="button" value="목록" onclick="List()" class="btn btn-primary botmar">			
					<c:if test="${result != 0 && no_del=='n'}">
					<!-- 공지사항 수정 버튼 -->
						<input type="submit" value="수정" class="btn btn-warning botmar" >
					<!-- 공지사항 삭제 버튼 -->
						<input type="button" value="삭제" onclick="del()" class="btn btn-danger botmar">
					</c:if>
				</div>
				</th></tr>
			</table>	
		</form>
</body>
</html>