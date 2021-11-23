<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<c:url value="notice_view.la" var="nvu1">
	<c:param name="no_no" value="${no_no}"/>
	<c:param name="pageNum" value="${pageNum}"/>
</c:url>
<head>
<style type="text/css">
	#n_list { width: 100%; cursor: pointer; }
	div.nv_btn {width:60px; float: left; margin:25px; text-align: center;
		font-style: Sans-Serif}
	#nv_del #nv_update{ color: red; margin-right: auto; }
	textarea {width: 80%; height:300px; resize:none;}
	a:link { color: red; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
	a:hover { color: blue; font-weight: bold;}
	
	.btnDiv {display: flex;}
	div#n_viewBtn{margin: auto;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="n_list">
	<h1 class="n_title" style="text-align:center" onclick="location.href='notice_list.la'">Notice</h1>
</div>
<c:if test="${no_del == 'n'}">
	<div id="n_view">
		<form action="" method="post">
			<input type="hidden" name="sup_no" value="${support.sup_no }"	>
			<table width="60%" align= "center" >
				<tr><th>제목</th><td colspan="2"><input type="text" name="no_title" value="${notice.no_title }" readonly="readonly"></td></tr>
	 			<tr><th>작성자</th><td><input type="text" name="admin_no" value="${admin_id }" readonly="readonly"></td>
	 			<td>조회수 ${notice.no_view }</td></tr>
				<tr><th>내용</th><td colspan="2"><textarea cols="5" rows="" readonly="readonly" name="no_content"><c:out value="${notice.no_content }" escapeXml="false" /></textarea></td></tr>
			</table>
			<c:if test="${result != 0 && no_del=='n'}">
				<div class="nv_btn"><a href="support_del.chan?sup_no=${support.sup_no }" id="nv_del">
				Cancel</a>
				</div>
			</c:if>
		</form>
	</div>
</c:if>
	<div class="btnDiv">
		<a href="notice_list.la?pageNum=${pageNum}">List</a>
	</div>
</body>
</html>