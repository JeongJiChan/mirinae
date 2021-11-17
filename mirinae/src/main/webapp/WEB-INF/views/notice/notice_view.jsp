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
<style type="text/css">
	#n_list { width: 100%; cursor: pointer; }
	div.nv_btn {width:60px; float: left; margin:25px; text-align: center;
		font-style: Sans-Serif}
	textarea {width: 80%; height:300px; resize:none;}
	a:link { color: red; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
	a:hover { color: blue; font-weight: bold;}
	
	.btnDiv {display: flex;}
	div#n_viewBtn{margin: auto;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="n_list">
	<h1 class="n_title" style="text-align:center" onclick="location.href='notice_list.la'">Notice</h1>
</div>
<c:if test="${no_del == 'n'}">
	<div id="n_view">
		<table width="60%" align= "center" >
			<tr><th>제목</th><td colspan="2">${notice.no_title }</td></tr>
 			<tr><th>작성자</th><td>${notice.admin_no }</td><td>조회수 ${notice.no_view }</td></tr>
			<tr><th>내용</th><td colspan="2"><textarea cols="5" rows="" readonly="readonly">${notice.no_content }</textarea></td></tr>
		</table>
	</div>
</c:if>

<!-- 게시물이 삭제되었을 때 -->
<c:if test="${no_del == 'y' }">
	<div>삭제된 게시물 입니다.</div>
</c:if>
<div class="btnDiv">
	<div id="n_viewBtn">
		<c:if test="${no_no>1 }">
			<div class="nv_btn"><a href="notice_view.la?no_no=${notice.no_no-1}">Previous</a></div>
		</c:if>
		<c:if test="${no_no==1 }">
			<div class="nv_btn"></div>
		</c:if>
		
			<div class="nv_btn"><a href="notice_list.la?pageNum=${pageNum}">List</a></div>
		
		<c:if test="${no_no<total }">
			<div class="nv_btn"><a href="notice_view.la?no_no=${notice.no_no+1}">Next</a></div>
		</c:if>
		<c:if test="${no_no==total }">
			<div class="nv_btn"></div>
		</c:if>
	</div>
</div>
</body>
</html>