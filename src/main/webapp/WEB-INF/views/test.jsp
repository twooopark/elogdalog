<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>DOCUMENT</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src='https://cdn.bootcss.com/air-datepicker/2.2.3/js/datepicker.min.js'></script>
	<script src='https://cdn.bootcss.com/air-datepicker/2.2.3/js/i18n/datepicker.en.min.js'></script>
	<script type="text/javascript" src="resources/js/weekpicker.js"></script>
	<script type="text/javascript" src="resources/js/datepicker.js"></script>
	<script type="text/javascript" src="resources/js/initservicepage.js"></script>
	
	<link rel='stylesheet' href='https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css'>
	<link rel='stylesheet' href='https://cdn.bootcss.com/air-datepicker/2.2.3/css/datepicker.min.css'>
	
	<link rel="stylesheet" type="text/css" href="resources/css/template.css">
	<link rel="stylesheet" type="text/css" href="resources/css/common.css">
	<link rel="stylesheet" href="resources/css/default.css">
	<link rel="stylesheet" href="resources/css/document.css">
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
									<select name="serviceList" class="serviceList" id="serviceList">
										<option value=''>-- 선택 --</option>
										<c:forEach var="list" items="${serviceList}">
											<option value="${list}">${list}</option>
										</c:forEach>
									</select>
									<button id="searchByWeek" class="search_btn">조회</button>
								</div>
										
								<!-- 원하는 기간 선택 -->	
								<div class="pick_type_choice" id="pick_type_choice">
									<input type="text" class="mydatepicker" id='mydatepicker' readonly="readonly" placeholder="원하는 날짜의 범위를 선택하세요.">
									<button id="searchByChoice" class="search_btn" onclick="searchAndWrite()">조회</button>
								</div>
							</div>
							<div class="function_wrapper">
								<button>메일 보내기</button>
								<button>인쇄 미리보기</button>
								<button>pdf로 출력</button>
							</div>
					</div>
				<div class="iframe_wrapper" id="formmat">
					<!DOCTYPE html>
<!-- saved from url=(0063)https://sns.daou.co.kr/app/approval/document/247188/popup/print -->


    <title>전자결재 - DaouOffice</title>
    
<!-- index.jsp에 대한 header 부분에 대한 custom 처리사항을 반영합니다. -->

    <!--[if lte IE 8]>
	<script src="/resources/js/vendors/html5.js"></script>
	<script src="/resources/js/vendors/css3-mediaqueries.js"></script>
	<script type="text/javascript" src="/resources/js/vendors/jquery/plugins/flot/excanvas.js"></script>
    <![endif]-->
<body id="main" data-role="main" style="" class="print wrap_fix_body"><div id="content" class="layer_normal layer_mail_print layer_pay_print popup"><div id="toolbar" class="header_print">
		
</div><!-- 결재문서 상세-->   
<div class="content_page report_detail">   
	    <section class="content_wrapper">
            <!--전자결제 상세-->
            <div class="report_type approval_type"><!--전자결재 내용-->              
