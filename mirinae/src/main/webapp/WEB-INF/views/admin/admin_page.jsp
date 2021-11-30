<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h2, h4 { margin: 40pt; }
	a { text-decoration: none; color: black; }
	a:hover { color: #f39c12; }
	.del:hover { cursor: pointer; }
	.mypageTop { margin-top: 50pt; }
</style>
</head>
<body>
	<div class="mypageTop" align="center">
	<h2>관리자 페이지</h2>
	<h4><a href="/mirinae/views/admin/member_list.sun">회 원 목 록</a></h4>
	<h4><a href="/mirinae/views/admin/project_list.kwon">프 로 젝 트 목 록</a></h4>
	<h4><a href="/mirinae/views/admin/support_list.kwon">후 원 목 록</a></h4>
	</div>
</body>
</html>