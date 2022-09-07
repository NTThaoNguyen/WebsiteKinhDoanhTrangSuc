<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html >
<html>
<head>
<link rel="shortcut icon" type="image/png" href="images/logo2.png" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Đăng kí tài khoản</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<base href="${pageContext.servletContext.contextPath}/">
<style>
body {
	font-family: 'Lora', serif, Arial, Helvetica, sans-serif;
}

*[id$=errors] {
	color: red;
	font-style: italic;
}

.notification {
	background-color: #555;
	color: white;
	text-decoration: none;
	padding: 15px 26px;
	position: relative;
	display: inline-block;
	border-radius: 2px;
}

.notification:hover {
	background: red;
}

.notification .badge {
	position: absolute;
	top: -10px;
	right: -10px;
	padding: 5px 10px;
	border-radius: 50%;
	background-color: red;
	color: white;
}

#mySidenav a {
	position: absolute;
	left: -80px;
	transition: 0.3s;
	padding: 15px;
	width: 100px;
	text-decoration: none;
	font-size: 14px;
	color: white;
	border-radius: 0 5px 5px 0;
}

#mySidenav a:hover {
	left: 0;
}

#blog {
	top: 482px;
	background-color: #2196F3;
}

#projects {
	top: 534px;
	background-color: #f44336;
}
</style>
</head>
<body>
	<br></br>
	<div class="container" style="width: 700px">
		<h2>Vivian JEWELS - ĐĂNG KÍ TÀI KHOẢN</h2>
        <p>Xin chào, vui lòng nhập thông tin đăng ký</p>
		<form:form action="/TTTN_WebBanTrangsuc/home/register.htm"
			rel="stylesheet">
			<label style="color: red;">${message}</label>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">Email</label> 
					<label style="color: red;">&nbsp *</label>
					<input name="email" type="email"
						class="form-control" id="inputEmail4" placeholder="Tên đăng nhập">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Password</label> 
					<label style="color: red;">&nbsp *</label>
					<input name="matkhau" type="password"
						class="form-control" id="inputPassword4" placeholder="Mật khẩu">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">Họ và tên đệm</label> 
					<label style="color: red;">&nbsp *</label>
					<input name="ho" type="text"
						class="form-control" id="inputEmail4" placeholder="Họ và tên đệm">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Tên</label> 
					<label style="color: red;">&nbsp *</label>
					<input name="ten" type="text"
						class="form-control" id="inputPassword4" placeholder="Tên">
				</div>
			</div>
			<div class="form-group">
				<%-- <label class="control-label">Giới tính</label> <select
					class="form-control" id="exampleSelect2" >
					<option>-- Chọn giới tính --</option>
					<option>Nam</option>
					<option>Nữ</option>
				</select> --%> <label for="inputAddress">Giới tính</label> 
				<label style="color: red;">&nbsp *</label>
				<input name="gioiTinh" type="text"
					class="form-control" id="inputAddress" placeholder="Giới tính">
			</div>
			<div class="form-group">
				<label for="inputAddress">Số điện thoại</label> 
				<label style="color: red;">&nbsp *</label>
				<input name="sdt" type="tel"
					class="form-control" id="inputAddress" placeholder="Số điện thoại">
			</div>
			<div class="form-group">
				<label for="inputAddress">Địa chỉ</label> 
				<label style="color: red;">&nbsp *</label>
				<input name="diachi" type="text"
					class="form-control" id="inputAddress" placeholder="Địa chỉ">
			</div>
			<p style="color: #ccc;">
				Nhấn vào nút "Đăng ký", đồng nghĩa với việc bạn đồng ý với <a
					href="">Chính sách bảo mật</a> và <a href="">Các điều khoản
					dịch vụ</a> của Vivian JEWELS
			</p>
			<div>
				<button name="btnDangKy" class="btn btn-success">Đăng ký</button>
			</div>
			<div class="mt-2">
				<p style="color: #ccc;">
					Bạn đã có tài khoản Vivian JEWELS? <a href="http://localhost:8080/TTTN_WebBanTrangsuc/home/login.htm">Đăng nhập</a>
				</p>
				<div class="mb-2">
					<a href="http://localhost:8080/TTTN_WebBanTrangsuc/home/home.htm">Quay lại trang chủ</a>
				</div>
			</div>


		</form:form>
	</div>
	
</body>
</html>