<div class="approval_import ie9-scroll-fix">
<!-- 문서 내용 표시 테스트 -->
    <form id="document_content" class="form_doc_editor editor_view" data-dpmaxz-eid="1"><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">   <table class="__se_tbl" style="background: white; border: 0px solid black; width: 800px; color: black; font-family: malgun gothic,dotum,arial,tahoma; font-size: 12px; border-collapse: collapse !important;"><!-- Header -->
    <tbody><tr><td colspan="2" style="padding: 3px !important; border: 0px solid black; width: 800px; height: 90px !important; text-align: center; font-size: 30px; font-weight: bold; vertical-align: middle;" class="">관리자웹 접근이력 검토서</td></tr><tr><td style="width:300px; border: 0; padding: 0 !important; vertical-align: middle !important;" class=""><table class="__se_tbl" style="margin: 0px; color: black; border: 1px solid black; font-size: 12px; font-family: &#39;malgun gothic&#39;, dotum, arial, tahoma; border-collapse: collapse !important; background: white;"><!-- User -->
            <tbody><tr><td style="width:100px;padding: 3px !important; height: 25px; vertical-align: middle; border: 1px solid black; text-align: left; font-size: 12px; font-weight: bold; background: #ddd;">기안자</td><td style="width:200px;padding: 3px !important; height: 25px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="system" data-dsl="{{label:draftUser}}" data-id="draftUser" data-name="draftUser" data-value="이창화" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="이창화" value="이창화">${conn_id }</span></td></tr><tr><td style="width:100px;padding: 3px !important; height: 25px; vertical-align: middle; border: 1px solid black; text-align: left; font-size: 12px; font-weight: bold; background: #ddd;">기안일</td><td style="width:200px;padding: 3px !important; height: 25px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="system" data-dsl="{{label:draftDate}}" data-id="draftDate" data-name="draftDate" data-value="2018-08-27(월)" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="2018-08-27(월)" value="2018-08-27(월)">${data.formmat.date }</span></td></tr><tr><td style="width:100px;padding: 3px !important; height: 25px; vertical-align: middle; border: 1px solid black; text-align: left; font-size: 12px; font-weight: bold; background: #ddd;">문서번호</td><td style="width:200px;padding: 3px !important; height: 25px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="system" data-dsl="{{label:docNo}}" data-id="docNo" data-name="docNo" data-value="" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="" value=""></span></td></tr></tbody></table>
    </td><td style="width: 500px; text-align: right; padding: 0px!important; border: 0!important; vertical-align: middle !important" class=""><span class="sign_type1_inline" data-group-seq="0" data-group-name="신청" data-group-max-count="4" data-group-type="type1" data-is-reception="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_tit_wrap"><span class="sign_tit"><strong>신청</strong></span></span><span class="sign_member_wrap" id="activity_1602091"><span class="sign_member"><span class="sign_rank_wrap"><span class="sign_rank">팀원</span></span><span class="sign_wrap"><span class="sign_name"> <strong> 이창화 </strong> </span><span class="sign_position"> <strong> 과장 </strong> </span></span><span class="sign_date_wrap"><span class="sign_date " id="date_1602091">2018/08/27</span></span></span></span></span>

	<span class="sign_type1_inline" data-group-seq="1" data-group-name="승인" data-group-max-count="7" data-group-type="type1" data-is-reception="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_tit_wrap"><span class="sign_tit"><strong>승인</strong></span></span><span class="sign_member_wrap" id="activity_1602092"><span class="sign_member"><span class="sign_rank_wrap"><span class="sign_rank">본부장</span></span><span class="sign_wrap"><span class="sign_name">권순진</span><span class="sign_position">상무보</span></span><span class="sign_date_wrap"><span class="sign_date " id="date_1602092"></span></span></span></span></span>

	<span class="sign_type1_inline" data-group-seq="2" data-group-name="수신" data-group-max-count="7" data-group-type="type1" data-is-reception="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_tit_wrap"><span class="sign_tit"><strong>수신</strong></span></span><span class="sign_member_wrap" id="activity_1602093"><span class="sign_member"><span class="sign_rank_wrap"><span class="sign_rank">팀장</span></span><span class="sign_wrap"><span class="sign_name">김진욱</span><span class="sign_position">부장</span></span><span class="sign_date_wrap"><span class="sign_date " id="date_1602093"></span></span></span></span></span>
<br><br></td></tr></tbody></table>
</span><table class="__se_tbl" style="word-break:break-all; width: 800px; margin: 0px; background: white; border: 0px; font-size: 12px; font-family: &#39;malgun gothic&#39;, dotum, arial, tahoma; border-collapse: collapse !important;"><tbody><tr><td style="word-break:break-all; background: rgb(221, 221, 221); border: 1px solid black; width: 100px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle; padding: 3px !important;">대상 서비스</td><td style="word-break:break-all; background-image: 

initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 1px solid black; width: 300px; height: 22px; vertical-align: middle; padding: 3px !important;"><span data-type="text" data-dsl="{{text}}" data-id="editorForm_3" data-name="editorForm_3" data-value="씨티은행 어드민" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="씨티은행 어드민">씨티은행&nbsp;어드민</span></td><td style="word-break:break-all; background: rgb(221, 221, 221); border: 1px solid black; width: 120px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle; padding: 3px !important;">기간</td><td style="word-break:break-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 1px solid black; width: 300px; height: 22px; vertical-align: middle; padding: 3px !important;"><span data-type="text" data-dsl="{{text}}" data-id="editorForm_4" data-name="editorForm_4" data-value="2018.08.20 ~ 2018.08.26" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="2018.08.20 ~ 2018.08.26"><span id="period"></span></span></td></tr><tr><td style="word-break:break-all; background: rgb(221, 221, 221); border: 1px solid black; width: 100px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle; padding: 3px !important;">작성일</td><td style="word-break:break-all; 

background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 1px solid black; width: 300px; height: 22px; vertical-align: middle; padding: 3px !important;"><span data-type="calendar" data-dsl="{{calendar}}" data-id="editorForm_5" data-name="editorForm_5" data-value="2018-08-27(월)" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="2018-08-27(월)"><span id="date"></span></span></td><td style="word-break:break-all; background: rgb(221, 221, 221); border: 1px solid black; width: 120px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle; padding: 3px !important;">작성자</td><td style="word-break:break-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 1px solid black; width: 300px; height: 22px; vertical-align: middle; padding: 3px !important;"><span data-type="text" data-dsl="{{text}}" data-id="editorForm_6" data-name="editorForm_6" data-value="이창화" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="이창화">이창화</span></td></tr></tbody></table><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">

 <br><table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse;" border="1"><!-- 품의서 --> 

     <tbody><tr><td style="border: 1px solid black; height: 25px; text-align: left; color: rgb(0, 0, 0); padding-right: 5px; padding-bottom: 5px; padding-left: 5px; font-size: 14px; font-weight: bold; vertical-align: middle; border-collapse: separate; background-color: rgb(221, 221, 221);" colspan="4"><span style="font-size: 9pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">● 검토 결과</span></td></tr><tr><td style="padding: 5px; border: 1px solid black; width: 20%; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);">서비스 (URL)</td><td style="padding: 5px; border: 1px solid black; width: 40%; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);">위치 및 로그</td></tr><tr><td style="padding: 5px; border: 1px solid black; width: 20%; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);"><span data-type="textarea" data-dsl="{{textarea}}" data-id="editorForm_7" data-name="editorForm_7" data-value="씨티은행 어드민
https://citi.donutbook.co.kr/cbadmin/comm/login.do" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="씨티은행 어드민
https://citi.donutbook.co.kr/cbadmin/comm/login.do">씨티은행&nbsp;어드민<br>https://citi.donutbook.co.kr/cbadmin/comm/login.do</span></td><td style="padding: 5px; border: 1px solid black; width: 40%; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);"><span data-type="textarea" data-dsl="{{textarea}}" data-id="editorForm_8" data-name="editorForm_8" data-value="/weblog/AdminLog/conan01_citibank_access_YYMMDDHH.log
/weblog/AdminLog/conan02_citibank_access_YYMMDDHH.log" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="/weblog/AdminLog/conan01_citibank_access_YYMMDDHH.log
/weblog/AdminLog/conan02_citibank_access_YYMMDDHH.log">/weblog/AdminLog/conan01_citibank_access_YYMMDDHH.log<br>/weblog/AdminLog/conan02_citibank_access_YYMMDDHH.log</span></td><tr><td colspan="4" style="padding: 5px; border: 1px solid black; width: 40%; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);">점검항목</td></tr><tr><td colspan="4" style="padding: 5px; border: 1px solid black; width: 40%; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);"><span style="font-size: 9pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">1. 로그 기록 정상 

