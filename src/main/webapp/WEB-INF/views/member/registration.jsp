<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>홈페이지</title>
	<link rel="stylesheet" href="../resources/css/default.css">
	<link rel="stylesheet" href="../resources/css/home.css">
	<link rel="stylesheet" href="../resources/css/registration.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<!--HOMEPAGE-->
	<div class="home_wrapper">
		<!--헤더-->
		<div class="header_wrapper">
			<header>
				<div class="top_menu">
					<a href="/homepage" class="logo"><img src="../resources/images/logo.jpg" alt="logo"></a>
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
		<div class="footer_wrapper">
			<footer class="footer">
				<a href="#" id="footer_logo"><img src="../resources/images/footer_logo.jpg" alt="푸터로고"></a>
			</footer>
		</div>
		<!--푸터-->
	</div>
	
</body>
</html>