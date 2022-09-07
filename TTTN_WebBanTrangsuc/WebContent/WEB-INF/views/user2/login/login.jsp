<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng nhập</title>
<link rel="shortcut icon" type="image/png"
	href="${root}/resources/user2/assets/img/favicon.png">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
</head>
<body>
	<div class="row body-content w-100">
		<div class="col-md-6 d-flex justify-content-center bg-info h-100">
			<img src="${root}/resources/user2/assets/images/login_banner.svg"
				width="400px" height="750px" alt="">
		</div>

		<div class="col-md-6 p-5 mt-5">
			<div class="text-center" style="max-width: 550px;">
				<h4>Vivian JEWELS - ĐĂNG NHẬP</h4>
				<p>Xin chào, vui lòng nhập thông tin đăng nhập</p>
				<div>
					<form:form action="../home/login.htm" modelAttribute="user">
						<label style="color: red;">${message}</label>
						<div class="form-group">
							<form:input class="form-control my-3 p-2 taikhoan" path="email"
								type="text" placeholder="Tên đăng nhập" />
							<form:errors path="email" />
						</div>
						<div class="form-group">
							<form:input class="form-control my-3 p-2 matkhau" path="password"
								type="password" placeholder="Mật khẩu" />
							<form:errors path="password" />
						</div>
						<a href = "http://localhost:8080/TTTN_WebBanTrangsuc/home/forget.htm" class="float-left mb-2" href="">Quên mật khẩu</a>
						<button class="btn btn-primary w-100 btn__login">Đăng
							nhập</button>
						<p class="float-left my-2" style="color: #ccc;">Hoặc</p>
						<button class="btn btn-outline-info w-100">
							<img src="${root}/resources/user2/assets/images/google.jpg"
								width="25" alt=""> Đăng nhập với Google
						</button>
					</form:form>
				</div>
			</div>

			<div class="mt-5">
				<p style="color: #ccc;">
					Chưa có tài khoản Vivian JEWELS? <a href="http://localhost:8080/TTTN_WebBanTrangsuc/home/register.htm">Đăng
						ký ngay</a>
				</p>
				<div class="mb-2">
					<a href="../home/home.htm">Quay lại trang chủ</a>
				</div>

				<div class="row m-1">
					<div class="" style="cursor: pointer;">
						<span> <img
							src="${root}/resources/user2/assets/images/la-co-viet-nam.png"
							width="25" alt=""> Tiếng Việt
						</span>
					</div>

					<div class="ml-3" style="cursor: pointer;">
						<span> <img
							src="${root}/resources/user2/assets/images/co_my.png" width="25"
							alt=""> English
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <script>
    var window_height = $(window).height();
    var _taikhoan
    var _matkhau
    $(document).ready(function(){
      $(".body-content").css("height", window_height);

      $(".btn__login").click(function(){
        _taikhoan = $(".taikhoan").val();
        _matkhau = $(".matkhau").val();
        if(_taikhoan == "admin" && _matkhau == "1"){
          window.location.href = '/admin';
        }
        else{
          alert("Sai tài khoản hoặc mật khẩu")
        }
      })  
    })
  </script> -->
</body>
</html>