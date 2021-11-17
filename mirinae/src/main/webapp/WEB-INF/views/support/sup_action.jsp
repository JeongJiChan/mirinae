<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#img { margin-top: 100px; margin-bottom: 50px; position: relative; }
	button { margin: 50px; margin-bottom: 100px; }
	#p { text-align: center; position: absolute; top: 50%; left: 50%; color: white; font-size: 20px; transform: translate( -50%, -50% ); }
</style>
</head>
<body>
	<div align="center" id="img">
		<img alt="" src="/mirinae/images/milkyway.png" width="1200px" height="300px">
		<div id="p">
		<p>Thank you</p>
		</div>
	</div>
	<div align="center">
		<button onclick="location.href='/mirinae/views/main/home.chan'">Main</button>
		<button onclick="location.href='/mirinae/views/member/my_page.chan'">MyPage</button>
	</div>
</body>
</html>