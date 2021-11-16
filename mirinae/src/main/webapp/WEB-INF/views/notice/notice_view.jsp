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
	<table>
		<tr><th>제목</th><td colspan="2">${notice.no_title }</td></tr>
		<tr><th>작성자</th><td>${notice.admin_no }</td><td>${notice.no_view }</td></tr>
		<tr><th>내용</th><td>${notice.no_content }</td></tr>
		
	</table>
</body>
</html>