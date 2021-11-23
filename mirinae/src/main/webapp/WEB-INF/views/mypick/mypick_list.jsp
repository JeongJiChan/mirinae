<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="mp_list">
	<h1 class="mp_title" style="text-align:center" onclick="location.href='mypick_list.la'">My Pick</h1>
</div>
<div>
	<table>
		<c:forEach var="mypick" items="m_list">
			<tr><th rowspan="3"><img alt="mypick" src="../p_images/${mypick.p_no }"></th>
			<c:forEach var="project" items="p_list">
				<td>프로젝트 이름 : ${project.p_name }<br>
				프로젝트 기간 : ${project.s_date } ~ ${project.e_date }</td>
			</c:forEach>
		</c:forEach>
	</table>
</div>
</body>
</html>