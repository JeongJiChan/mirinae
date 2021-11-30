<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.form-controllogin {
	  width: 380px;
	  padding: 0.575rem 0.75rem;
	  font-size: 1rem;
	  font-weight: 400;
	  line-height: 1.5;
	  color: #212529;
	  background-color: #fff;
	  background-clip: padding-box;
	  border: 1px solid #ced4da;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  border-radius: 0.25rem;
	  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
	.loginbtn { width: 100pt; }
	.loginimg { padding-top: 100pt; padding-bottom: 20pt;}
	.loginId {margin-bottom: 10pt;  }
	.divtext>a {text-decoration: none; color: #212529; }
	.divtext>a:hover{color: #f39c12; }

</style>
</head>
<body>
	<div class="loginimg" align="center">
		<img alt="" src="/mirinae/p_images/loginFormImg.png">
		</div>
	<div align="center" style="margin-bottom: 20px;"><h3>아 이 디 찾 기</h3></div>
	<c:if test="${result == 1 }">
		<div align="center"><h2><span style="color:blue; font-style:italic;">${member.m_name }</span>님의 아이디는 
		<span style="color:blue; font-style:italic;">${member.m_id }</span> 입니다.</h2></div>
		<div class="divtext" align="center" style="margin-top: 20px;">
            <a href="findPassForm.sun">비밀번호 찾기</a> | <a href="loginForm.sun">로그인</a>
        </div>
	</c:if>
	<c:if test="${result == -1 }">
		<div align="center"><h2>등록된 정보가 없습니다</h2></div>
		<div class="divtext" align="center" style="margin-top: 20px;">
            <a href="findIdForm.sun">다시 찾기</a> | <a href="joinForm.sun">회원가입</a>
        </div>
	</c:if>
</body>
</html>