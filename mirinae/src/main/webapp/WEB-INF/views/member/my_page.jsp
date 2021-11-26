<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="service.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/mirinae/css/bootstrap.css");</style>
<script type="text/javascript" src="/mirinae/js/jquery.js"></script>
<script type="text/javascript">
	/* 회원탈퇴 */
	function del() {
		var con = confirm("탈퇴 하시겠습니까? 탈퇴한 아이디는 다시 사용할 수 없습니다.");
		if(con) location.href="delete.sun";
		else alert("탈퇴가 취소되었습니다");
	}
</script>
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
	<h2><b>${member.m_name }님 환영!</b></h2>
	<h4><a href="/mirinae/views/mypick/mypick_list.la">마이픽 프로젝트</a></h4>
	<h4><a href="/mirinae/">내가 등록한 프로젝트</a></h4>
	<h4><a href="/mirinae/views/support/sup_list.chan">내가 후원한 프로젝트</a></h4>
	<h4><a href="/mirinae/views/cs/my_cs_list.kwon">고객 문의 내역</a></h4>
	<h4><a href="updateForm.sun">회원 수정</a></h4>
	<h4><a class="del" onclick="del()">회원 탈퇴</a></h4>
	</div>
</body>
</html>