<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>DOCUMENT</title>
	<link rel="stylesheet" href="/resources/css/document.css">
</head>
<body>
<%-- <%
	if(session.getAttribute("USER_SESSION")==null){
		response.sendRedirect("/");
	}
%> --%>
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
<html lang="ko" class="">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=1024">
    <meta name="base" content="/">
    <meta name="locale" content="ko">
    <meta name="device" content="pc">
    <meta name="revision" content="2018072061204">
    <meta name="profile" content="production">
    <meta name="brandName" content="DaouOffice">
    <meta name="gaTrackerId" content="UA-47455550-2">
    <title>전자결재 - DaouOffice</title>
    
<!-- index.jsp에 대한 header 부분에 대한 custom 처리사항을 반영합니다. -->

    <!--[if lte IE 8]>
	<script src="/resources/js/vendors/html5.js"></script>
	<script src="/resources/js/vendors/css3-mediaqueries.js"></script>
	<script type="text/javascript" src="/resources/js/vendors/jquery/plugins/flot/excanvas.js"></script>
    <![endif]-->
   
<style type="text/css">#dpmaxz_fbm_gui *, #dpmaxz_fbm_gui *:after, #dpmaxz_fbm_gui *:before,#dpmaxz_fbi_root *, #dpmaxz_fbi_root *:after, #dpmaxz_fbi_root *:before{margin: 0;padding: 0;box-sizing: content-box; width: auto;}.dpmaxz_hidden {visibility: hidden;}#dpmaxz_fbm_gui {position: static; -moz-user-select: none;-webkit-user-select: none; margin: 0;padding: 0;cursor: default;}#dpmaxz_fbi_root {-webkit-user-select: none; position: relative; display: inline-block; z-index: 2147483646; margin: 0;padding: 0;}#dpmaxz_fbi_root .dpmaxz_fbi_mainbkg { display: block;position: absolute;cursor: default;width: 50px;height: 24px;background: transparent url(chrome-extension://pkdnjfgdoolnmiacpdamadcneoblphbj/images/mainbkg.png) no-repeat;}#dpmaxz_fbi_root .dpmaxz_fbi_mainbkg .dpmaxz_fbi_fbishield {float: left;margin: -16px 0 0 3px;  padding: 0;background: transparent url(chrome-extension://pkdnjfgdoolnmiacpdamadcneoblphbj/images/mainimg.png) no-repeat;}#dpmaxz_fbi_root .dpmaxz_fbi_mainbkg .dpmaxz_fbi_authok {background: transparent url(chrome-extension://pkdnjfgdoolnmiacpdamadcneoblphbj/images/mainimg_ok.png) no-repeat;}#dpmaxz_fbi_root .dpmaxz_fbi_mainbkg .dpmaxz_fbi_authno {background: transparent url(chrome-extension://pkdnjfgdoolnmiacpdamadcneoblphbj/images/mainimg_no.png) no-repeat;}#dpmaxz_fbi_root .dpmaxz_fbi_mainbkg .dpmaxz_fbi_xchg {background: transparent url(chrome-extension://pkdnjfgdoolnmiacpdamadcneoblphbj/images/mainxchg.png) no-repeat;}#dpmaxz_fbi_root .dpmaxz_fbi_mainbkg .dpmaxz_fbi_menuact {background: transparent url(chrome-extension://pkdnjfgdoolnmiacpdamadcneoblphbj/images/mainmact.png) no-repeat;}#dpmaxz_fbi_root .dpmaxz_fbi_mainbkg .dpmaxz_fbi_add {height: 16px;width: 15px;float: right;background: transparent url(chrome-extension://pkdnjfgdoolnmiacpdamadcneoblphbj/images/mainadd.png) no-repeat;margin: 0 -16px 0 0;}#dpmaxz_fbm_gui .dpmaxz_fbm_menus {position: absolute; z-index: 2147483647;}.dpmaxz_fbm_menusrel {position: relative;}#dpmaxz_fbm_gui .dpmaxz_fbm_menus ul {position: absolute; left: 0;top: 22px; list-style: none;white-space: nowrap;border: 1px solid #a0a0a0;background-image: -moz-linear-gradient(top, rgb(240,245,255) 73%, white 100%); background-image: -webkit-linear-gradient(top, rgb(240,245,255) 73%, white 100%);box-shadow: 4px 4px 4px -3px #605F70;font-family: 'Segoe UI',Verdana,Arial;font-style: normal;font-size: 1em;padding: 3px 3px;margin: 2px 4px 2px 4px;}#dpmaxz_fbm_gui .dpmaxz_fbm_menus ul li {text-decoration: none;text-align: left;margin: 0; padding: 0;list-style: none;}#dpmaxz_fbm_gui .dpmaxz_fbm_menus ul li:hover {border: 1px solid #aecff7;-webkit-border-radius: 4px;background-color: #edf1f6;margin: -1px;}#dpmaxz_fbm_gui .dpmaxz_fbm_menus .dpmaxz_fbm_row {position: relative;color: black;height: 22px;line-height: 22px;vertical-align: middle;float: none;}#dpmaxz_fbm_gui .dpmaxz_fbm_menus .dpmaxz_fbm_row span {display: inline-block !important;}#dpmaxz_fbm_gui .dpmaxz_fbm_menus .dpmaxz_fbm_rowicon {display: inline-block;width: 26px;height: 22px;position: relative;vertical-align: top;border-right: 1px solid #e2e3e3;font-size: 12px; color: black;}#dpmaxz_fbm_gui .dpmaxz_fbm_menus .dpmaxz_fbm_rowtext {display: inline-block;border-left: 1px solid #ffffff;padding: 0 4px;font: normal 1em 'Segoe UI',Verdana,Arial; font-size: 12px;}.dpmaxz_highlight {border-image: url(chrome-extension://pkdnjfgdoolnmiacpdamadcneoblphbj/images/highlighter.png) 5 9 8 6 repeat;border-style: solid;}#dpmaxz_fbi_root .dpmaxz_fbi_mainbkg .dpmaxz_fbi_fbishield {width: 32px; height: 37px;}.dpmaxz_cf:after {clear: both;content: '.';display: block;font-size: 0;height: 0;line-height: 0;visibility: hidden;}.dpmaxz_hide {display: none;}#dpmaxz_all div {margin: 0;padding: 0;display: block; white-space: normal; text-align: left; }#dpmaxz_all *, #dpmaxz_all *:after, #dpmaxz_all *:before{margin: 0;padding: 0;box-sizing: content-box; width: auto;}#dpmaxz_all {position:fixed;z-index:2147483646;-webkit-user-select: none; cursor: default;transition: visibility .2s cubic-bezier(0, 0, 0, 1.21),opacity .2s cubic-bezier(0, 0, 0, 1.21);}.dpmaxz_all_hidden {visibility: hidden;opacity: 0;}.dpmaxz_fbb_shadowframe {position:relative;}.dpmaxz_fbb_caption {position:relative;}.dpmaxz_fbb_mainimg {float: left;}.dpmaxz_float_right {float: right;}#dpmaxz_all * {box-sizing: content-box;}#dpmaxz_all input[type='button']{width: auto; height: auto;min-width: auto; }#dpmaxz_all input[type='checkbox']{margin: 0;width: auto;        height: auto;       opacity: 1;         float: none;        position: static;}#dpmaxz_all {right: 380px;top: 10px;}#dpmaxz_all .dpmaxz_fbb_shadowframe {width:370px;background: url(chrome-extension://pkdnjfgdoolnmiacpdamadcneoblphbj/images/bar-bkg.png) repeat scroll 0 0;background-size: 100% 100%; background-color: #f9f9f9;border: 1px solid #bebebe;border-radius: 3px;box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1);}#dpmaxz_all #dpmaxz_cap {margin-left: 10px;vertical-align:top;}#dpmaxz_all .dpmaxz_fbb_caption {height: 34px;padding: 12px 0 0 18px;font: normal normal bold 15px/26px 'Helvetica Neue',Helvetica,Arial,sans-serif;background-color: rgba(184, 184, 184, 0.3);color:#5f5f5f;}#dpmaxz_all .dpmaxz_fbb_mainbody {padding: 16px 12px 14px;}#dpmaxz_all .dpmaxz_fbb_maintext {margin-left:60px;font: normal normal normal 12px/18px 'Helvetica Neue',Helvetica,Arial,sans-serif;color: #414141;}#dpmaxz_all .dpmaxz_btn_wrap {margin-top:20px;}#dpmaxz_all input[type='button'].dpmaxz_fbb_btn {line-height: normal;overflow: visible;cursor: pointer;text-align: center;vertical-align: middle;text-decoration: none;transition: all .2s ease 0;font:normal 12px/18px 'Helvetica Neue',Helvetica,Arial,sans-serif;letter-spacing: 0.03em; border: 1px solid #aaa;border-radius: 2px;}#dpmaxz_all input[type='button'].dpmaxz_fbb_btn:hover, #dpmaxz_all input[type='button'].dpmaxz_fbb_btn:focus {color: #212121;border: 1px solid #999;background-color: #fff;border-color: #8b8b8b;box-shadow: 1px 1px 2px 2px rgba(119, 119, 119, 0.23);}#dpmaxz_all input[type='button'].dpmaxz_fbb_btn:hover:disabled{box-shadow:none}#dpmaxz_all input[type='button'].dpmaxz_fbb_mbtn {position: relative;display: inline-block;padding: 8px 15px;color: #000;background-color:#f8f8f8;}#dpmaxz_all input[type='button'].dpmaxz_fbb_mbtn:hover, #dpmaxz_all input[type='button'].dpmaxz_fbb_mbtn:focus {}#dpmaxz_all input[type='button'].dpmaxz_fbb_mbtn:active {box-shadow: none;}#dpmaxz_all input[type='button'].dpmaxz_fbb_mbtn:disabled {color: #bbb;cursor: default;border: 1px solid #e3e3e3;}#dpmaxz_all input[type='button']#dpmaxs_c.dpmaxz_fbb_close {position: absolute;right: 0;width: 42px;margin: 0 12px;padding: 2px 10px;color: #555;background-color:rgba(68,202,255,0);}#dpmaxz_all .dpmaxz_fbb_chk * {font:normal normal normal 12px/18px 'Helvetica Neue',Helvetica,Arial,sans-serif;color:#414141;}#dpmaxz_all .dpmaxz_fbb_chk label {display: block; margin-top:10px;margin-left:60px;}#dpmaxz_all .dpmaxz_fbb_chk span {margin-left:6px;line-height: 20px;vertical-align:middle;color:#414141;}#dpmaxz_all input[type='checkbox']{-ms-transform: scale(1.2); -moz-transform: scale(1.2); -webkit-transform: scale(1.2); -webkit-appearance: checkbox;margin: 0;}#dpmaxz_all .dpmaxz_fbb_shadow {background:url(chrome-extension://pkdnjfgdoolnmiacpdamadcneoblphbj/images/bar-shadow.png) no-repeat scroll 0 0;background-color:transparent;background-size:100% 100%;height:33px;}</style>
<style type="text/css" id="vakata-stylesheet">#vakata-dragged { display:block; margin:0 0 0 0; padding:4px 4px 4px 24px; position:absolute; top:-2000px; line-height:16px; z-index:10000; } #vakata-contextmenu { display:block; visibility:hidden; left:0; top:-200px; position:absolute; margin:0; padding:0; min-width:180px; background:#ebebeb; border:1px solid silver; z-index:10000; *width:180px; } #vakata-contextmenu ul { min-width:180px; *width:180px; } #vakata-contextmenu ul, #vakata-contextmenu li { margin:0; padding:0; list-style-type:none; display:block; } #vakata-contextmenu li { line-height:20px; min-height:20px; position:relative; padding:0px; } #vakata-contextmenu li a { padding:1px 6px; line-height:17px; display:block; text-decoration:none; margin:1px 1px 0 1px; } #vakata-contextmenu li ins { float:left; width:16px; height:16px; text-decoration:none; margin-right:2px; } #vakata-contextmenu li a:hover, #vakata-contextmenu li.vakata-hover > a { background:gray; color:white; } #vakata-contextmenu li ul { display:none; position:absolute; top:-2px; left:100%; background:#ebebeb; border:1px solid gray; } #vakata-contextmenu .right { right:100%; left:auto; } #vakata-contextmenu .bottom { bottom:-1px; top:auto; } #vakata-contextmenu li.vakata-separator { min-height:0; height:1px; line-height:1px; font-size:1px; overflow:hidden; margin:0 2px; background:silver; /* border-top:1px solid #fefefe; */ padding:0; } </style>
<style type="text/css" id="jstree-stylesheet">.jstree ul, .jstree li { display:block; margin:0 0 0 0; padding:0 0 0 0; list-style-type:none; } .jstree li { display:block; min-height:18px; line-height:18px; white-space:nowrap; margin-left:18px; min-width:18px; } .jstree-rtl li { margin-left:0; margin-right:18px; } .jstree > ul > li { margin-left:0px; } .jstree-rtl > ul > li { margin-right:0px; } .jstree ins { display:inline-block; text-decoration:none; width:18px; height:18px; margin:0 0 0 0; padding:0; } .jstree a { display:inline-block; line-height:16px; height:16px; color:black; white-space:nowrap; text-decoration:none; padding:1px 2px; margin:0; } .jstree a:focus { outline: none; } .jstree a > ins { height:16px; width:16px; } .jstree a > .jstree-icon { margin-right:3px; } .jstree-rtl a > .jstree-icon { margin-left:3px; margin-right:0; } li.jstree-open > ul { display:block; } li.jstree-closed > ul { display:none; } #vakata-dragged ins { display:block; text-decoration:none; width:16px; height:16px; margin:0 0 0 0; padding:0; position:absolute; top:4px; left:4px;  -moz-border-radius:4px; border-radius:4px; -webkit-border-radius:4px; } #vakata-dragged .jstree-ok { background:green; } #vakata-dragged .jstree-invalid { background:red; } #jstree-marker { padding:0; margin:0; font-size:12px; overflow:hidden; height:12px; width:8px; position:absolute; top:-30px; z-index:10001; background-repeat:no-repeat; display:none; background-color:transparent; text-shadow:1px 1px 1px white; color:black; line-height:10px; } #jstree-marker-line { padding:0; margin:0; line-height:0%; font-size:1px; overflow:hidden; height:1px; width:100px; position:absolute; top:-30px; z-index:10000; background-repeat:no-repeat; display:none; background-color:#456c43;  cursor:pointer; border:1px solid #eeeeee; border-left:0; -moz-box-shadow: 0px 0px 2px #666; -webkit-box-shadow: 0px 0px 2px #666; box-shadow: 0px 0px 2px #666;  -moz-border-radius:1px; border-radius:1px; -webkit-border-radius:1px; }.jstree .jstree-real-checkbox { display:none; } .jstree-themeroller .ui-icon { overflow:visible; } .jstree-themeroller a { padding:0 2px; } .jstree-themeroller .jstree-no-icon { display:none; }.jstree .jstree-wholerow-real { position:relative; z-index:1; } .jstree .jstree-wholerow-real li { cursor:pointer; } .jstree .jstree-wholerow-real a { border-left-color:transparent !important; border-right-color:transparent !important; } .jstree .jstree-wholerow { position:relative; z-index:0; height:0; } .jstree .jstree-wholerow ul, .jstree .jstree-wholerow li { width:100%; } .jstree .jstree-wholerow, .jstree .jstree-wholerow ul, .jstree .jstree-wholerow li, .jstree .jstree-wholerow a { margin:0 !important; padding:0 !important; } .jstree .jstree-wholerow, .jstree .jstree-wholerow ul, .jstree .jstree-wholerow li { background:transparent !important; }.jstree .jstree-wholerow ins, .jstree .jstree-wholerow span, .jstree .jstree-wholerow input { display:none !important; }.jstree .jstree-wholerow a, .jstree .jstree-wholerow a:hover { text-indent:-9999px; !important; width:100%; padding:0 !important; border-right-width:0px !important; border-left-width:0px !important; } .jstree .jstree-wholerow-span { position:absolute; left:0; margin:0px; padding:0; height:18px; border-width:0; padding:0; z-index:0; }</style>
<style type="text/css">.fancybox-margin{margin-right:0px;}</style>

