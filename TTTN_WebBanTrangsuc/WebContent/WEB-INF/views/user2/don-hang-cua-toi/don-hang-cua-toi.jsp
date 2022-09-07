<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lịch sử đặt hàng</title>
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

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script
	src="http://bfintal.github.io/Counter-Up/jquery.counterup.min.js"></script>
</head>
<body>
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
						<a href="../product/sanpham.htm" class="nav-link text-dark">Tất
							cả sản phẩm</a>
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
						href="http://localhost:8080/TTTN_WebBanTrangsuc/home/register.htm">ĐĂNG
							KÝ</a></li>
				</c:if>
				<c:if test="${sessionScope.myLogin!=null }">
					<a href="../cart/index.htm" class="btn btn-secondary"
						style="margin-left: 550px">Giỏ hàng<!-- <i
							class="fas fa-shopping-cart text-primary"></i> -->
						<span
						class="badge text-secondary border border-secondary rounded-circle"
						style="padding-bottom: 2px;">0</span>
					</a>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbardrop"
						data-toggle="dropdown">Xin chào
							${sessionScope.myLogin.getKhachhang().getTen()}</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#"> Chỉnh sửa thông tin cá
								nhân</a> <a class="dropdown-item"
								href="../home/don-hang-cua-toi.htm"> Lịch sử đặt hàng</a> <a
								class="dropdown-item" href="../home/logout.htm"> Đăng xuất</a>
						</div></li>
				</c:if>
			</ul>

		</nav>

	</header>

	<div class="container-fluid p-2"
		style="margin-top: 67px; background-color: #f0f0f0;">
		<div class="container">
			<h5 class="">
				<a href="../home/home.htm"><i class="fa fa-home"></i></a> > Lịch sử đặt hàng
			</h5>
		</div>
	</div>
	<section class="vh-100" style="background-color: #8c9eff;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12">
					<div class="card card-stepper text-black"
						style="border-radius: 16px;">
						<div class="card-body p-5">

							<div class="d-flex justify-content-between">
								<div class="d-lg-flex align-items-center">
									<i class="fas fa-clipboard-list fa-3x me-lg-4 mb-3 mb-lg-0"></i>
									<div>
										<p class="fw-bold mb-1">Order</p>
										<p class="fw-bold mb-0">Chờ xác nhận</p>
									</div>
								</div>
								<div class="d-lg-flex align-items-center">
									<i class="fas fa-box-open fa-3x me-lg-4 mb-3 mb-lg-0"></i>
									<div>
										<p class="fw-bold mb-1">Order</p>
										<p class="fw-bold mb-0">Đã xác nhận</p>
									</div>
								</div>
								<div class="d-lg-flex align-items-center">
									<i class="fas fa-shipping-fast fa-3x me-lg-4 mb-3 mb-lg-0"></i>
									<div>
										<p class="fw-bold mb-1">Order</p>
										<p class="fw-bold mb-0">Đang giao</p>
									</div>
								</div>
								<div class="d-lg-flex align-items-center">
									<i class="fas fa-home fa-3x me-lg-4 mb-3 mb-lg-0"></i>
									<div>
										<p class="fw-bold mb-1">Order</p>
										<p class="fw-bold mb-0">Đã nhận</p>
									</div>
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="tile">
					<div class="tile-body">
						<div class="row element-button">
							<div class="col-sm-2">
								<a class="btn btn-add btn-sm"
									href="../home/donhangchoxacnhan.htm" title="Click để xem đơn hàng đang ở trạng thái chờ xác nhận"><i
									class="fas fa-plus"></i> Chờ xác nhận</a>
							</div>
							<div class="col-sm-2">
								<a class="btn btn-add btn-sm"
									href="../home/donhangdaxacnhan.htm" title="Click để xem đơn hàng đang ở trạng thái đã xác nhận"><i
									class="fas fa-plus"></i> Đã xác nhận</a>
							</div>
							<div class="col-sm-2">
								<a class="btn btn-add btn-sm" href="../home/donhangdanggiao.htm"
									title="Click để xem đơn hàng đang ở trạng thái đang giao"><i class="fas fa-plus"></i> Đang giao</a>
							</div>
							<div class="col-sm-2">
								<a class="btn btn-add btn-sm" href="../home/donhangdanhan.htm"
									title="Click để xem đơn hàng đang ở trạng thái đã giao"><i class="fas fa-plus"></i> Đã giao</a>
							</div>
							<div class="col-sm-2">
								<a class="btn btn-add btn-sm" href="../home/donhangdahuy.htm"
									title="Click để xem đơn hàng đang ở trạng thái đã hủy"><i class="fas fa-plus"></i> Đã Hủy</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<br></br>
		</div>
	</div>
	

	<footer class="bg-dark py-4">
		<div class="container">
			<div class="row pt-3">
				<div class="col-md-5">
					<h4 class="text-white">Fanpage</h4>
					<a href=""><i class="icon-facebook rounded fab fa-facebook"></i></a>
					<a href=""><i
						class="icon-twitter rounded fab fa-twitter-square"></i></a> <a href=""><i
						class="icon-google-plus rounded fab fa-google-plus"></i></a> <a
						href=""><i class="icon-wechat rounded fab fa-weixin"></i></a>
				</div>

				<div class="col-md-7 rounded">
					<h4 class="text-white">Đăng ký nhận thông tin</h4>
					<p class="text-white">Hãy cho chúng tôi email của bạn và bạn sẽ
						được cập nhật hàng ngày với các sự kiện mới nhất, chi tiết!</p>
					<div class="bg-white d-flex">
						<input class="w-100 border-0 pl-3" type="text"
							placeholder="Nhập email để đăng ký">
						<button class="btn col-md-2" style="background-color: turquoise;">Đăng
							ký</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container mt-4">
			<div class="row pt-3">
				<div class="col-md-3">
					<h4 class="text-white">Về chúng tôi</h4>
					<ul class="navbar-nav footer__menu">
						<li class="nav-item"><a class="nav-link text-secondary"
							href="#"><i class="fas fa-map-marker-alt"></i> 97 Man Thiện,
								phường Hiệp Phú, quận 9, TPHCM</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="#"><i class="fas fa-phone"></i> 0353198388</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="#"><i class="fas fa-envelope"></i>
								n18dccn133@student.ptithcm.edu.vn</a></li>
					</ul>
				</div>

				<div class="col-md-3">
					<h4 class="text-white">Tin tức</h4>
					<ul class="navbar-nav footer__menu">
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Về chúng tôi</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Tuyển dụng</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Giới thiệu chung</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Giới thiệu cửa hàng</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Thời gian làm việc</a></li>
					</ul>
				</div>

				<div class="col-md-3">
					<h4 class="text-white">Câu hỏi thường gặp</h4>
					<ul class="navbar-nav footer__menu">
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Hỏi đáp</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Liên hệ</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Khuyến mãi</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Mẹo sử dụng mỹ phẩm</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Sản phẩm hot</a></li>
					</ul>
				</div>

				<div class="col-md-3">
					<h4 class="text-white">Chính sách</h4>
					<ul class="navbar-nav footer__menu">
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Chính sách bảo mật</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Chính sách bảo hành</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Chính sách vận chuyển</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Chính sách đổi hàng</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Quy định thanh toán</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<script>
    function add_li_hover(x){
      $(x).addClass("nav-item__after");
    }

    function remove_li_hover(x){
        $(x).removeClass("nav-item__after");
    }

    function hide(){
      $(".mega-content").addClass("d-none");
    }

    function show(){
        $(".mega-content").removeClass("d-none");
    }

    $(document).ready(function( $ ) {
        $('.counter-value').counterUp({
            delay: 10,
            time: 1000
        });
    });
  </script>
</body>
</html>