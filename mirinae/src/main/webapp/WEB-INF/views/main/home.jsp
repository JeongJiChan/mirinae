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
	.container { margin-bottom: 100px; width: 100%; margin-left: 0px; margin-right: 0px; }
	.row { display: flex;
			justify-content: center;
			align-items: center;	
			text-align: center;
			position: relative;
	}
	.row img { width: auto; height: 150px; cursor: pointer; }
	#row1 { height: 400px; width: 100%; }
	.carousel-control { height: 600px; width: 5%; }
	.carousel-control.right { position: absolute; left: 76.4%; }
	.carousel-control.left { position: absolute; left: 18.6% }
	.carousel-indicators { left: 5%; position: absolute; }
	.carousel-inner { width: 100%; position: absolute; }
	.d1 { margin-left: 20%; margin-right: 20%; display: flex; justify-content: center; margin-bottom: 10px; }
	.d2 { margin-left: 20%; margin-right: 20%; display: flex; justify-content: center; margin-bottom: 50px; }
	.img { width: 100%; height: 100%; }
	.no { margin-left: 20%; margin-right: 20%; }
	.no td { margin: 20px; width: 80%; padding: 10px; background-color: #EAEAEA; }
	#no1 { width: 20%; text-align: center; font-size: 25pt; font-weight: bold; background-color: white; }
	.no table { width: 100%; height: 100%; margin-bottom: 50px; }
	.no table tr { height: 20px; }
	.milky { margin-left: 20%; margin-right: 20%; position: relative; }
	.milky img { width: 100%; height: 210px; }
	.text { position: absolute; z-index: 1; color: white; width: 400px; top: 50%; left: 50%; transform: translate( -50%, -275%); text-align: center; }
	.project_form { position: absolute; z-index: 1; width: 300px; height: 70px; top: 50%; left: 50%; background-color: rgba(0,0,0,0.6); transform: translate( -50%, -50%); color: white; display: flex; align-items: center; justify-content: center; transition: all 0.3s ease-in-out; }
	.project_form a { text-decoration-line : none; }
	.project_from a:link { color: white; }
	.project_form a:visited { color: white; }
	.project_form a:active { color: white; }
	.project_form a:hover { color: black; }
	.project_form:hover { cursor: pointer; background-color: white; opacity: 1; text-decoration: underline; transition: all 0.2s ease-in-out; }
/* 	.project_form: { background-color: rgba(0,0,0,0.6); transition: all 0.2s linear; } */
	.project_form:hover a { color: black; transform: scale(1.1); overflow: hidden; transition: all 0.2s ease-in-out; }
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
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
				<div class="carousel-inner">	
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
				</div>	
				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					data-slide="prev"> <span class="icon-prev"></span></a>
				<a class="right carousel-control" href="#carousel-example-generic"
					data-slide="next"> <span class="icon-next"></span></a>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<div class="d1">
		<table id="t1" style="height: 300px; width: 48%; margin-left: 10px; margin-right: 10px;">
			<tr><td><a><img alt="" src="/mirinae/images/milkyway.png" class="img"></a></td></tr>
			<tr><td style="margin-bottom: 5px;">마감임박 1위</td>
		</table>
		<table id="t2" style="height: 300px; width: 48%; margin-left: 10px; margin-right: 10px;">
			<tr><td><a><img alt="" src="/mirinae/images/milkyway.png" class="img"></a></td></tr>
			<tr><td style="margin-bottom: 5px;">마감임박 2위</td>
		</table>
	</div>
	<div class="d2">
		<table id="t3" style="height: 200px; width: 33%; margin-left: 10px; margin-right: 10px;">
			<tr><td><a><img alt="" src="/mirinae/images/milkyway.png" class="img"></a></td></tr>
			<tr><td style="margin-bottom: 5px;">마감임박 3위</td>
		</table>
		<table id="t4" style="height: 200px; width: 33%; margin-left: 10px; margin-right: 10px;">
			<tr><td><a><img alt="" src="/mirinae/images/milkyway.png" class="img"></a></td></tr>
			<tr><td style="margin-bottom: 5px;">마감임박 4위</td>
		</table>
		<table id="t5" style="height: 200px; width: 33%; margin-left: 10px; margin-right: 10px;">
			<tr><td><a><img alt="" src="/mirinae/images/milkyway.png" class="img"></a></td></tr>
			<tr><td style="margin-bottom: 5px;">마감임박 5위</td>
		</table>
	</div>
	<div class="no">
		<table>
			<tr><td id="no1" rowspan="3">Notice</td><td style="border-bottom: 10px solid white;">notice1</td></tr>
			<tr><td style="border-bottom: 10px solid white;">notice2</td></tr>
			<tr><td>notice3</td></tr>
		</table>
	</div>
	<div class="milky">
		<img alt="" src="/mirinae/images/milkyway.png">
		<span class="text">별들을 모아 나만의 반짝이는 미리내를 만들어보세요</span>
		<div class="project_form"><a href="/mirinae/views/project/p_uploadForm.kim">프로젝트 등록하기</a></div>
	</div>
</body>
</html>