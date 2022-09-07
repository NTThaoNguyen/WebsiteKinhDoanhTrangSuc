<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Danh sách sản phẩm</title>
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
				<li class="nav-item"><a class="nav-link"
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
<!-- 
				<li class="nav-item"><a class="nav-link"
						href="../home/login.htm"
						style="text-align: right; margin-left: 590px">ĐĂNG NHẬP</a></li>
				<li class="nav-item"><a class="nav-link"
						href="../home/register.htm">ĐĂNG KÝ</a></li>
				<li class="nav-item"><a class="nav-link" href="../cart/index.htm"
						style="margin-left: 550px">Giỏ hàng</a><span
						class="badge badge-light"></span>
				</li> -->
				<c:if test="${sessionScope.myLogin== null }">

					<li class="nav-item"><a class="nav-link"
						href="../home/login.htm"
						style="text-align: right; margin-left: 590px">ĐĂNG NHẬP</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../home/register.htm">ĐĂNG KÝ</a></li>
				</c:if>
				<c:if test="${sessionScope.myLogin!=null }">
					<a href="../cart/index.htm" class="btn btn-secondary"
						style="margin-left: 550px">Giỏ hàng<span
						class="badge badge-light"></span>
					</a>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbardrop"
						data-toggle="dropdown">Xin chào
							${sessionScope.myLogin.getKhachhang().getTen()}</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#"> Chỉnh sửa thông tin cá nhân </a> 
							<a class="dropdown-item" href="../order/show.htm"> Lịch sử đặt hàng</a> 
							<a class="dropdown-item" href="../home/logout.htm"> Đăng xuất</a>
						</div></li>
				</c:if>

			</ul>

		</nav>

	</header>

	<div class="container-fluid p-2"
		style="margin-top: 67px; background-color: #f0f0f0;">
		<div class="container">
			<h5 class="">
				<a href="../home/home.htm">TRANG CHỦ</a> / TẤT CẢ SẢN PHẨM
			</h5>
		</div>
	</div>

	<div class="container mt-3">
		<div class="row">
			<div class="col-md-3">
				<h3>Danh mục</h3>
				<nav class="subnav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link text-dark" href="../home/home.htm">Trang
								chủ</a></li>
						<li class="nav-item"><a class="nav-link text-dark" href="../home/gioithieu.htm">Giới
								thiệu</a></li>
						<li class="pl-3 nav-item row"><a
							class="nav-link text-dark col-md-10" href="">Sản phẩm</a>
							<div class="w-25 p-2 col-md-2 btn-toggle-lv1">
								<i class="fas fa-angle-right fa float-right"></i>
							</div></li>
						<ul class="ml-3 navbar-nav menu-lv1">
							<c:forEach var="type" items="${TypeTS}">
								<a class="dropdown-item" href="TypeTS/${type.getMaLoai()}.htm">${type.getTenLoai()}</a>
							</c:forEach>


						</ul>
						<li class="nav-item"><a class="nav-link text-dark" href="../home/tintuc.htm">Tin
								tức</a></li>
						<li class="nav-item"><a class="nav-link text-dark" href="../home/lienhe.htm">Liên
								hệ</a></li>
					</ul>
				</nav>

				<%-- <h3>Thương hiệu</h3>
				<form action="" class="scrollbar" id="style-1">
					<c:forEach var="hangTS" items="${dshangTS}">
						<div class="form-check my-2">
							<input class="form-check-input" type="checkbox" value="">
							<a href="../product/${hangTS.maHang}.htm?linkHang">${hangTS.getTenHang()}</a>
							<!-- <label class="form-check-label text-secondary ml-1"> ${hangTS.getTenHang()}</label>  -->

						</div>
					</c:forEach>
					<div class="form-check my-2">
						<input class="form-check-input" type="checkbox" value="">
						<label class="form-check-label text-secondary ml-1"> Khác
						</label>
					</div>
				</form> --%>

				<%-- <h3 class="mt-5">Khoảng giá</h3>
				<form action="">
					<div class="form-check my-2">
						<input class="form-check-input" type="checkbox" value="">
						<label class="form-check-label text-secondary ml-1"> Giá
							dưới 100.000đ </label>
					</div>

					<div class="form-check my-2">
						<input class="form-check-input" type="checkbox" value="">
						<label class="form-check-label text-secondary ml-1">
							100.000đ - 200.000đ </label>
					</div>

					<div class="form-check my-2">
						<input class="form-check-input" type="checkbox" value="">
						<label class="form-check-label text-secondary ml-1">
							200.000đ - 300.000đ </label>
					</div>

					<div class="form-check my-2">
						<input class="form-check-input" type="checkbox" value="">
						<label class="form-check-label text-secondary ml-1">
							300.000đ - 500.000đ </label>
					</div>

					<div class="form-check my-2">
						<input class="form-check-input" type="checkbox" value="">
						<label class="form-check-label text-secondary ml-1">
							500.000đ - 1.000.000đ </label>
					</div>

					<div class="form-check my-2">
						<input class="form-check-input" type="checkbox" value="">
						<label class="form-check-label text-secondary ml-1"> Giá
							trên 1.000.000đ </label>
					</div> --%>

				<h3 class="mt-5">Màu sắc</h3>
				<div class="row" style="height: 60px;">
					<a href=""><div class="bg-primary rounded-circle ml-2"
							style="height: 30px; width: 30px;"></div></a> <a href=""><div
							class="bg-secondary rounded-circle ml-2"
							style="height: 30px; width: 30px;"></div></a> <a href=""><div
							class="bg-info rounded-circle ml-2"
							style="height: 30px; width: 30px;"></div></a> <a href=""><div
							class="bg-warning rounded-circle ml-2"
							style="height: 30px; width: 30px;"></div></a> <a href=""><div
							class="bg-danger rounded-circle ml-2"
							style="height: 30px; width: 30px;"></div></a> <a href=""><div
							class="bg-success rounded-circle ml-2"
							style="height: 30px; width: 30px;"></div></a>
				</div>

				<h3 class="mt-2">Sản phẩm nổi bật</h3>
				<nav>
					<ul class="navbar-nav">
						<c:forEach var="sp" items="${TSBChay}">
							<li class="nav-item border-bottom"><a class="nav-link"
								href="">
									<div class="d-flex">
										<%-- 										<div class="">
											<img class="img-item"
												src="${root}/resources/user2/assets/images/dungdichbosonmongtay.jpg"
												alt="">
										</div> --%>
										<a href="../product/${sp.maTS}.htm?linkDemo"> <img
											class="product__img" style="width: 40px; height: 30px;"
											src="${sp.getHinhanhList().get(0).getTenHA()}" alt="">
										</a>
										<div class="">
											<h6 class="name-item">${sp.getTenTS() }</h6>
											<span class="price">${sp.getGiaVN()}<span>
										</div>
									</div>
							</a></li>
						</c:forEach>

					</ul>
					<a href="" class="text-dark">Xem thêm <i
						class="fas fa-angle-right fa"></i></a>
				</nav>
			</div>

			<div class="col-md-9">
				<div class="row d-flex" style="justify-content: space-between;">
					<form:form modelAttribute="inputSearch"
						action="../product/timkiem.htm" class="form-inline my-2 my-lg-0">
						<form:input path="input" class="form-control mr-sm-2"
							type="search" placeholder="Search" aria-label="Search" />
						<button class="btn btn-outline-success my-2 my-sm-0">Search</button>
					</form:form>
					<div class="col-md-4">
						<h3>Tất cả sản phẩm</h3>
					</div>

					<div class="">
						<form action="">
							<span>Ưu tiên xem: </span>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="inlineRadioOptions" id="inlineRadio1" value="option1">
								<label class="form-check-label" for="inlineRadio1">A <i
									class="fas fa-long-arrow-alt-right"></i> Z
								</label>
							</div>

							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="inlineRadioOptions" id="inlineRadio1" value="option1">
								<label class="form-check-label" for="inlineRadio1">Z <i
									class="fas fa-long-arrow-alt-right"></i> A
								</label>
							</div>

							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="inlineRadioOptions" id="inlineRadio1" value="option1">
								<label class="form-check-label" for="inlineRadio1">Giá
									tăng dần</label>
							</div>

							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="inlineRadioOptions" id="inlineRadio1" value="option1">
								<label class="form-check-label" for="inlineRadio1">Giá
									giảm dần</label>
							</div>
						</form>
					</div>
				</div>
				
				<div class="container">
					<div class="row">
						<c:url value="sanpham.htm" var="pagedLink">
							<c:param name="p" value="~" />
						</c:url>
						<c:forEach var="sp" items="${pagedListHolder.pageList}">
							<div class="col-md-4 product card">
								<a href="../product/${sp.maTS}.htm?linkDemo"> <img
									class="product__img" style="width: 240px; height: 230px;"
									src="${sp.getHinhanhList().get(0).getTenHA()}" alt="">
								</a>
								<h6 class="product__name">${sp.getTenTS()}</h6>
								<div class="product__price">
									<p class="new_price">${sp.getGiaVN()}</p>
									<!-- <p class="old_price">560,000VNĐ</p> -->
								</div>
								<!-- <div class="price-box-bar">
									<div class="cart-and-bay-btn">
										<button class="btn btn-primary">
											<i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng
										</button>
									</div>
								</div> -->
								<!-- <button class="btn btn-success mt-3">Xem chi tiết</button> -->
								<button class="btn btn-success mt-3"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</button> 
							</div>
						</c:forEach>
						
					</div>
				</div>
				<br></br>
				<tg:paging pagedListHolder="${pagedListHolder}"
						pagedLink="${pagedLink}" />
				<!-- <div>

					<c:forEach var="sp" items="${dSSanPham}">
						<div class="col-md-4 product card">
							<a href="../product/demo_sanpham.htm"> <img
								class="product__img" style="width: 255px; height: 250px;"
								src="${sp.getHinhanhList().get(0).getTenHA()}" alt="">
							</a>
							<h6 class="product__name">${sp.getTenTS() }</h6>
							<div class="product__price">
								<p class="new_price">560,000đ</p>
								<p class="old_price">1,000,000đ</p>
							</div>
							<button class="btn btn-success mt-3">Thêm vào giỏ hàng</button>
						</div>
					</c:forEach>

				</div> -->

				<!-- <div class="mt-4">
					<ul class="pagination">
						<li class="page-item p-1 disabled"><a href=""
							class="page-link"><i class="fas fa-angle-double-left"></i></a></li>
						<li class="page-item active p-1"><a href="" class="page-link">1</a></li>
						<li class="page-item p-1"><a href="" class="page-link">2</a></li>
						<li class="page-item p-1"><a href="" class="page-link">3</a></li>
						<li class="page-item p-1"><a href="" class="page-link">4</a></li>
						<li class="page-item p-1"><a href="" class="page-link">5</a></li>
						<li class="page-item p-1"><a href="" class="page-link"><i
								class="fas fa-angle-double-right"></i></a></li>
					</ul>
				</div> -->
			</div>
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
						được cập nhật hàng ngày với các chi tiết sự kiện mới nhất!</p>
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
		function add_li_hover(x) {
			$(x).addClass("nav-item__after");
		}

		function remove_li_hover(x) {
			$(x).removeClass("nav-item__after");
		}
		$('.menu-lv1').hide();
		$('.menu-lv2_0').hide();
		$('.menu-lv2_1').hide();
		$('.menu-lv2_2').hide();
		$('.menu-lv2_3').hide();
		$('.menu-lv2_4').hide();
		$('.menu-lv2_5').hide();
		$('.menu-lv2_6').hide();
		$('.menu-lv2_7').hide();
		$(document).ready(function($) {
			$('.counter-value').counterUp({
				delay : 10,
				time : 1000
			});
			$('.btn-toggle-lv1').click(function() {
				$('.menu-lv1').toggle();
			})

			$('.btn-toggle-lv-2_0').click(function() {
				$('.menu-lv2_0').toggle();
			})

			$('.btn-toggle-lv-2_1').click(function() {
				$('.menu-lv2_1').toggle();
			})

			$('.btn-toggle-lv-2_2').click(function() {
				$('.menu-lv2_2').toggle();
			})

			$('.btn-toggle-lv-2_3').click(function() {
				$('.menu-lv2_3').toggle();
			})

			$('.btn-toggle-lv-2_4').click(function() {
				$('.menu-lv2_4').toggle();
			})

			$('.btn-toggle-lv-2_5').click(function() {
				$('.menu-lv2_5').toggle();
			})

			$('.btn-toggle-lv-2_6').click(function() {
				$('.menu-lv2_6').toggle();
			})

			$('.btn-toggle-lv-2_7').click(function() {
				$('.menu-lv2_7').toggle();
			})
		});
	</script>
</body>
</html>