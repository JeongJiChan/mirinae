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
	
/* 	uploadForm.jsp css ---------------------------------------------------- */
		th { border: 1px solid black;}
		td { border: 1px solid black;}
		#picture_table { width: 35%; float: left; table-layout: fixed; }
		#picture { border: 1px solid black; width: 100%; height: 300px; }
		#project_table { width: 60%;  float: left; }
		#option_table {  border: 1px solid black; width: 59.8%;  float: left; overflow: hidden; table-layout: fixed; }
		#button { clear: both; }
		.title { height: 35px; }
		.option_list { border: 0px; }
		.option_list1 { width:70%; border-bottom: 1px solid black; border-right: 1px solid black; }
		.option_list2 { border-bottom: 1px solid black; border-left: 1px solid black; }
		.option_list3 { height: 95px; }
		#opt_divN { height: 95px; overflow: auto; }
		#opt_divP { height: 95px; overflow: auto; }
/*--------------------------------------------------------------------  */
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<nav role="navigation">
		<a href="/mirinae/views/main/home.chan"><img alt="" src="/mirinae/images/milkyway.png" width="100px"></a><p>Mirinae</p>
		<ul id="main-menu">
			<li><a href="/mirinae/views/project/p_uploadForm.kim">프로젝트 등록</a></li>
			<li><a href="/mirinae/views/project/p_list.chan">프로젝트 목록</a>
				<ul id="sub-menu">
					<li><a href="/mirinae/views/project/p_list.chan?cate=1">카테고리1</a></li>
					<li><a href="/mirinae/views/admin/notice.chan?cate=2">카테고리2</a></li>
					<li><a href="/mirinae/views/admin/notice.chan?cate=3">카테고리3</a></li>
					<li><a href="/mirinae/views/admin/notice.chan?cate=4">카테고리5</a></li>
					<li><a href="/mirinae/views/admin/notice.chan?cate=5">카테고리5</a></li>
				</ul></li>
			<li><a>게시판</a>
				<ul id="sub-menu">			<!-- notice/notice_list.do -->
					<li><a href="/mirinae/views/notice/notice_list.la">공지사항</a></li>
					<li><a href="/mirinae/views/admin/customor_service.chan">고객문의</a></li>
				</ul></li>
			<c:if test="${empty id}">
				<li><a href="/mirinae/views/member/loginForm.sun">로그인</a></li>
				<li><a href="/mirinae/views/member/joinForm.sun">회원가입</a></li>
			</c:if>
			<c:if test="${not empty id}">
				<c:if test="${id != master }">
					<li><a href="/mirinae/views/member/logout.sun">로그아웃</a></li>
					<li><a href="/mirinae/views/member/my_page.chan">마이페이지</a></li>
				</c:if>
				<c:if test="${id = master }">
					<li><a href="/mirinae/views/member/logout.sun">로그아웃</a></li>
					<li><a href="/mirinam/views/admin/admin_page.chan">관리자페이지</a></li>
				</c:if>
			</c:if>
		</ul>
	</nav>
</body>
</html>