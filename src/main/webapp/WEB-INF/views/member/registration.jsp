<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>홈페이지</title>
	<link rel="stylesheet" href="/resources/css/registration.css">
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
			<div class="content">
				<div class="regit_form_wrapper">
					<div class="regit_form">
						<form action="/member/newRegit" method="POST">
							<table>							
								<tr>
									<td>
										<label for="id">아이디</label>	
									</td>
									<td>
										<input type="text" name="id" id="id">
									</td>
								</tr>
								<tr>
									<td>
										<label for="password">비밀번호</label>	
									</td>
									<td>
										<input type="password" name="password" id="password">
									</td>
								</tr>
								<tr>
									<td>
										<label for="name">이름</label>	
									</td>
									<td>
										<input type="text" name="name" id="name">
									</td>
								</tr>
								<tr>
								<td>
									<input type="submit" value="등록">
								</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>		
		</div>
		<!--내용-->

		<!--푸터-->
		<jsp:include page="/WEB-INF/views/frame/footer.jsp" flush="false"/>
		<!--푸터-->
	</div>
	
</body>
</html>