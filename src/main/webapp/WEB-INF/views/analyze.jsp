<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>GRAPH</title>
	<link rel="stylesheet" href="/resources/css/analyze.css">
	<script type="text/javascript" src="/resources/js/dashboard.js"></script>
	<script type="text/javascript" src="/resources/js/rison.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src='https://cdn.bootcss.com/air-datepicker/2.2.3/js/datepicker.min.js'></script>
	<script src='https://cdn.bootcss.com/air-datepicker/2.2.3/js/i18n/datepicker.en.min.js'></script>
	<script type="text/javascript" src="/resources/js/weekpicker.js"></script>
	<script type="text/javascript" src="/resources/js/datepicker.js"></script>
	<script type="text/javascript" src="/resources/js/initservicepage.js"></script>
	
	<link rel='stylesheet' href='https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css'>
	<link rel='stylesheet' href='https://cdn.bootcss.com/air-datepicker/2.2.3/css/datepicker.min.css'>
	
	<link rel="stylesheet" type="text/css" href="/resources/css/frame.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<link rel="stylesheet" href="/resources/css/default.css">
</head>
<style>
.changeDashboardBtn{border:1px solid black; height:50px;width:100px;}
.content_wrapper{width:1900px;height:2200px;}
.content{ width:100%;height:100%}
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
							<select name="w_week" class="w_datepicker w_datepicker_week" id="w_week"></select>
							<button id="searchByWeek" class="search_btn" onclick="changeDashboardDate(this.id)">조회</button>
						</div>
								
						<!-- 원하는 기간 선택 -->	
						<div class="pick_type_choice" id="pick_type_choice">
							<input type="text" class="mydatepicker" id='range_select' readonly="readonly" placeholder="원하는 날짜의 범위를 선택하세요.">
							<button id="searchByChoice" class="search_btn" onclick="changeDashboardDate(this.id)">조회</button>
						</div>
					</div>
				</div>
				<div>
					<button class="changeDashboardBtn" id="homeDashboardBtn" onclick="changeDashboard(this.id)">대시보드<br>home</button>
					<button class="changeDashboardBtn" id="loginDashboardBtn" onclick="changeDashboard(this.id)">대시보드<br>(ip/id)</button>
					<button class="changeDashboardBtn" id="serviceDashboardBtn" onclick="changeDashboard(this.id)">대시보드<br>(service)</button>
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
$(function(){
	initConfig();
})
var curDashboard = "homeDashboard";
var homeSrc = "http://175.115.95.21:5601/app/kibana#/dashboard/e2ac4f10-bb93-11e8-8100-1753e3fae69f?embed=true&_g=(refreshInterval:(pause:!t,value:0),time:(from:now-30d,mode:quick,to:now))&_a=(description:'',filters:!(),fullScreenMode:!f,options:(darkTheme:!f,hidePanelTitles:!f,useMargins:!t),panels:!((embeddableConfig:(),gridData:(h:16,i:'1',w:48,x:0,y:21),id:'5eb90550-bade-11e8-8100-1753e3fae69f',panelIndex:'1',type:search,version:'6.4.0'),(embeddableConfig:(),gridData:(h:11,i:'2',w:9,x:22,y:0),id:'3f03cec0-ba34-11e8-8100-1753e3fae69f',panelIndex:'2',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:10,i:'3',w:9,x:22,y:11),id:'9d38aa90-ba40-11e8-8100-1753e3fae69f',panelIndex:'3',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:11,i:'4',w:9,x:13,y:0),id:d0387910-bae1-11e8-8100-1753e3fae69f,panelIndex:'4',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:11,i:'5',w:8,x:40,y:0),id:'00872860-bb22-11e8-8100-1753e3fae69f',panelIndex:'5',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:10,i:'6',w:9,x:13,y:11),id:'61327cf0-ba32-11e8-8100-1753e3fae69f',panelIndex:'6',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:21,i:'7',w:13,x:0,y:0),id:'60840d20-ba35-11e8-8100-1753e3fae69f',panelIndex:'7',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:10,i:'9',w:9,x:31,y:11),id:'56a7cc10-bba7-11e8-8100-1753e3fae69f',panelIndex:'9',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:11,i:'11',w:9,x:31,y:0),id:e49710a0-bbaa-11e8-8100-1753e3fae69f,panelIndex:'11',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:10,i:'12',w:8,x:40,y:11),id:'5e39a270-bbaa-11e8-8100-1753e3fae69f',panelIndex:'12',type:visualization,version:'6.4.0')),query:(language:kuery,query:''),timeRestore:!f,title:homeDashboard,viewMode:edit)"
var loginSrc = "http://175.115.95.21:5601/app/kibana#/dashboard/10652f90-bb98-11e8-8100-1753e3fae69f?embed=true&_g=(refreshInterval:(pause:!t,value:0),time:(from:now-30d,mode:quick,to:now))&_a=(description:'',filters:!(),fullScreenMode:!f,options:(darkTheme:!f,hidePanelTitles:!f,useMargins:!t),panels:!((embeddableConfig:(),gridData:(h:32,i:'1',w:48,x:0,y:39),id:e00f1270-ba34-11e8-8100-1753e3fae69f,panelIndex:'1',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:20,i:'2',w:13,x:0,y:0),id:'60840d20-ba35-11e8-8100-1753e3fae69f',panelIndex:'2',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:20,i:'4',w:9,x:13,y:0),id:'28488890-bad6-11e8-8100-1753e3fae69f',panelIndex:'4',type:visualization,version:'6.4.0'),(embeddableConfig:(vis:(colors:(ksh00:%233F6833,redkarisma:%23806EB7))),gridData:(h:19,i:'5',w:23,x:0,y:20),id:'4ef43de0-bb99-11e8-8100-1753e3fae69f',panelIndex:'5',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:19,i:'6',w:25,x:23,y:20),id:'9aee7e10-bba1-11e8-8100-1753e3fae69f',panelIndex:'6',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:20,i:'7',w:13,x:22,y:0),id:fe25f150-bb99-11e8-8100-1753e3fae69f,panelIndex:'7',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:20,i:'8',w:13,x:35,y:0),id:'61548f50-bbb0-11e8-8100-1753e3fae69f',panelIndex:'8',type:visualization,version:'6.4.0')),query:(language:kuery,query:''),timeRestore:!f,title:serviceDashboard,viewMode:view)";
var serviceSrc = "http://175.115.95.21:5601/app/kibana#/dashboard/becf7120-bb94-11e8-8100-1753e3fae69f?embed=true&_g=(refreshInterval:(pause:!t,value:0),time:(from:now-30d,mode:quick,to:now))&_a=(description:'',filters:!(),fullScreenMode:!f,options:(darkTheme:!f,hidePanelTitles:!f,useMargins:!t),panels:!((embeddableConfig:(),gridData:(h:12,i:'1',w:48,x:0,y:21),id:'71b1e820-ba43-11e8-8100-1753e3fae69f',panelIndex:'1',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:21,i:'2',w:13,x:0,y:0),id:'60840d20-ba35-11e8-8100-1753e3fae69f',panelIndex:'2',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:7,i:'3',w:9,x:28,y:0),id:'3f03cec0-ba34-11e8-8100-1753e3fae69f',panelIndex:'3',type:visualization,version:'6.4.0'),(embeddableConfig:(vis:(colors:(fail:%23967302,success:%23447EBC))),gridData:(h:14,i:'6',w:9,x:28,y:7),id:'7eaac230-bae4-11e8-8100-1753e3fae69f',panelIndex:'6',type:visualization,version:'6.4.0'),(embeddableConfig:(vis:(colors:(unicro:%237EB26D))),gridData:(h:13,i:'7',w:36,x:12,y:33),id:f3909460-bb95-11e8-8100-1753e3fae69f,panelIndex:'7',type:visualization,version:'6.4.0'),(embeddableConfig:(vis:(colors:(unicro:%23705DA0))),gridData:(h:12,i:'8',w:36,x:12,y:46),id:'83e2d690-bb96-11e8-8100-1753e3fae69f',panelIndex:'8',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:23,i:'9',w:12,x:0,y:33),id:'5580a470-bb97-11e8-8100-1753e3fae69f',panelIndex:'9',type:visualization,version:'6.4.0'),(embeddableConfig:(),gridData:(h:21,i:'10',w:15,x:13,y:0),id:'36a7a460-bbae-11e8-8100-1753e3fae69f',panelIndex:'10',type:visualization,version:'6.4.0')),query:(language:kuery,query:''),timeRestore:!f,title:loginDashboard,viewMode:view)";

	
function changeDashboardDate(btnId){
	var rangeDate="";
	var sDate
	var eDate;

	var from;

	var gJsonType;

	/*일주일 간격, 사용자 정의, 최근 일주일*/
	if(btnId=="searchByWeek" || btnId=="searchByChoice"){
		
		rangeDate = (btnId=="searchByWeek")? $("#w_week").val() : $("#range_select").val();
		
		if(rangeDate!=""){
			sDate = (rangeDate.split("~")[0]).trim();
			eDate = (rangeDate.split("~")[1]).trim();
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
			alert("날짜를 입력하세요");
			return;
		}
	}
	
	/*iframe 의 속성값들*/
	var src = $("#Dashboard").attr("src");		//현재의 dashboard의 src값을 가져옴
	var gRisonType = rison.encode(gJsonType); 	//json -> rison

	/*src를 &를 구분자로 하여 쪼개고, _g 속성에 새로운 값을 넣어준다.*/
	var src1 = src.split("&")[0];
	var newSrc2 = "_g=" + gRisonType;
	var src3 = src.split("&")[2];

	/*새로 넣게 될 src 속성*/
	var newSrc =  src1 + "&" + newSrc2 + "&" + src3;

	$("#Dashboard").attr("src",newSrc);
}
	
function changeDashboard(btnId){
	if(btnId=='homeDashboardBtn' && curDashboard!='homeDashboard'){
		$("#Dashboard").attr("src",homeSrc);
		curDashboard='homeDashboard';

	}else if(btnId=='loginDashboardBtn' && curDashboard!='loginDashboard'){
		$("#Dashboard").attr("src",loginSrc);
		curDashboard='loginDashboard';

	}else if(btnId=='serviceDashboardBtn' && curDashboard!='serviceDashboard'){
		$("#Dashboard").attr("src",serviceSrc);
		curDashboard='serviceDashboard';
	}
}
</script>
</body>
</html>