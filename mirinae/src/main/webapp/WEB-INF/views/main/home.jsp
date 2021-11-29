<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/mirinae/js/jquery.js"></script>
<script type="text/javascript" src="/mirinae/js/bootstrap.min.js"></script>
<style type="text/css">
	@import url("/mirinae/css/bootstrap.css")
</style>
<script>	$('.carousel').carousel(); </script>
<style type="text/css">
	.container { margin-bottom: 100px; }
	.row { display: flex;
			justify-content: center;
			align-items: center;	
			text-align: center;
			position: relative;
	}
	.row img { width: auto; height: 150px; }
	#row1 { height: 300px; }
</style>
</head>
<body>
	<div class="container">
		<div id="carousel-example-generic" class="carousel slide">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
				<li data-target="#carousel-example-generic" data-slide-to="4"></li>
			</ol>
			<div class="item active">
					<img src="/mirinae/p_images/${p_no1 }.jpg" alt="First slide" onclick="location.href='/mirinae/views/project/p_view.kim?p_no=${p_no1}'">
				</div>
				<div class="item">
					<img src="/mirinae/p_images/${p_no2 }.jpg" alt="Second slide" onclick="location.href='/mirinae/views/project/p_view.kim?p_no=${p_no2}'">
				</div>
				<div class="item">
					<img src="/mirinae/p_images/${p_no3 }.jpg" alt="Third slide" onclick="location.href='/mirinae/views/project/p_view.kim?p_no=${p_no3}'">
				</div>
				<div class="item">
					<img src="/mirinae/p_images/${p_no4 }.jpg" alt="Third slide" onclick="location.href='/mirinae/views/project/p_view.kim?p_no=${p_no4}'">
				</div>
				<div class="item">
					<img src="/mirinae/p_images/${p_no5 }.jpg" alt="Third slide" onclick="location.href='/mirinae/views/project/p_view.kim?p_no=${p_no5}'">
				</div>
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				data-slide="prev"> <span class="icon-prev"></span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				data-slide="next"> <span class="icon-next"></span>
			</a>
		</div>
	</div>
	<div class="row" id="row1">
		<div class="col-md-6">
			<img alt="" src="/mirinae/images/logo1.gif">
			<p>마감임박 1</p>
		</div>
		<div class="col-md-6">
			<img alt="" src="/mirinae/images/logo2.gif">
			<p>마감임박 2</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<img alt="" src="/mirinae/images/logo3.gif">
			<p>마감임박 3</p>
		</div>
		<div class="col-md-4">
			<img alt="" src="/mirinae/images/logo5.gif">
			<p>마감임박 4</p>
		</div>
		<div class="col-md-4">
			<img alt="" src="/mirinae/images/milkyway.png">
			<p>마감임박 5</p>
		</div>
	</div>
</body>
</html>