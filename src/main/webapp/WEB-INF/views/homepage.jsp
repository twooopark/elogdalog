<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>홈페이지</title>
	<link rel="stylesheet" href="resources/css/default.css">
	<link rel="stylesheet" href="resources/css/home.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<!--HOMEPAGE-->
	<div class="home_wrapper">
		<!--헤더-->
		<div class="header_wrapper">
			<header>
				<div class="top_menu">
					<a href="/homepage" class="logo"><img src="resources/images/logo.jpg" alt="logo"></a>
					<ul class="nav_box">
						<li><a href="/document">시작하기</a></li>
						<li><a href="/member/registration">등록</a></li>
					</ul>
				</div>
			</header>
		</div>
		<!--헤더-->

		<!--내용-->
		<div class="content_wrapper">
			<div class="intro_wrapper">
				<div class="intro_pic">
					<div class="inner_text_wrapper">
						<div class="inner_text_block">
							<h1 class="main_text">LOG FILE ANALYSIS/STATISTICS/VISUALIZATION</h1>
							<h1 class="main_text">WITH ELASTIC STACK</h1>
							<p><a class="direct" href="/document">바로가기 ></a></p>
						</div>
					</div>
					<div class="intro_pic_cover"></div>
				</div>
			</div>
			<div class="content">
				<div class="detail_outter_wrapper">
					<ul class="detail_inner_wrapper">
						<li class="detail_box" id="analysis">
							<div class="box_cover" id="analyis_box_cover"></div>
							<div class="detail" id="anlysis_detail">
								<div>
									<p>로그 데이터 분석</p>
								</div>
							</div>
							<img class="detail_img" src="resources/images/analysis.png"alt="분석">
							<h3>ANALYSIS</h3>
						</li>
						<li class="detail_box" id="document">
							<div class="box_cover" id="document_box_cover"></div>
							<div class="detail" id="document_detail">
								<div>
									<p>로그 데이터</p>
									<p>분석 문서화</p>
								</div>
							</div>
							<img class="detail_img" src="resources/images/document.png" alt="문서">
							<h3>DOCUMENT</h3>
						</li>
						<li class="detail_box" id="visualization">
							<div class="box_cover" id="visualization_box_cover"></div>
							<div class="detail" id="visualization_detail">
								<div>
									<p>로그 데이터</p>
									<p>분석 시각화</p>
								</div>
							</div>
							<img class="detail_img" src="resources/images/pie-chart.png" alt="차트">
							<h3>VISUALIZATION</h3>
						</li>
					</ul>
					<div class="br"></div>
				</div>
				<div class="elk_info_wrapper">
					<div class="elk_info_img">
						<img src="resources/images/icon-elastic-stack-bb.svg" alt="엘라스틱 스택" height="150px">
					</div>					
					<div class="elk_info_text">
						<h3>Elastic Stack</h3>
						<p>Built on an open source foundation,</p> 
						<p>the Elastic Stack lets you reliably and securely take data from any source,</p>
						<p>in any format,and search, analyze, and visualize it in real time.<p/>
						<p><a id="elastic_link" href="https://www.elastic.co/kr/products">GO TO PAGE > </a></p>
					</div>
				</div>
			</div>		
		</div>
		<!--내용-->

		<!--푸터-->
		<div class="footer_wrapper">
			<footer class="footer">
				<a href="#" id="footer_logo"><img src="resources/images/footer_logo.jpg" alt="푸터로고"></a>
			</footer>
		</div>
		<!--푸터-->
	</div>
	<script>
		$(function(){
			$("#analysis").hover(function(){
				$("#analyis_box_cover").css("background","rgba(0,0,0,0.7)");
				$("#analysis img,#analysis h3").css("opacity","0.3");
				$("#anlysis_detail").css("display","block");
			},
			function(){
				$("#analyis_box_cover").css("background","rgba(255,255,255,0)");
				$("#analysis img,#analysis h3").css("opacity","1");
				$("#anlysis_detail").css("display","none");
			});
			

			$("#document").hover(function(){
				$("#document_box_cover").css("background","rgba(0,0,0,0.7)");
				$("#document img,#document h3").css("opacity","0.3");
				$("#document_detail").css("display","block");
			},
			function(){
				$("#document_box_cover").css("background","rgba(255,255,255,0)");
				$("#document img,#document h3").css("opacity","1");
				$("#document_detail").css("display","none");
			});

			$("#visualization").hover(function(){
				$("#visualization_box_cover").css("background","rgba(0,0,0,0.7)");
				$("#visualization img,#visualization h3").css("opacity","0.3");
				$("#visualization_detail").css("display","block");
			},
			function(){
				$("#visualization_box_cover").css("background","rgba(255,255,255,0)");
				$("#visualization img,#visualization h3").css("opacity","1");
				$("#visualization_detail").css("display","none");
			});
		})
	</script>
</body>
</html>