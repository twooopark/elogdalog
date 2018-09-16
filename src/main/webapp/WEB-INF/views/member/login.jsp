<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/default.css">
<link rel="stylesheet" href="../resources/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>로그인</title>
</head>
<body>
	<!--전체 페이지 wrapper-->
	<div class="content-wrapper">
		<!--login panel outer wrapper-->
		<div class="loginbox-outer-wrapper">
			<!-- login panel inner wrapper-->
			<div class="loginbox-wrapper">
				<!-- login panel top wrapper to insert image-->
				<div class="image-wrapper">
					<img src="../resources/images/daouLogo.png" alt="다우기술 로고" width="250px">
				</div>
				<!-- login panel content wrapper to insert input form-->
				<div class="form-wrapper">
					<form action="/member/loginOK" id="loginForm">
						<table>
							<tr>
								<td>
									<input type="text" id="id" name="id" maxlength="14" placeholder="아이디">
								</td>
							</tr>
							<tr style="height:20px;"><td><span style="color:red" id="idMsg"></span></td></tr>
							<tr>
								<td>
									<input type="password" id="password" name="password" maxlength="14" placeholder="비밀번호">
								</td>
							</tr>
							<tr style="height:20px;"><td><span style="color:red" id="pwMsg"></span></td></tr>
						</table>
					</form>
				</div>
				<!--login panel submit wrapper-->
				<div class="submit-wrapper" id="idCheck">
					<p>로그인</p>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		$("#idCheck").click(function(){
			if($.trim($("#id").val())==""){
				/*아이디 입력 하지 않음*/
				$("#idMsg").text("아이디를 입력하세요");
			}else{
				/*패스워드 입력 하지 않음*/
				if($.trim($("#password").val())==""){
					$("#pwMsg").text("패스워드를 입력하세요");
				}else{
					/*로그인 로직 with Ajax*/
					$.ajax({
						url : "/member/loginCheck",
						type : "POST",
						data : { 	
								id : $("#id").val(),
								password : $("#password").val()
							   },
						success : function(result){
							/*로그인 성공*/
							if(result==1){
								location.href="/homepage";
							}else{
								alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
							}
						}
					})
				}
			}
		})
		
		$("#id").keyup(function(){
			$("#idMsg").text("");
		})
		
		$("#password").keyup(function(){
			$("#pwMsg").text("");
		})	
	})
</script>
</body>
</html>