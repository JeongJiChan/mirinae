<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result == 1 }">
		<div><span style="color:blue; font-style:italic;">${member.m_name }</span>님의 아이디는 
		<span style="color:blue; font-style:italic;">${member.m_id }</span> 입니다.</div>
		<div>
            <a href="findPassForm.sun">비밀번호 찾기</a> | <a href="loginForm.sun">로그인</a>
        </div>
	</c:if>
	<c:if test="${result == -1 }">
		<div>등록된 정보가 없습니다</div>
		<div>
            <a href="findPassForm.sun">다시 찾기</a> | <a href="findIdForm.sun">아이디 찾기</a> | <a href="joinForm.sun">회원가입</a>
        </div>
	</c:if>
</body>
</html>