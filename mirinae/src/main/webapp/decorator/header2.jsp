<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="deco" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mirinae</title>
<style type="text/css">
	table { width: 100%;  height: 3px; overflow: hidden; }
	td { width: 30px; text-align: center; }
/* 	li { overflow: hidden; list-style: none; visibility: hidden; height: 0px; } */
</style>

</head>
<body>
<div class="menu">
	<div class="menu_btn">
		<a>menu1</a>
		<a>menu2</a>
		<a>menu3</a>
	</div>
</div>

<hr>
	<deco:body></deco:body>
<hr>
Mirinae CrowdFunding.
</body>
</html>