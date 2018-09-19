<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>GRAPH</title>
	<link rel="stylesheet" href="/resources/css/analyze.css">
</head>
<style>
.changeDashboardBtn{border:1px solid black; height:50px;width:100px;}
.content_wrapper { width:1700px;}
.content{ width:100%;}
</style>
<body>
<%
	if(session.getAttribute("USER_SESSION")==null){
		response.sendRedirect("/");
	}
%>
	<!--HOMEPAGE-->
	<div class="home_wrapper">
		<!--헤더-->
		<jsp:include page="/WEB-INF/views/frame/header.jsp" flush="false"/>
		<!--헤더-->

		<!--내용-->
		<div class="content_wrapper">
			<div class="content_menu">
				<ul>
					<li><button onclick="location.href='/document'">DOCUMENT</button></li>
					<li><button onclick="location.href='/analyze'">DASHBOARD</button></li>
				</ul>
			</div>
			<!--내용 보여주는 곳-->
			<div class="content">
				<div class="button_wrapper">
					<div class="datepicker_wrapper">
						<!-- 사용자는 주차별, 원하는 기간 선택 가능 -->
						<div class="pick_type_radio_wrapper" id="pick_type_radio_wrapper">
							<input type="radio" class="pick_type_radio" name="pick_type" id="week" checked="checked"><label for="week">일주일</label>
							<input type="radio" class="pick_type_radio" name="pick_type" id="choice"><label for="choice">기간</label>
						</div>

						<!-- 주차별 날짜 보기 -->
						<div class="pick_type_week" id="pick_type_week">
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
								<option value="08">08월</option>
								<option value="09" selected="selected">09월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
							<select name="w_week" class="w_datepicker w_datepicker_week" id="week_select"></select>
							<button id="searchByWeek" class="search_btn" onclick="changeDashboardDate(this.id,)">조회</button>
						</div>
								
						<!-- 원하는 기간 선택 -->	
						<div class="pick_type_choice" id="pick_type_choice">
							<input type="text" class="mydatepicker" id='range_select' readonly="readonly" placeholder="원하는 날짜의 범위를 선택하세요.">
							<button id="searchByChoice" class="search_btn" onclick="changeDashboardDate()">조회</button>
						</div>
					</div>
				</div>
				<div>
					<button class="changeDashboardBtn" id="homeDashboardBtn" onclick="changeDashbaord(this.id)">대시보드<br>home</button>
					<button class="changeDashboardBtn" id="loginDashboardBtn" onclick="changeDashbaord(this.id)">대시보드<br>(ip/id)</button>
					<button class="changeDashboardBtn" id="serviceDashboardBtn" onclick="changeDashbaord(this.id)">대시보드<br>(service)</button>
				</div>
				<!--대시보드-->
				<jsp:include page="/WEB-INF/views/frame/dashboard.jsp" flush="false"/>
				<!--대시보드-->
			</div>		
		</div>
		<!--내용-->

		<!--푸터-->
		<jsp:include page="/WEB-INF/views/frame/footer.jsp" flush="false"/>
		<!--푸터-->
	</div>
	<script type="text/javascript">
	var curDashboard = "homeDashboard";
	
	$(function(){
		initConfig();
	})

	/*button을 사용하여 Dashboard간 창 변환*/
	function changeDashboard(btnId){

		if(btnId=='homeDashboardBtn' && curDashboard!='homeDashboard'){
			$("#dashboardWrapper > iframe").hide();
			curDashboard='homeDashboard';
			$("#homeDashboard").show();

		}else if(btnId=='loginDashboardBtn' && curDashboard!='loginDashboard'){
			$("#dashboardWrapper > iframe").hide();
			curDashboard='loginDashboard';
			$("#loginDashboard").show();	

		}else if(btnId=='serviceDashboardBtn' && curDashboard!='serviceDashboard'){
			$("#dashboardWrapper > iframe").hide();
			curDashboard='serviceDashboard';
			$("#serviceDashboard").show();		
		}
	}

	/*custom UI 에서 전달해준 Date 값들을 이용하여 대시보드 refresh.*/
	function changeDashboardDate(btnId){
		
		var rangeDate;
		var sDate
		var eDate;

		var from;

		var gJsonType;

		/*일주일 간격, 사용자 정의, 최근 일주일*/
		if(btnId=="searchByWeek" || btnId=="searchByChoice"){
			
			rangeDate = (btnid=="searchByWeek")? $("#week_select").text() : $("#range_select").val(); 
			
			sDate = rangeDate.split("~")[0].trim();
			eDate = rangeDate.split("~")[1].trim();
			mode="absolute";

			gJsonType={
				"refreshInterval":{  
				    "pause":false,
				    "value":10000
			   	},
		   	  	"time":{  
			      "from": sDate+"T00:00:00.000Z",
			      "mode":"absolute",
			      "to": eDate+"T23:59:59.999Z"
  				}
			}
		}else{
			from="now-45d";

			gJsonType={
				"refreshInterval":{  
				    "pause":false,
				    "value":10000
			   	},
				"time":{  
				    "from": range,
				    "mode": "quick",
				    "to": "now"
				}
			}
		}
		
		/*iframe 의 속성값들*/
		var dashboardId = "#"+curDashboard;			//현재의 dashboard의 id를 가져옴.
		var src = $(dashboardId).attr("src");		//현재의 dashboard의 src값을 가져옴
		var gRisonType = rison.encode(gJsonType); 	//json -> rison

		/*src를 &를 구분자로 하여 쪼개고, _g 속성에 새로운 값을 넣어준다.*/
		var src1 = src.split("&")[0];
		var newSrc2 = "_g=" + gRisonType;
		var src3 = src.split("&")[2];

		/*새로 넣게 될 src 속성*/
		var newSrc =  src1 + "&" + newSrc2 + "&" + src3;

		$(dashboardId).attr("src",newSrc);
	}
	</script>
</body>
</html>