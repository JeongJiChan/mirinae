<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mirinae</title>
<style type="text/css">
	nav {
		width: 100%;
		display: flex;
		justify-content: center;
		position: relative;
		min-width: 800px;
	}
	
	ul, li {
		margin: 0;
		padding: 0;
		list-style: none;
	}
	
	#main-menu>li {
		float: left;
		position: relative;
	}
	
	#main-menu>li>a {
		font-size: 0.85rem;
		text-align: center;
		text-decoration: none;
		letter-spacing: 0.05em;
		display: block;
		padding: 14px 36px;
		color: black;
	}
	
	#sub-menu {
		position: absolute;
		opacity: 0;
		visibility: hidden;
		transition: all 0.15s ease-in;
	}
	
	#sub-menu>li {
		padding: 10px 31px;
		font-size: 10pt;
		background: white;
	}
	
	#sub-menu>li>a {
		text-decoration: none;
		color: black;
	}
	
	#main-menu>li:hover #sub-menu {
		opacity: 1;
		visibility: visible;
	}
	
	#sub-menu>li>a:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
	<nav role="navigation">
		<ul id="main-menu">
			<li><a href="home.do">로고</a></li>
			<li><a href="/mirinae/views/project/p_uploadForm.do">프로젝트 등록</a></li>
			<li><a href="/mirinae/views/project/p_list.do">프로젝트 목록</a>
				<ul id="sub-menu">
					<li><a href="/mirinae/views/project/p_list.do?cate=1">카테고리1</a></li>
					<li><a href="/mirinae/views/admin/notice.do?cate=2">카테고리2</a></li>
					<li><a href="/mirinae/views/admin/notice.do?cate=3">카테고리3</a></li>
					<li><a href="/mirinae/views/admin/notice.do?cate=4">카테고리5</a></li>
					<li><a href="/mirinae/views/admin/notice.do?cate=5">카테고리5</a></li>
				</ul></li>
			<li><a>게시판</a>
				<ul id="sub-menu">			<!-- notice/notice_list.do -->
					<li><a href="/mirinae/views/admin/notice.do">공지사항</a></li>
					<li><a href="/mirinae/views/admin/customor_service.do">고객문의</a></li>
				</ul></li>
			<c:if test="${empty id}">
				<li><a href="/mirinae/views/member/loginForm.do">로그인</a></li>
				<li><a href="/mirinae/views/member/joinForm.do">회원가입</a></li>
			</c:if>
			<c:if test="${not empty id}">
				<c:if test="${id != master }">
					<li><a href="/mirinae/views/member/logout.do">로그아웃</a></li>
					<li><a href="/mirinae/views/member/my_page.do">마이페이지</a></li>
				</c:if>
				<c:if test="${id = master }">
					<li><a href="/mirinae/views/member/logout.do">로그아웃</a></li>
					<li><a href="/mirinam/views/admin/admin_page.do">관리자페이지</a></li>
				</c:if>
			</c:if>
		</ul>
	</nav>
</body>
</html>