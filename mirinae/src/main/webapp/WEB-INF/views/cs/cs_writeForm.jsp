<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" onclick="location.">
		<table align="center">
			<tr><th>제목</th><td><input type="text" name="title" required="required" autofocus="autofocus"></td></tr>
			<tr><th>내용</th><td><textarea name="content" required="required"></textarea></td>
		</table>
		<div width="100%" align="center">
			<input type="submit" value="확인">
			<input type="button" value="취소" onclick="history.back()">
		</div>
	</form>
</body>
</html>