<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 텍스트 에디터 -->
<script	src="https://cdn.ckeditor.com/ckeditor5/31.0.0/classic/ckeditor.js"></script>
<style type="text/css">@import url("/mirinae/css/bootstrap.css");</style>
<style>
	.ck.ck-editor { max-width: 700px;}
	.ck-editor__editable { min-height: 300px;}
	.labeling {background-color: #2c3e50; color: white; border-radius: 1px;
		 border-collapse: collapse;
 		 border-radius: 10px;
 		text-align: center;	
 		 width: 15%;
	}
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
	.underwhite{border-bottom:1px solid white; }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="n_list">
	<h1 class="n_title bottommargin" style="font-size: 56px; line-height: 1.4em; text-align: center;" onclick="location.href='notice_list.la'">Notice</h1>
</div>
<div align="center">
	<form action="notice_write.la" name="nwf" method="post" name="writeform" onsubmit="return chk()">
		<table id="writeForm">
			<tr><th class="labeling underwhite">제목</th><td colspan="2"><input type="text" id="no_title" name="no_title" required="required"
																class="form-controllogin"></td></tr>
			<tr><th class="labeling">내용</th><td colspan="2"><textarea rows="5" cols="40" name="no_content" id="content" 
				placeholder="내용을 입력하세요."></textarea></td></tr>
			<tr><th colspan="2" style="text-align: center;"><input type="submit" value="작성" class="btn btn-primary">
			<input type="button" onclick="location.href='notice_list.la'" value="취소" class="btn btn-primary"></th>
		</table>
	</form>
</div>
<script src="${pageContext.request.contextPath}/js/ckeditor_la.js"></script>
</body>
</html>