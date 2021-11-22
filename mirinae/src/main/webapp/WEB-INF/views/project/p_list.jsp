<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table { border: 1px solid black; margin: 20px;}
	tr th { border: 1px solid black; }
	#table { width: 30%; float: left; table-layout: fixed; }
	#image { width: 100%; height: 310px; }
</style>
</head>
<body>
<c:if test="${empty project }">
		<h1 align="center">등록된 프로젝트가 없습니다.</h1>
</c:if>
<c:if test="${not empty project }">
	<c:forEach var="pro" items="${project }">
	<c:if test="${pro.p_del != 'y' }">
		<c:set var="i" value="${i+1 }"></c:set>
		<table id="table">
		<tr><th id="table_picture" colspan="2"><img id="image" src="/mirinae/p_images/${pro.p_no }.jpg"></th></tr>
		<tr><th colspan="2">목표 달성률 : <fmt:formatNumber value="${pro.cur_money/pro.goal_money * 100 }" pattern="0.00"/>%</th></tr>
		<tr><th>번호 : ${pro.p_no }</th><th>제목 : ${pro.p_name }</th></tr>
		<tr><th>작성자 : ${pro.p_writer }</th><th>작성일 : ${pro.reg_date }</th></tr>	
		<tr><th>목표금액 : ${pro.goal_money }</th><th>현재금액 : ${pro.cur_money }</th></tr>
		<tr><th colspan="2">기간 : ${pro.s_date } ~ ${pro.e_date }</th></tr>
		</table>
	</c:if>
	</c:forEach>
</c:if>
</body>
</html>