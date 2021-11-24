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
	<form method="post" action="cs_rewrite.kwon">
		<input type="hidden" name="cs_title" value="RE: ${cs_title }">
		<input type="hidden" name="cs_no" value="${cs_no }">
	<br><br><br>
		<h2 align="center">답변 입력</h2>
		<br><br><br>
		<table align="center">
			
			
			<tr height="50">
				<th>제목</th>
				<td>RE: ${cs_title }</td>
			</tr>
			<tr height="50">
				<th>관리자</th>
				<td>admin</td>
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