여부</span><br><span style="font-size: 9pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">2. 외부 네트워크 접근 통제</span><br><span style="font-size: 9pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">3. 비 인가된 계정 접

근 통제</span><br><span style="font-size: 9pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">4. 업무 시간외 접근 이력 확인</span><br><span style="font-size: 9pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">5. 무단조회 및 

과다조회 이력 확인</span><br><span style="font-size: 9pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">6. 개인정보 다운로드 이력 확인</span><br><span style="font-size: 9pt; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; line-height: normal; margin-top: 0px; margin-bottom: 0px;">7. 

관리자계정 장기 미 접속 확인</span></td></tr></tr><tr><td style="padding: 5px; border: 1px solid black; height: 50px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle; background-color: rgb(255, 255, 255);" colspan="4"><p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;"></p>

	   <span style="font-weight: normal; border-top: medium none currentcolor; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;"></span>&nbsp;</p><p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;"><span style="font-weight: normal; border-top: medium none currentcolor; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;">&nbsp;</span></p><p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;"><span style="font-weight: normal; border-top: medium none currentcolor; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;">▶ 점검 결과1 - 로그 점검</span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><table class="" style="margin : 0px; border-collapse: collapse !important; color: black; background: white; border: 0px; font-size: 12px; font-family: malgun gothic,dotum,arial,tahoma;"><tbody><tr><td style="background: #ddd; padding: 3px !important; border: 1px solid black; width: 100px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle;">서비스<br>(URL)</td><td style="background: #ddd; padding: 3px !important; border: 1px solid black; width: 100px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle;">접근 기록<br>(로그인 횟수)</td><td style="background: #ddd; padding: 3px !important; border: 1px solid black; width: 100px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle;">근무시간외<br>접근</td><td style="background: #ddd; padding: 3px !important; border: 1px solid black; width: 100px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle;">외부 IP 접근</td><td style="background: #ddd; padding: 3px !important; border: 1px solid black; width: 100px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle;">무단조회 및 접근<br>(비 인가 접근)</td><td style="background: #ddd; padding: 3px !important; border: 1px solid black; width: 100px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle;">과다조회</td><td style="background: #ddd; padding: 3px !important; border: 1px solid black; width: 100px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle;">개인정보<br>다운로드</td></tr><tr><td style="padding: 3px !important; width: 100px; height: 60px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="textarea" data-dsl="{{textarea}}" data-id="editorForm_9" data-name="editorForm_9" data-value="씨티은행 어드민