</head>
<body id="main" data-role="main" style="" class="print wrap_fix_body"><div id="content" class="layer_normal layer_mail_print layer_pay_print popup"><div id="toolbar" class="header_print"></div><!-- 결재문서 상세-->   
<div class="content_page report_detail">   
	    <section class="content_wrapper">
            <!--전자결제 상세-->
            <div class="report_type approval_type"><!--전자결재 내용-->              
<div class="approval_import ie9-scroll-fix">
<!-- 문서 내용 표시 테스트 -->
    <form id="document_content" class="form_doc_editor editor_view" data-dpmaxz-eid="1"><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><div style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;" 맑은="" 고딕";font-size:10pt;"=""><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">   <table class="__se_tbl" style="background: white; border: 0px solid black; width: 800px; color: black; font-family: malgun gothic,dotum,arial,tahoma; font-size: 12px; border-collapse: collapse !important;"><!-- Header -->
    <tbody><tr><td colspan="2" style="padding: 3px !important; border: 0px solid black; width: 800px; height: 90px !important; text-align: center; font-size: 30px; font-weight: bold; vertical-align: middle;" class="">관리자웹 접근이력 검토서</td></tr><tr><td style="width:300px; border: 0; padding: 0 !important; vertical-align: middle !important;" class=""><table class="__se_tbl" style="margin: 0px; color: black; border: 1px solid black; font-size: 12px; font-family: &#39;malgun gothic&#39;, dotum, arial, tahoma; border-collapse: collapse !important; background: white;"><!-- User -->
            <tbody><tr><td style="width:100px;padding: 3px !important; height: 25px; vertical-align: middle; border: 1px solid black; text-align: left; font-size: 12px; font-weight: bold; background: #ddd;">기안자</td><td style="width:200px;padding: 3px !important; height: 25px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="system" data-dsl="{{label:draftUser}}" data-id="draftUser" data-name="draftUser" data-value="이창화" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="이창화" value="이창화">${USER_SESSION.getName() }</span></td></tr><tr><td style="width:100px;padding: 3px !important; height: 25px; vertical-align: middle; border: 1px solid black; text-align: left; font-size: 12px; font-weight: bold; background: #ddd;">기안일</td><td style="width:200px;padding: 3px !important; height: 25px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="system" data-dsl="{{label:draftDate}}" data-id="draftDate" data-name="draftDate" data-value="2018-08-27(월)" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="2018-08-27(월)" value="2018-08-27(월)"><span class="date"></span></span></td></tr><tr><td style="width:100px;padding: 3px !important; height: 25px; vertical-align: middle; border: 1px solid black; text-align: left; font-size: 12px; font-weight: bold; background: #ddd;">문서번호</td><td style="width:200px;padding: 3px !important; height: 25px; vertical-align: middle; border: 1px solid black; font-size: 12px; text-align: left;"><span data-type="system" data-dsl="{{label:docNo}}" data-id="docNo" data-name="docNo" data-value="" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="" value=""></span></td></tr></tbody></table>
    </td><td style="width: 500px; text-align: right; padding: 0px!important; border: 0!important; vertical-align: middle !important" class=""><span class="sign_type1_inline" data-group-seq="0" data-group-name="신청" data-group-max-count="4" data-group-type="type1" data-is-reception="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_tit_wrap"><span class="sign_tit"><strong>신청</strong></span></span><span class="sign_member_wrap" id="activity_1602091"><span class="sign_member"><span class="sign_rank_wrap"><span class="sign_rank">팀원</span></span><span class="sign_wrap"><span class="sign_name"> <strong> 이창화 </strong> </span><span class="sign_position"> <strong> 과장 </strong> </span></span><span class="sign_date_wrap"><span class="sign_date " id="date_1602091">2018/08/27</span></span></span></span></span>

	<span class="sign_type1_inline" data-group-seq="1" data-group-name="승인" data-group-max-count="7" data-group-type="type1" data-is-reception="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_tit_wrap"><span class="sign_tit"><strong>승인</strong></span></span><span class="sign_member_wrap" id="activity_1602092"><span class="sign_member"><span class="sign_rank_wrap"><span class="sign_rank">본부장</span></span><span class="sign_wrap"><span class="sign_name">권순진</span><span class="sign_position">상무보</span></span><span class="sign_date_wrap"><span class="sign_date " id="date_1602092"></span></span></span></span></span>

	<span class="sign_type1_inline" data-group-seq="2" data-group-name="수신" data-group-max-count="7" data-group-type="type1" data-is-reception="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"><span class="sign_tit_wrap"><span class="sign_tit"><strong>수신</strong></span></span><span class="sign_member_wrap" id="activity_1602093"><span class="sign_member"><span class="sign_rank_wrap"><span class="sign_rank">팀장</span></span><span class="sign_wrap"><span class="sign_name">김진욱</span><span class="sign_position">부장</span></span><span class="sign_date_wrap"><span class="sign_date " id="date_1602093"></span></span></span></span></span>
