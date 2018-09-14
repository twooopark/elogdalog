<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>DOCUMENT</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src='https://cdn.bootcss.com/air-datepicker/2.2.3/js/datepicker.min.js'></script>
	<script src='https://cdn.bootcss.com/air-datepicker/2.2.3/js/i18n/datepicker.en.min.js'></script>
<!-- 	<script src="resources/js/mydatepicker.js"></script> -->
	
	<link rel='stylesheet' href='https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css'>
	<link rel='stylesheet' href='https://cdn.bootcss.com/air-datepicker/2.2.3/css/datepicker.min.css'>
	
	<link rel="stylesheet" href="resources/css/default.css">
	<link rel="stylesheet" href="resources/css/document.css">
</head>
<style>
	
</style>
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
			<div class="content_menu">
				<ul>
					<li><button onclick="location.href='/document'">DOCUMENT</button></li>
					<li><button onclick="location.href='/analyze'">GRAPH</button></li>
				</ul>
			</div>
			
			<!--검색 조건 여닫이 버튼-->
			
			<!--내용 보여주는 곳-->
			<div class="content">
				<!--검색 조건 창-->
				<div class="condition_menu_wrapper" id="condition_menu_wrapper">
					<div class="condition_menu">
						
					</div>
					<div class="condition_menu_control" id="condition_menu_controller"><span>검색조건 펼치기</span></div>
				</div>
				<div class="iframe_wrapper">
					<div class="button_wrapper">
							<div class="datepicker_wrapper">
								<!-- 주차별 날짜 보기 -->
								<select name="w_year" id="w_year" class="w_datepicker w_datepicker_year" onchange="makeWeekSelectOptions();">
									<option value="2018" selected="selected">2018년</option>
								</select>
								<select name="w_month" id="w_month" class="w_datepicker w_datepicker_month" onchange="makeWeekSelectOptions();">
									<option value="01">01월</option>
									<option value="02">02월</option>
									<option value="03">03월</option>
									<option value="04">04월</option>
									<option value="05">05월</option>
									<option value="06">06월</option>
									<option value="07">07월</option>
									<option value="08" selected="selected">08월</option>
									<option value="09">09월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
								</select>
								<select name="w_week" class="w_datepicker w_datepicker_week" id="w_week"></select>			
								<!-- 원하는 날짜 선택 -->				
								<input type="text" class="mydatepicker" id='mydatepicker' readonly="readonly" placeholder="원하는 날짜의 범위를 선택하세요.">
								<button>메일 보내기</button>
								<button>인쇄 미리보기</button>
								<button>pdf로 출력</button>
							</div>
<!-- 							<div class="function_wrapper"> -->
<!-- 								<button>메일 보내기</button> -->
<!-- 								<button>인쇄 미리보기</button> -->
<!-- 								<button>pdf로 출력</button> -->
<!-- 							</div> -->
					</div>
					<iframe src="resources/doc/reportTemplate.html" height="100%" width="100%" frameborder="none" ></iframe>
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
	<script type="text/javascript">
		/*주차별 날짜 선택 AREA*/
		function makeWeekSelectOptions() {
			console.log("start");
			
		    var year = $("#w_year").val();
		    var month = $("#w_month").val();
		 
		    var today = new Date();
		 
		    var sdate = new Date(year, month-1, 01);
		    var lastDay = (new Date(sdate.getFullYear(), sdate.getMonth()+1, 0)).getDate();
		    var endDate = new Date(sdate.getFullYear(), sdate.getMonth(), lastDay);
		 
		    var week = sdate.getDay();
		    sdate.setDate(sdate.getDate() - week);
		    var edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());
		 
		    var obj = document.getElementById("w_week");
		    obj.options.length = 0;
		    var seled = "";
		    while(endDate.getTime() >= edate.getTime()) {
		 
		        var sYear = sdate.getFullYear();
		        var sMonth = (sdate.getMonth()+1);
		        var sDay = sdate.getDate();
		 
		        sMonth = (sMonth < 10) ? "0"+sMonth : sMonth;
		        sDay = (sDay < 10) ? "0"+sDay : sDay;
		 
		        var stxt = sYear + "-" + sMonth + "-" + sDay;
		 
		        edate.setDate(sdate.getDate() + 6);
		 
		        var eYear = edate.getFullYear();
		        var eMonth = (edate.getMonth()+1);
		        var eDay = edate.getDate();
		 
		        eMonth = (eMonth < 10) ? "0"+eMonth : eMonth;
		        eDay = (eDay < 10) ? "0"+eDay : eDay;
		 
		        var etxt = eYear + "-" + eMonth + "-" + eDay;
		 
		        if(today.getTime() >= sdate.getTime() && today.getTime() <= edate.getTime()) {
		            seled = stxt+"|"+etxt;
		        }
		 
		        obj.options[obj.options.length] = new Option(stxt+"~"+etxt, stxt+"|"+etxt);
		 
		        sdate = new Date(edate.getFullYear(), edate.getMonth(), edate.getDate() + 1);
		        edate = new Date(sdate.getFullYear(), sdate.getMonth(), sdate.getDate());
		    }
		    if(seled) obj.value = seled;
		}
		/*주차별 날짜 선택 AREA - END*/
		
		/*원하는 날짜 선택 AREA*/
		var monday = getMonday(new Date());
	
		var config={	
		  	// 주 설정
		  	week : {
		  		range:true,
		  		todayButton:true,
		  		multipleDatesSeparator:" ~ ",
		  		inline: false,
			    autoClose: true,
			    toggleSelected: false,
			    language: "en",
			    view: "days",
			    minView: "days",
			    dateFormat: "yyyy-mm-dd",
			    onSelect: function (formattedDate, date, inst) {
			    	// $("#result").html(formattedDate);
			    	parseDate(formattedDate);
			 		}
		  	}
		}
	
		/*최초 설정입니다.*/
		var $datepicker = $("#mydatepicker");
			$datepicker.datepicker(config.week);
	
		/* Set the default selected time */
		// $datepicker.data('datepicker').selectDate(new Date());
	
		/* 해당 주차의 월요일을 구합니다.*/
		function getMonday(today){
			// console.log(today);
		}
	
		/* 시작일 ~ 마지막일 각각의 년/월/일을 구하기 위한 함수입니다*/
		function parseDate(rangeDate){
			console.log("TODAY : " + rangeDate);
			var startDate = (rangeDate.split("~")[0]).trim();
			var endDate = (rangeDate.split("~")[1]).trim();
	
			var startY = startDate.split("-")[0];
			var startM = startDate.split("-")[1];
			var startD = startDate.split("-")[2];
	
			var endY = endDate.split("-")[0];
			var endM = endDate.split("-")[1];
			var endD = endDate.split("-")[2];
	
			console.log(startY + " " + startM + " " + startD);
			console.log(endY + " " + endM + " " + endD);
		}
		/*원하는 날짜 선택 AREA - END*/
		
		$(function(){
			makeWeekSelectOptions();
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
</body>
</html>