https://citi.donutbook.co.kr/cbadmin/comm/login.do" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="씨티은행 어드민
https://citi.donutbook.co.kr/cbadmin/comm/login.do">씨티은행&nbsp;어드민<br>https://citi.donutbook.co.kr/cbadmin/comm/login.do</span></td><td style="padding: 3px !important; width: 100px; height: 60px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="textarea" data-dsl="{{textarea}}" data-id="editorForm_10" data-name="editorForm_10" data-value="36회
(29회)" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="36회
(29회)"><span id="accessTry"></span>회<br>(<span id="loginY"></span>회)</span></td><td style="padding: 3px !important; width: 100px; height: 60px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="textarea" data-dsl="{{textarea}}" data-id="editorForm_11" data-name="editorForm_11" data-value="" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select=""><span id="overtimeAccess"></span>회</span></td><td style="padding: 3px !important; width: 100px; height: 60px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="textarea" data-dsl="{{textarea}}" data-id="editorForm_12" data-name="editorForm_12" data-value="18회" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="18회"><span id="externalAccess"></span>회</span></td><td style="padding: 3px !important; width: 100px; height: 60px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="textarea" data-dsl="{{textarea}}" data-id="editorForm_13" data-name="editorForm_13" data-value="3회" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="3회"><span id="unAuthAccess"></span>회</span></td><td style="padding: 3px !important; width: 100px; height: 60px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="textarea" data-dsl="{{textarea}}" data-id="editorForm_14" data-name="editorForm_14" data-value="" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select=""><span id="exAccessCount"></span>건</span></td><td style="padding: 3px !important; width: 100px; height: 60px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="textarea" data-dsl="{{textarea}}" data-id="editorForm_15" data-name="editorForm_15" data-value="" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select=""><span id="downloadCount"></span>회</span></td></tr></tbody></table><p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;"><br>
	<span style="font-weight: normal; border-top: medium none currentcolor; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;"></span></p><p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;"><span style="font-weight: normal; border-top: medium none currentcolor; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;">▶ 점검 결과2 - 관리자 계정 점검</span>&nbsp; &nbsp; &nbsp;</p><table class="" style="margin : 0px; border-collapse: collapse !important; color: black; background: white; border: 0px; font-size: 12px; font-family: malgun gothic,dotum,arial,tahoma;"><tbody><tr><td style="background: #ddd; padding: 3px !important; border: 1px solid black; width: 180px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle;">서비스(관리자 URL)</td><td style="background: #ddd; padding: 3px !important; border: 1px solid black; width: 180px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle;">장기 미 접속 계정</td><td style="background: #ddd; padding: 3px !important; border: 1px solid black; width: 180px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle;">장기 미 접속 기간</td><td style="background: #ddd; padding: 3px !important; border: 1px solid black; width: 180px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle;">비고</td></tr><tr><td style="padding: 3px !important;  height: 60px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="textarea" data-dsl="{{textarea}}" data-id="editorForm_16" data-name="editorForm_16" data-value="씨티은행 어드민
https://citi.donutbook.co.kr/cbadmin/comm/login.do" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="씨티은행 어드민
https://citi.donutbook.co.kr/cbadmin/comm/login.do">씨티은행&nbsp;어드민<br>https://citi.donutbook.co.kr/cbadmin/comm/login.do</span></td><td style="padding: 3px !important;  height: 60px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="textarea" data-dsl="{{textarea}}" data-id="editorForm_17" data-name="editorForm_17" data-value="" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select=""></span></td><td style="padding: 3px !important;  height: 60px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="textarea" data-dsl="{{textarea}}" data-id="editorForm_18" data-name="editorForm_18" data-value="" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select=""></span></td><td style="padding: 3px !important;  height: 60px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="textarea" data-dsl="{{textarea}}" data-id="editorForm_19" data-name="editorForm_19" data-value="" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select=""></span></td></tr></tbody></table><p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;"><br>
	<span style="font-weight: normal; border-top: medium none currentcolor; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;">▶ 세부

사항</span></p><p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: 22px; margin-top: 0px; margin-bottom: 0px;">
	&nbsp;&nbsp;&nbsp;* 점검 결과에 접근 및 조회, 다운로드 횟수(숫자), 세부사항 항목은 점검 결과에 대한 세부 내역 작성<br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;과다조회 기준 1일, 1계정 50회 이상, 기준 이상 조회 경우 내용확인 및 정보보호관리자에게 보고<br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관리자계정 장기 미 접속은 관리자 사이트에서 점검 후 사업팀 사용여부 확인하여 전자결재 통한 진행
	</p></td></tr></tbody></table>
   

    
    <br>

    <table class="" style="width: 800px; margin : 0px; border-collapse: collapse !important; color: black; background: white; border: 0px; font-size: 12px; font-family: malgun gothic,dotum,arial,tahoma;"><tbody><tr><td style="background: #ddd; padding: 3px !important; border: 1px solid black; width: 100px; height: 22px; text-align: left; font-weight: bold; vertical-align: middle;">● 확인 및 조치사항</td></tr><tr><td style="padding: 3px !important; height: 80px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="textarea" data-dsl="{{textarea}}" data-id="editorForm_20" data-name="editorForm_20" data-value="1. 외부 IP 접근 (18회)
 - 8/20 ~ 8/24, 192.193.81.41 IP 접근 11회
 - 8/20 ~ 8/24, 192.193.83.41 IP 접근 7회
