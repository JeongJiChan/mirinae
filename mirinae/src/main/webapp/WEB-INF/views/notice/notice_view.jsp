<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.nv_btn {float: left; margin:50px;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="n_view">
	<table>
		<tr><th>제목</th><td colspan="2">${notice.no_title }</td></tr>
		<tr><th>작성자</th><td>${notice.admin_no }</td><td>조회수 ${notice.no_view }</td></tr>
		<tr><th>내용</th><td colspan="2"><textarea cols="5" rows="">${notice.no_content }</textarea></td></tr>
	</table>
</div>
<div id="n_viewBtn">
	<div class="nv_btn"><a href="notice_view.la?no_no=${notice.no_no}">previous</a></div>
	<div class="nv_btn"><a href="notice_list.la?pageNum=${pageNum}">list</a></div>
	<div class="nv_btn"><a href="notice_view.la?no_no=${notice.no_no}">next</a></div>
</div>
</body>
</html>