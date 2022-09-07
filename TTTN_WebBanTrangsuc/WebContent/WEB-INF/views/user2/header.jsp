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
<title>Trang chủ</title>
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
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="${root}/resources/user2/assets/css/style.css">
<link rel="stylesheet"
	href="${root}/resources/user2/assets/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="${root}/resources/user2/assets/OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
</head>
<body>
	<!-- header py-3 bg-white fixed-top border-bottom -->
	<header class="bg-white fixed-top border-bottom">
		<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
			<ul class="navbar-nav">
				<a href="../home/home.htm" title="Trang chủ"><img alt="logo"
					src="${root}/resources/user2/assets/images/logo3.jfif" width="50"
					height="35"></a>
				<li class="nav-item"><a href="#" class="nav-link text-dark"></a>
					<a href="#" class="nav-link text-dark"></a> <a href="#"
					class="nav-link text-dark"></a></li>
				<li class="nav-item active"><a class="nav-link"
					href="../home/home.htm" title="Trang chủ">TRANG CHỦ</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../home/gioithieu.htm" title="Giới thiệu">GIỚI THIỆU</a></li>
				<li class="nav-item dropdown"><a 
					class="nav-link dropdown-toggle" id="navbardrop"
					data-toggle="dropdown">SẢN PHẨM</a>
					<div class="dropdown-menu">
						<a href="../product/sanpham.htm" class="nav-link text-dark">Tất cả sản phẩm</a>
						<c:forEach var="type" items="${TypeTS}">
							<a class="dropdown-item" href="TypeTS/${type.getMaLoai()}.htm">${type.getTenLoai()}</a>
						</c:forEach>

					</div></li>
				<li class="nav-item"><a class="nav-link"
					href="../home/tintuc.htm" title="Tin tức">TIN TỨC</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../home/lienhe.htm" title="Liên hệ">LIÊN HỆ</a></li>

				<c:if test="${sessionScope.myLogin== null }">
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8080/TTTN_WebBanTrangsuc/home/login.htm"
						style="text-align: right; margin-left: 590px">ĐĂNG NHẬP</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8080/TTTN_WebBanTrangsuc/home/register.htm">ĐĂNG KÝ</a></li>
				</c:if>
				<c:if test="${sessionScope.myLogin!=null }">
					<a href="../cart/index.htm" class="btn btn-secondary"
						style="margin-left: 550px">Giỏ hàng<!-- <i
							class="fas fa-shopping-cart text-primary"></i> --><span
							class="badge text-secondary border border-secondary rounded-circle"
							style="padding-bottom: 2px;">0</span>
					</a>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbardrop"
						data-toggle="dropdown">Xin chào ${sessionScope.myLogin.getKhachhang().getTen()}</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#"> Chỉnh sửa thông tin cá nhân</a> 
							<a class="dropdown-item" href="../home/don-hang-cua-toi.htm"> Lịch sử đặt hàng</a> 
							<a class="dropdown-item" href="../home/logout.htm"> Đăng xuất</a>
						</div>
					</li>
				</c:if>


			</ul>

		</nav>

	</header>