※ 씨티은행 담당자 계정(citi8, citi23) 접근 정상 확인

2. 비 인가 IP 접근 (3회)
 - 8/21 14:30분, 64.233.172.144 IP 접근 1회
 - 8/23 08:29분, 64.233.172.144 IP 접근 1회
 - 8/24 08:43분, 64.233.172.142 IP 접근 1회
※ 비 인가 IP 접근 정상 차단 확인" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="1. 외부 IP 접근 (18회)
 - 8/20 ~ 8/24, 192.193.81.41 IP 접근 11회
 - 8/20 ~ 8/24, 192.193.83.41 IP 접근 7회
※ 씨티은행 담당자 계정(citi8, citi23) 접근 정상 확인

2. 비 인가 IP 접근 (3회)
 - 8/21 14:30분, 64.233.172.144 IP 접근 1회
 - 8/23 08:29분, 64.233.172.144 IP 접근 1회
 - 8/24 08:43분, 64.233.172.142 IP 접근 1회
※ 비 인가 IP 접근 정상 차단 확인">1.&nbsp;외부&nbsp;IP&nbsp;접근&nbsp;(18회)<br>&nbsp;-&nbsp;8/20&nbsp;~&nbsp;8/24,&nbsp;192.193.81.41&nbsp;IP&nbsp;접근&nbsp;11회<br>&nbsp;-&nbsp;8/20&nbsp;~&nbsp;8/24,&nbsp;192.193.83.41&nbsp;IP&nbsp;접근&nbsp;7회<br>※&nbsp;씨티은행&nbsp;담당자&nbsp;계정(citi8,&nbsp;citi23)&nbsp;접근&nbsp;정상&nbsp;확인<br><br>2.&nbsp;비&nbsp;인가&nbsp;IP&nbsp;접근&nbsp;(3회)<br>&nbsp;-&nbsp;8/21&nbsp;14:30분,&nbsp;64.233.172.144&nbsp;IP&nbsp;접근&nbsp;1회<br>&nbsp;-&nbsp;8/23&nbsp;08:29분,&nbsp;64.233.172.144&nbsp;IP&nbsp;접근&nbsp;1회<br>&nbsp;-&nbsp;8/24&nbsp;08:43분,&nbsp;64.233.172.142&nbsp;IP&nbsp;접근&nbsp;1회<br>※&nbsp;비&nbsp;인가&nbsp;IP&nbsp;접근&nbsp;정상&nbsp;차단&nbsp;확인</span></td></tr></tbody></table>

  

</span></div></span></div></span></div></span></div></span></div></span></div></span></div></span></div></span></form>
</div>  
<div id="attachView"></div>
</div>
            <div class="report_type">
				<section class="aside_wrapper article_reply" id="apprSection" style="display: none;"><!-- 결재의견  -->
					<div class="doc-meta-container reply_wrap"><div class="aside_wrapper_body">
