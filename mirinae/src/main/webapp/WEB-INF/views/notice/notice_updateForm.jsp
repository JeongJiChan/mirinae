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
<style>
	.ck.ck-editor { max-width: 700px;}
	.ck-editor__editable { min-height: 300px;}
</style>

<style type="text/css">
	#n_list { width: 100%; cursor: pointer; }
	div.nv_btn {width:60px; float: left; margin:25px; text-align: center;
		font-style: Sans-Serif}
	#nv_del { color: red}
	#nv_update { color: red}
	#nv_update, #nv_back {color:black}
	textarea {width: 80%; height:300px; resize:none;}
	a:link { color: red; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
	a:hover { color: blue; font-weight: bold;}
	
	.btnDiv {display: flex;}
	div#n_viewBtn{margin: auto;}
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
<div id="n_list">
	<h1 class="n_title" style="text-align:center" onclick="location.href='notice_list.la'">Notice</h1>
</div>
<div id="n_view">
	<form action="notice_update.la" method="post" name="updateform" onsubmit="return chk()">
		<input type="hidden" name="no_no" value="${notice.no_no }">
				<table width="60%" align= "center" >
				<tr><th>제목</th><td colspan="2"><input type="text" name="no_title" value="${notice.no_title }" required="required"></td></tr>
	 			<tr><th>작성자</th><td colspan="2">${admin_id }</td></tr>
				<tr><th>내용</th><td colspan="2"><textarea cols="5" rows="" name="no_content" id="content">${notice.no_content }</textarea></td></tr>
			</table>
			<div class="btnDiv">
			<input type="submit" class="nv_btn" id="nv_update" value="수정">
			<div class="nv_btn"><a href="javascript:history.back();" id="nv_back">취소</a></div>
			</div>
	</form>
</div>
<script src="${pageContext.request.contextPath}/js/ckeditor_la.js"></script>
</body>
</html>