<br><br></td></tr></tbody></table>
</span><table class="__se_tbl" style="word-break:break-all; width: 800px; margin: 0px; background: white; border: 0px; font-size: 12px; font-family: &#39;malgun gothic&#39;, dotum, arial, tahoma; border-collapse: collapse !important;"><tbody><tr><td style="word-break:break-all; background: rgb(221, 221, 221); border: 1px solid black; width: 100px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle; padding: 3px !important;">대상 서비스</td><td style="word-break:break-all; background-image: 

initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 1px solid black; width: 300px; height: 22px; vertical-align: middle; padding: 3px !important;"><span data-type="text" data-dsl="{{text}}" data-id="editorForm_3" data-name="editorForm_3" data-value="씨티은행 어드민" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="씨티은행 어드민">씨티은행&nbsp;어드민</span></td><td style="word-break:break-all; background: rgb(221, 221, 221); border: 1px solid black; width: 120px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle; padding: 3px !important;">기간</td><td style="word-break:break-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 1px solid black; width: 300px; height: 22px; vertical-align: middle; padding: 3px !important;"><span data-type="text" data-dsl="{{text}}" data-id="editorForm_4" data-name="editorForm_4" data-value="2018.08.20 ~ 2018.08.26" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="2018.08.20 ~ 2018.08.26"><span id="period"></span></span></td></tr><tr><td style="word-break:break-all; background: rgb(221, 221, 221); border: 1px solid black; width: 100px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle; padding: 3px !important;">작성일</td><td style="word-break:break-all; 

