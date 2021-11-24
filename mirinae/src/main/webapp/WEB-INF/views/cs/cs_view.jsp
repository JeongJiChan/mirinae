<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../../decorator/sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// 게시글 삭제
	function delCs() {
		var con = confirm("문의를 삭제하시겠습니까?");
		if(con) {
			location.href="cs_delete.kwon?cs_no=${cs.cs_no}&pageNum=${pageNum}";
		}
	}
</script>
</head>
<body>
	
	<div>
		<h2>${cs.cs_title }</h2>
		<h5>${cs.cs_writer } | ${cs.cs_reg_date } | 조회수 : ${cs.cs_view }</h5>
		
		
	</div>
	<div>
		<pre>${cs.cs_content }</pre>
	</div>
	
	<div>
		<button onclick="location.href='cs_list.kwon?pageNum=${pageNum}'">목록</button>
		<c:if test="${id == cs_id && not empty id || not empty admin_id && empty id}" >
				<button onclick="delCs()">삭제</button>
		</c:if>
		<c:if test="${not empty admin_id && empty id && cs.cs_re_level == 0}">
			<button onclick="location.href='cs_rewriteForm.kwon?cs_no=${cs.cs_no}'">
			답글</button>
		</c:if>
	</div>
	
</body>
</html>