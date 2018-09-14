<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>ANALYZE</title>
	<link rel="stylesheet" href="resources/css/default.css">
	<link rel="stylesheet" href="resources/css/analyze.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			/*검색 조건 창 슬라이딩 효과*/
			$("#condition_menu_controller").click(function(){
				var text = $("#condition_menu_controller").text().trim();
			// 	$("#condition_menu_wrapper").slideToggle("slow");

				if(text=="검색조건 펼치기"){
					$("#condition_menu_controller").text("검색조건 닫기");
					$("#condition_menu_wrapper").css("top","0px");
				}else{
					$("#condition_menu_controller").text("검색조건 펼치기");
					$("#condition_menu_wrapper").css("top","-350px");
				}
			});
		})	
		function setting(){
			alert("준비중입니다");
		}
	</script>
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
						<li><a href="#" onclick="setting();return false;">설정</a></li>
					</ul>
				</div>
			</header>
		</div>
		<!--헤더-->
		<!--내용-->
		<div class="content_wrapper">
			<!--문서 혹은 그래프 선택 창-->
			<div class="content_menu">
				<ul>
					<li><button onclick="location.href='/document'">DOCUMENT</button></li>
					<li><button onclick="location.href='#'">GRAPH</button></li>
				</ul>
			</div>
			<!--문서 혹은 그래프 선택 창-->

			
			
			<!--내용 보여주는 곳-->
			<div class="content">
				<!--검색 조건 창-->
				<div class="condition_menu_wrapper" id="condition_menu_wrapper">
					<div class="condition_menu">
						
					</div>
					<div class="condition_menu_control" id="condition_menu_controller"><span>검색조건 펼치기</span></div>
				</div>
				<!--검색 조건 창-->
				<div class="iframe_wrapper">
				<iframe src="http://localhost:5601/app/kibana#/dashboard/335b0440-b254-11e8-a694-6b6a3d66d059?embed=true&_g=(refreshInterval%3A(pause%3A!t%2Cvalue%3A0)%2Ctime%3A(from%3Anow-14d%2Cmode%3Arelative%2Cto%3Anow))" height="100%" width="90%"></iframe>
<!-- 				<iframe src="https://03be234be9c84b59ae9ce085b19b78b8.ap-northeast-1.aws.found.io:9243/app/kibana#/dashboard/4402b8e0-b0ad-11e8-a10b-c3e9fdd64ff5?embed=true&_g=(refreshInterval:(pause:!t,value:0),time:(from:'2017-11-30T05:33:01.064Z',mode:absolute,to:'2018-09-05T01:43:34.963Z'))&_a=(description:'',filters:!(),fullScreenMode:!f,options:(darkTheme:!f,hidePanelTitles:!f,useMargins:!t),panels:!((embeddableConfig:(),gridData:(h:15,i:'1',w:24,x:0,y:0),id:'32f09ae0-b0ad-11e8-a10b-c3e9fdd64ff5',panelIndex:'1',type:visualization,version:'6.4.0')),query:(language:lucene,query:''),timeRestore:!f,title:TEST1,viewMode:view)" width="100%" height="90%"></iframe> -->
				</div>
			</div>		
		</div>
		<!--내용-->
		

		<!--푸터-->
		<div class="footer_wrapper">
			<footer class="footer">
				<a href="/homepage" id="footer_logo"><img src="resources/images/footer_logo.jpg" alt="푸터로고"></a>
			</footer>
		</div>
		<!--푸터-->
	</div>
</body>
</html>