<!-- 결재 진행 상황 -->
<ul class="reply" id="apprflow"><li class="view_option" data-role="button" style="display:">    <span class="ic_classic ic_reply"></span><span class="txt_b">결재의견<span class="num">3</span></span></li>
	<input type="hidden" class="activityGroup" data-groupseq="0" data-groupid="738149" data-groupcount="1">
    		<li>
    			<span class="photo"><a data-userid="390"><img alt="초상화" src="./전자결재 - DaouOffice_files/490884-76965"></a></span>
    			<div class="msg_wrap">
    				<div class="info" data-userid="390" data-username="이창화" data-userposition="과장" data-userdeptid="200" data-userdeptname="웹서비스개발팀" data-useractivitytype="DRAFT" data-useractivityname="기안">
    					<a data-userid="390"><span class="name">이창화 과장</span></a>
    					
    					<span class="department">웹서비스개발팀</span>
    					<div class="doc"><span class="status ">기안 상신 </span><span class="part">|</span><span class="date">2018-08-27(월) 09:04</span></div>
    				</div>
    				
    			</div>		
                <!-- 현재 결재 위치 표시 -->													
    		</li>
	<input type="hidden" class="activityGroup" data-groupseq="1" data-groupid="738150" data-groupcount="1">
    		<li class="current">
    			<span class="photo"><a data-userid="227"><img alt="초상화" src="./전자결재 - DaouOffice_files/23273-730369"></a></span>
    			<div class="msg_wrap">
    				<div class="info" data-userid="227" data-username="권순진" data-userposition="상무보" data-userdeptid="99" data-userdeptname="서비스개발본부" data-useractivitytype="APPROVAL" data-useractivityname="결재">
    					<a data-userid="227"><span class="name">권순진 상무보</span></a>
    					
    					<span class="department">서비스개발본부</span>
    					<div class="doc"><span class="status ">결재 대기 </span></div>
    				</div>
    				
    			</div>		
                <div class="bar_current"></div><!-- 현재 결재 위치 표시 -->													
    		</li>
	<input type="hidden" class="activityGroup" data-groupseq="2" data-groupid="738151" data-groupcount="1">
    		<li class="inactive"><!-- 비활성화 결재선 -->
    			<span class="photo"><a data-userid="274"><img alt="초상화" src="./전자결재 - DaouOffice_files/490890-82841"></a></span>
    			<div class="msg_wrap">
    				<div class="info" data-userid="274" data-username="김진욱" data-userposition="부장" data-userdeptid="199" data-userdeptname="시스템보안팀" data-useractivitytype="APPROVAL" data-useractivityname="결재">
    					
    					<span class="name">김진욱 부장</span>
    					<span class="department">시스템보안팀</span>
    					<div class="doc"><span class="status ">결재 예정 </span></div>
    				</div>
    				
    			</div>		
                <!-- 현재 결재 위치 표시 -->													
    		</li>
</ul>
<!-- // 결재 진행 상황 -->
</div></div>
				</section>
				<section class="article_reply" id="commentSection" style="display: none;"><div class="reply_wrap">
	<ul class="reply" id="comment_reply"><li class="view_option" data-role="button" style="display:">    <span class="ic_classic ic_reply"></span><span class="txt_b">댓글<span class="num" id="replyCount">0</span></span></li>
    </ul>
        
</div></section><!-- 댓글 -->
			</div>
	    </section> 
</div>
</div></body></html>
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
	$(function(){
		initConfig();

		$("#searchByWeek").on("click", searchByWeek);

		function searchByWeek() {
			var selected = $("#w_week option:selected").val();
			var split = selected.split( "~");
			var startDate = split[0];
			var endDate = split[1];
			var serviceName = $("#serviceList option:selected").val();
			
			var data = {
				"startDate" : startDate,
				"endDate" : endDate,
				"serviceName" : serviceName
			};
			var json = JSON.stringify(data);
			$.ajax({
				url : "/test",
				type :"POST",
				method : "POST",
				contentType: "application/json",
				data : json,
				success : function(data) {
					
					var formmat = data.formmat;
					var serviceList = data.serviceList;
					console.log(formmat);
					$('#date').text(formmat.date);
					$('#period').text(formmat.period);
					$('#accessTry').text(formmat.accessTry);
					$('#loginY').text(formmat.loginY);
					$('#exAccessCount').text(formmat.exAccessCount);
					$('#exAccessId').text(formmat.exAccessId);
					$('#downloadCount').text(formmat.downloadCount);
					$('#externalAccess').text(formmat.externalAccess);
					$('#unAuthAccess').text(formmat.unAuthAccess);
					$('#externalIpList').text(formmat.externalIpList);
					$('#unAuthIpList').text(formmat.unAuthIpList);
					$('#overtimeAccess').text(formmat.overtimeAccess);
				},
				error : function(err){
					alert("에러발생");
				}
			});
		}
	})
	</script>