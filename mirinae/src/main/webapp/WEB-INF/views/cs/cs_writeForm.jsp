<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.ckeditor.com/ckeditor5/31.0.0/classic/ckeditor.js"></script>
<style>
	.ck.ck-editor {
    	max-width: 700px;
	}
	.ck-editor__editable {
	    min-height: 300px;
	}
</style>
</head>
<body>
	<form method="post" action="cs_write.kwon">
		<br><br><br>
		<h2 align="center">문의 입력</h2>
		<br><br><br>
		<table align="center">
			<tr height="50">
				<th>제목</th>
				
				<td><input type="text" name="title" required="required"
					autofocus="autofocus"></td>
			</tr>
			<tr height="50">
				<th>고객 닉네임</th>
				<td>${m_nick }</td>
			<tr>
				<th>내용</th>
				<td><textarea id="textarea" name="content"></textarea></td>
		</table>
		<br>
		<div id="classic">
    	</div>
		<div width="100%" align="center">
			<input type="submit" value="확인"> <input type="button"
				value="취소" onclick="history.back()">
		</div>
	<script src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
	</form>
</body>
</html>