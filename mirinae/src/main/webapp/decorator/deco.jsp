<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="deco" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mirinae</title>
<style type="text/css">@import url("/mirinae/css/bootstrap.css");</style>
<style type="text/css">
	hr { width: 100%; }
	#footer { background-color: gray; opacity: 0.3; height: 100px; color: black; }
</style>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<jsp:include page="header.jsp"></jsp:include>
	<hr>
	<deco:head></deco:head>
	<deco:body></deco:body>
	<hr>
<div id="footer">
Mirinae CrowdFunding.
</div>
</body>
</html>