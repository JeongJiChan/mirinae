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
</head>
<body>
	<div class="caption">
		<h1 class="bottommargin" style="font-size: 56px; line-height: 1.4em; text-align: center;">Customer Service</h1>
	</div>
	<form method="post" action="cs_write.kwon">
		<table align="center" style="margin-top: 20px;">
			<tr height="50">
				<th class="labeling underwhite">제목</th>
				
				<td><input type="text" name="title" required="required"
					autofocus="autofocus" class="form-controllogin"></td>
			</tr>
			<tr height="50">
				<th class="labeling underwhite">고객 닉네임</th>
				<td style="padding-left: 10px;">${m_nick }</td>
			<tr>
				<th class="labeling">내용</th>
				<td><textarea id="textarea" name="content"></textarea></td>
		</table>
		<div id="classic">
    	</div>
		<div width="100%" align="center" style="margin-top: 10px; ">
			<input type="submit" value="확인" class="btn btn-primary"> <input type="button"
				value="취소" onclick="history.back()" class="btn btn-primary">
		</div>
	<script src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
	</form>
</body>
</html>