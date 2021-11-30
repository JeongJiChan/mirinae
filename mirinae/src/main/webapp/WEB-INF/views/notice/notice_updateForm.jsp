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
<!-- 텍스트 에디터 -->
<script
	src="https://cdn.ckeditor.com/ckeditor5/31.0.0/classic/ckeditor.js"></script>
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

<script type="text/javascript">
	function goBack() {
		 history.back() ;
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1 style="font-size: 56px; line-height: 1.4em; text-align: center;" onclick="location.href='notice_list.la'">Notice</h1>
</div>
<div align="center">
	<form action="notice_update.la" method="post" name="updateform" onsubmit="return chk()">
		<input type="hidden" name="no_no" value="${notice.no_no }">
		<table id="writeForm">
				<tr><th class="labeling underwhite">제목</th><td colspan="2"><input type="text" name="no_title" value="${notice.no_title }" required="required"
																class="form-controllogin"></td></tr>
	 			<tr><th class="labeling underwhite" style="height: 40px;">작성자</th><td colspan="2" style="padding-left: 15px;">${admin_id }</td></tr>
				<tr><th class="labeling">내용</th><td colspan="2"><textarea cols="5" rows="" name="no_content" id="content">${notice.no_content }</textarea></td></tr>
			</table>
			<div class="btnDiv" style="margin-top: 10px; ">
			<input type="submit" id="nv_update" value="수정" class="btn btn-primary">
			<input type="button" value="취소" class="btn btn-primary" onclick="history.back()">
			</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/js/ckeditor_la.js"></script>
</body>
</html>