<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>${member.m_name }님 환영!</h2>
	<h2><a href="/mirinae/">마이픽 프로젝트</a></h2>
	<h2><a href="/mirinae/">내가 등록한 프로젝트</a></h2>
	<h2><a href="/mirinae/">내가 후원한 프로젝트</a></h2>
	<h2><a href="/mirinae/">고객 문의 내역</a></h2>
	<h2><a href="updateForm.sun">회원 수정</a></h2>
	<h2><a href="/mirinae/">회원 탈퇴</a></h2>
</body>
</html>