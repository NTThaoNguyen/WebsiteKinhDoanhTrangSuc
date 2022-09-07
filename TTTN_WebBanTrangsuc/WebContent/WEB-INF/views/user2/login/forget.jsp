<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<title>Forget Password</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="${root}/resources/login/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/login/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/login/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${root}/resources/login/css/main.css">
<!--===============================================================================================-->
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title"
					style="background-image: url(${root}/resources/login/images/bg-01.jpg);">
					<span class="login100-form-title-1"> Forget Password </span>
				</div>

				<form class="login100-form validate-form" action=http://localhost:8080/TTTN_WebBanTrangsuc/home/reset.htm>
					<h4 style="color: black; font-size: 18px;">Enter your email
						address and we will</h4>
					<h4 style="color: black; font-size: 18px;">send you
						instructions on how to reset</h4>
					<h4 style="color: black; font-size: 18px;">your password. Type
						your email below.</h4>
					<br>
					<div class="wrap-input100 validate-input m-b-26"
						data-validate="Email is required">
						<span class="label-input100">Email</span> <input class="input100"
							type="text" name="email" placeholder="Enter your email here">
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">Send</button>
						<p5 class="text-success">${message1}</p5>
						<p5 class="text-danger">${message0}</p5>
					</div>
					<br>
					<p style="color: black; font-size: 16px;">
						Do you want <a href="http://localhost:8080/TTTN_WebBanTrangsuc/home/login.htm"
							style="text-decoration: underline; color: red; font-size: 17px;">Login</a>
						or back to <a href="http://localhost:8080/TTTN_WebBanTrangsuc/home/home.htm"
							style="text-decoration: underline; color: red; font-size: 17px;">
							Homepage</a>
					</p>

				</form>
			</div>
		</div>
	</div>

	<!--===============================================================================================-->
	<script src="${root}/resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${root}/resources/login/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="${root}/resources/login/vendor/bootstrap/js/popper.js"></script>
	<script
		src="${root}/resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="${root}/resources/login/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${root}/resources/login/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="${root}/resources/login/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script
		src="${root}/resources/login/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="${root}/resources/login/js/main.js"></script>

</body>
</html>