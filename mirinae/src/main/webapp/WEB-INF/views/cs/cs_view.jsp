<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../../decorator/sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/mirinae/css/bootstrap.css");</style>
<script type="text/javascript">
	// 게시글 삭제
	function delCs() {
		var con = confirm("문의를 삭제하시겠습니까?");
		if(con) {
			location.href="cs_delete.kwon?cs_ref=${cs.cs_ref}&pageNum=${pageNum}";
		}
	}
</script>
<style type="text/css">
table { margin-top: 40px;}
	.caption {	width: 100%;	}
	.underline {border-bottom:1px solid; border-bottom-color: #2c3e50; }
	.topmargin { margin-top: 10px; }
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
</head>
<body>
	<div class="caption">
		<h1 class="bottommargin"
			style="font-size: 56px; line-height: 1.4em; text-align: center;">Customer Service</h1>
	</div>
<table align="center" width="800px;">
				<tr><th class="labeling underlinewhite titleheight">제목</th><td colspan="3" class="leftpadding underlineblack">${cs.cs_title }</td></tr>
	 			<tr><th class="labeling underlinewhite writeheight">작성자</th><td class="leftpadding underlineblack">${cs.cs_writer }</td>
	 			<td class="labelingdate">작성일 : ${cs.cs_reg_date }</td>
	 			<td class="labeling underlinewhite">조회수 : ${cs.cs_view }</td></tr>
				<tr><th class="labeling underlinewhite">내용</th><td colspan="3"><div class="leftpadding textbox underlineblack" style="height: 300px;">${cs.cs_content }</div></td></tr>
</table>	
	<div align="center">
		<button onclick="location.href='cs_list.kwon?pageNum=${pageNum}'" class="btn btn-primary topmargin">목록</button>
		<c:if test="${not empty admin_id && empty id && cs.cs_re_level == 0}">
			<button onclick="location.href='cs_rewriteForm.kwon?cs_no=${cs.cs_no}'" class="btn btn-secondary topmargin">
			답글</button>
		</c:if>
		<c:if test="${id == cs_id && not empty id || not empty admin_id && empty id}" >
				<button onclick="delCs()" class="btn btn-danger topmargin">삭제</button>
		</c:if>
	</div>
	
</body>
</html>