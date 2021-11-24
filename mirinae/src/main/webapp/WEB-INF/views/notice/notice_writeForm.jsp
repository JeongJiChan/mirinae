<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function chk() {
		if($("#content").val().trim().length < 1)
		{
		    alert("글내용을 입력해주세요.");
		    return false; 
		}
	}
</script>
<style type="text/css">
	div.writeBox {width: 100%; display: flex;}
	table#writeForm {margin: auto; width: 60%; }
</style>
<!-- 텍스트 에디터 -->
<script
	src="https://cdn.ckeditor.com/ckeditor5/31.0.0/classic/ckeditor.js"></script>
<style>
	.ck.ck-editor { max-width: 700px;}
	.ck-editor__editable { min-height: 300px;}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="writeBox">
	<form action="notice_write.la" name="nwf" method="post" name="writeform" onsubmit="return chk()">
		<table id="writeForm">
			<tr><th>제목</th><td colspan="2"><input type="text" id="no_title" name="no_title" required="required"></td></tr>
			<tr><th>내용</th><td colspan="2"><textarea rows="5" cols="40" name="no_content" id="content" 
				placeholder="내용을 입력하세요."></textarea></td></tr>
			<tr><th><input type="submit" value="작성"></th>
			<th><input type="reset" value="초기화"></th>
			<th><input type="button" onclick="location.href='notice_list.la'" value="취소"></th>
		</table>
	</form>
</div>
<script src="${pageContext.request.contextPath}/js/ckeditor_la.js"></script>
</body>
</html>