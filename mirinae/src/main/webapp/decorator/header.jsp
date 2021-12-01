<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mirinae</title>
<style type="text/css">@import url("/mirinae/css/bootstrap.css")</style>
<style type="text/css">
	.dropdown:hover .dropdown-menu { display: block; margin-top: 0; }
	#div { display: flex; justify-content: center; align-items: center; }
	ul { display: flex; justify-content: space-between; align-item: center; font-size: 20px; margin-right: 20px; margin-left: 20px; }
	#navbarColor01 { display: flex; justify-content: center; align-items: center; }
	li { margin-left: 20px; margin-right: 20px; min-width: 100px; text-align: center; }
	.nav-link { cursor: pointer;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function mingwonjjang() {
		if(${empty sessionScope.id && empty sessionScope.admin_id }) {
			alert("로그인이 필요합니다.");
		} else {
			location.href="/mirinae/views/project/p_uploadForm.kim";
		}
	}
</script>
</head>
<body>
<c:set var="id" value="${sessionScope.id }"></c:set>
<c:set var="admin_id" value="${sessionScope.admin_id }"></c:set>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid" id="div">
    <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
    <a class="navbar-brand" href="/mirinae/views/main/home.chan"><img alt="" src="/mirinae/images/logo3.gif" width="150px"></a>
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" onclick="mingwonjjang()">프로젝트 등록</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="/mirinae/views/project/p_list.kim">프로젝트 목록</a>
          <div class="dropdown-menu">
             <a class="dropdown-item" href="/mirinae/views/project/p_cateView.kim?cate_code=100"><b>의류</b></a>
            <a class="dropdown-item" href="/mirinae/views/project/p_cateView.kim?cate_code=200"><b>가전</b></a>
            <a class="dropdown-item" href="/mirinae/views/project/p_cateView.kim?cate_code=300"><b>기타</b></a>
          </div>
        </li>
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="" aria-haspopup="true" aria-expanded="false">게시판</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/mirinae/views/notice/notice_list.la">공지사항</a>
            <a class="dropdown-item" href="/mirinae/views/cs/cs_list.kwon">고객문의</a>
          </div>
        </li>
        <c:if test="${empty id && empty admin_id}">
        <li class="nav-item">
          <a class="nav-link" href="/mirinae/views/member/loginForm.sun">로그인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/mirinae/views/member/joinForm.sun">회원가입</a>
        </li>
		</c:if>
		<c:if test="${not empty id && empty admin_id}">
        <li class="nav-item">
          <a class="nav-link" href="/mirinae/views/member/logout.sun">로그아웃</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/mirinae/views/member/my_page.sun">마이페이지</a>
        </li>
        </c:if>	
        <c:if test="${not empty admin_id && empty id}">
        <li class="nav-item">
          <a class="nav-link" href="/mirinae/views/member/logout.sun">로그아웃</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/mirinae/views/admin/admin_page.sun">관리자페이지</a>
        </li>
        </c:if>
      </ul>
      <form class="d-flex" action="/mirinae/views/main/homeSearch.kwon">
        <input class="form-control me-sm-2" type="text" name="search" placeholder="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
</body>
</html>