background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 1px solid black; width: 300px; height: 22px; vertical-align: middle; padding: 3px !important;"><span data-type="calendar" data-dsl="{{calendar}}" data-id="editorForm_5" data-name="editorForm_5" data-value="2018-08-27(월)" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="2018-08-27(월)"><span class="date"></span></span></td><td style="word-break:break-all; background: rgb(221, 221, 221); border: 1px solid black; width: 120px; height: 22px; text-align: center; font-weight: bold; vertical-align: middle; padding: 3px !important;">작성자</td><td style="word-break:break-all; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 1px solid black; width: 300px; height: 22px; vertical-align: middle; padding: 3px !important;"><span data-type="text" data-dsl="{{text}}" data-id="editorForm_6" data-name="editorForm_6" data-value="이창화" data-require="false" data-maxlength="" data-width="" data-defaultstr="" data-editable="true" data-select="이창화">이창화</span></td></tr></tbody></table><span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">

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
		</div>
		<!--내용-->

		<!--푸터-->
		<jsp:include page="/WEB-INF/views/frame/footer.jsp" flush="false"/>
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
				url : "/document",
				type :"POST",
				method : "POST",
				contentType: "application/json",
				data : json,
				success : function(data) {
					
					var formmat = data.formmat;
					var serviceList = data.serviceList;
					console.log(formmat);
					$('.date').text(formmat.date);
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
</body>
</html>