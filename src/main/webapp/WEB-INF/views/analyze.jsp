<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>GRAPH</title>
	<link rel="stylesheet" href="/resources/css/analyze.css">
</head>
<body>
<%
	if(session.getAttribute("USER_SESSION")==null){
		response.sendRedirect("/member/loginPage");
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
					<li><button onclick="location.href='/analyze'">GRAPH</button></li>
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
								<button id="searchByWeek" class="search_btn" onclick="searchAndWrite()">조회</button>
							</div>
									
							<!-- 원하는 기간 선택 -->	
							<div class="pick_type_choice" id="pick_type_choice">
								<input type="text" class="mydatepicker" id='mydatepicker' readonly="readonly" placeholder="원하는 날짜의 범위를 선택하세요.">
								<button id="searchByChoice" class="search_btn" onclick="searchAndWrite()">조회</button>
							</div>
						</div>
					</div>
				<div class="iframe_wrapper">
				
				</div>
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
	</script>
</body>
</html>