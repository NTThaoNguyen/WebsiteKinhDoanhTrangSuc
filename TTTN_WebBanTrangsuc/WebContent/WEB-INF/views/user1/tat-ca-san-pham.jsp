<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<meta charset="utf-8">
<title>MultiShop - Tất cả sản phẩm</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="${root}/resources/user1/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="${root}/resources/user1/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="${root}/resources/user1/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="${root}/resources/user1/css/style.css" rel="stylesheet">
</head>

<body>
	<!-- Topbar Start -->
	<div class="container-fluid">
		
		<div
			class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
			<div class="col-lg-4">
				<a href="" class="text-decoration-none"> <span
					class="h1 text-uppercase text-primary bg-dark px-2">Vivian</span> <span
					class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Jewels</span>
				</a>
			</div>
			<div class="col-lg-4 col-6 text-left">
				<form action="">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for products">
						<div class="input-group-append">
							<span class="input-group-text bg-transparent text-primary">
								<i class="fa fa-search"></i>
							</span>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-4 col-6 text-right">
				<p class="m-0">Customer Service</p>
				<h5 class="m-0">+0353198388</h5>
			</div>
		</div>
	</div>
	<!-- Topbar End -->


	<!-- Navbar Start -->
	<div class="container-fluid bg-dark mb-30">
		<div class="row px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a
					class="btn d-flex align-items-center justify-content-between bg-primary w-100"
					data-toggle="collapse" href="#navbar-vertical"
					style="height: 65px; padding: 0 30px;">
					<h6 class="text-dark m-0">
						<i class="fa fa-bars mr-2"></i>Tất cả sản phẩm
					</h6> <i class="fa fa-angle-down text-dark"></i>
				</a>
				<nav
					class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
					id="navbar-vertical"
					style="width: calc(100% - 30px); z-index: 999;">
					<div class="navbar-nav w-100">
						<!-- <a href="../product/sanpham.htm" class="nav-item nav-link">Tất
							cả sản phẩm</a> -->
						<c:forEach var="type" items="${TypeTS}">
							<a class="dropdown-item nav-link"
								href="TypeTS/${type.getMaLoai()}.htm">${type.getTenLoai()}</a>
						</c:forEach>
					</div>
				</nav>
			</div>
			<div class="col-lg-9">
				<nav
					class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
					<a href="" class="text-decoration-none d-block d-lg-none"> <span
						class="h1 text-uppercase text-dark bg-light px-2">Multi</span> <span
						class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
					</a>
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<div class="navbar-nav mr-auto py-0">
							<a href="../home/home.htm" class="nav-item nav-link">TRANG
								CHỦ</a> <a href="../home/gioithieu.htm"
								class="nav-item nav-link">GIỚI THIỆU</a> <a
								href="../product/sanpham.htm" class="nav-item nav-link">SẢN
								PHẨM</a> <a href="../home/tintuc.htm" class="nav-item nav-link">TIN
								TỨC</a> <a href="../home/lienhe.htm" class="nav-item nav-link">LIÊN
								HỆ</a>
							
						</div>
						<c:if test="${sessionScope.myLogin== null }">

							<li class="nav-item"><a class="nav-link"
								href="../home/login.htm"
								style="text-align: right; margin-left: 590px">ĐĂNG NHẬP</a></li>
							<li class="nav-item"><a class="nav-link"
								href="../home/register.htm">ĐĂNG KÝ</a></li>
						</c:if>
						<c:if test="${sessionScope.myLogin!=null }">
							<div class="navbar-nav ml-auto py-0 d-none d-lg-block">
								<a href="" class="btn px-0 ml-3"> <i
									class="fas fa-shopping-cart text-primary"></i> <span
									class="badge text-secondary border border-secondary rounded-circle"
									style="padding-bottom: 2px;">0</span>
								</a>
							</div>
							<!-- <a href="../cart/index.htm" class="btn btn-secondary"
								style="margin-left: 550px">Giỏ hàng<span
								class="badge badge-light"></span>
							</a> -->
							<div class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle"
									data-toggle="dropdown">Xin chào ${sessionScope.myLogin.getKhachhang().getTen()}<i
									class="fa fa-angle-down mt-1"></i></a>
								<div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
									<a href="#" class="dropdown-item">Chỉnh sửa thông tin cá nhân</a> 
									<a href="../order/show.htm" class="dropdown-item">Lịch sử đặt hàng</a> 
									<a href="../home/logout.htm" class="dropdown-item">Đăng xuất</a>
								</div>
							</div>
							
						</c:if>
						
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- Navbar End -->


	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="#">Trang chủ</a> <span
						class="breadcrumb-item active">Tất cả sản phẩm</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Shop Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<!-- Shop Sidebar Start -->
			<div class="col-lg-3 col-md-4">
				<!-- Price Start -->
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Khoảng giá</span>
				</h5>
				<div class="bg-light p-4 mb-30">
					<form>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" checked
								id="price-all"> <label class="custom-control-label"
								for="price-all">Tất cả sản phẩm</label> <span
								class="badge border font-weight-normal">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="price-1">
							<label class="custom-control-label" for="price-1">Giá
								dưới 100.000đ</label> <span class="badge border font-weight-normal">150</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="price-2">
							<label class="custom-control-label" for="price-2">100.000đ
								- 200.000đ</label> <span class="badge border font-weight-normal">295</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="price-3">
							<label class="custom-control-label" for="price-3">200.000đ
								- 300.000đ</label> <span class="badge border font-weight-normal">246</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="price-4">
							<label class="custom-control-label" for="price-4">300.000đ
								- 500.000đ</label> <span class="badge border font-weight-normal">145</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
							<input type="checkbox" class="custom-control-input" id="price-5">
							<label class="custom-control-label" for="price-5">Giá
								trên 500.000đ</label> <span class="badge border font-weight-normal">168</span>
						</div>
					</form>
				</div>
				<!-- Price End -->

				<!-- Color Start -->
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">SẢN PHẨM NỔI BẬT</span>
				</h5>
				<div class="bg-light p-4 mb-30">
					<form>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" checked
								id="color-all"> <label class="custom-control-label"
								for="price-all">All Color</label> <span
								class="badge border font-weight-normal">1000</span>
						</div>
						<div
							class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" id="color-1">
							<label class="custom-control-label" for="color-1">Black</label> <span
								class="badge border font-weight-normal">150</span>
						</div>

					</form>
					<nav>
						<ul class="navbar-nav">
							<c:forEach var="sp" items="${TSBChay}">
								<li class="nav-item border-bottom"><a class="nav-link"
									href="">
										<div class="d-flex">
											<a href="../product/${sp.maTS}.htm?linkDemo"> <img
												class="product__img" style="width: 40px; height: 30px;"
												src="${sp.getHinhanhList().get(0).getTenHA()}" alt="">
											</a>
											<div class="">
												<h6 class="name-item">${sp.getTenTS() }</h6>
												<span class="price">${sp.gia}VNĐ</span>
											</div>
										</div>
								</a></li>
							</c:forEach>

						</ul>
						<a href="" class="text-dark">Xem thêm <i
							class="fas fa-angle-right fa"></i></a>
					</nav>
				</div>
				<!-- Color End -->

			</div>
			<!-- Shop Sidebar End -->


			<!-- Shop Product Start -->
			<div class="col-lg-9 col-md-8">
				<div class="row pb-3">
					<div class="col-12 pb-1">
						<div
							class="d-flex align-items-center justify-content-between mb-4">
							<div>
								<button class="btn btn-sm btn-light">
									<i class="fa fa-th-large"></i>
								</button>
								<button class="btn btn-sm btn-light ml-2">
									<i class="fa fa-bars"></i>
								</button>
							</div>
							<div class="ml-2">
								<div class="btn-group">
									<button type="button"
										class="btn btn-sm btn-light dropdown-toggle"
										data-toggle="dropdown">Sorting</button>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" href="#">Latest</a> <a
											class="dropdown-item" href="#">Popularity</a> <a
											class="dropdown-item" href="#">Best Rating</a>
									</div>
								</div>
								<div class="btn-group ml-2">
									<button type="button"
										class="btn btn-sm btn-light dropdown-toggle"
										data-toggle="dropdown">Showing</button>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" href="#">10</a> <a
											class="dropdown-item" href="#">20</a> <a
											class="dropdown-item" href="#">30</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<c:forEach var="sp" items="${dSSanPham}">
						<div class="col-lg-4 col-md-6 col-sm-6 pb-1">
							<div class="product-item bg-light mb-4">
								<div class="product-img position-relative overflow-hidden">
									<a href="../product/${sp.maTS}.htm?linkDemo"> <img
										class="img-fluid w-100"
										src="${sp.getHinhanhList().get(0).getTenHA()}" alt="">
									</a>
								</div>
								<div class="text-center py-4">
									<a class="h6 text-decoration-none text-truncate" href="">${sp.getTenTS()}</a>
									<div
										class="d-flex align-items-center justify-content-center mt-2">
										<h5>${sp.getGiaVN()}</h5>
										<h6 class="text-muted ml-2">
											<del>$123.00</del>
										</h6>
									</div>
								</div>
								<div class="price-box-bar">
									<div class="cart-and-bay-btn">
										<button class="btn btn-primary">
											<i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng
										</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="col-lg-4 col-md-6 col-sm-6 pb-1">
						<div class="product-item bg-light mb-4">
							<div class="product-img position-relative overflow-hidden">
								<img class="img-fluid w-100"
									src="${root}/resources/user1/img/product-1.jpg" alt="">
							</div>
							<div class="text-center py-4">
								<a class="h6 text-decoration-none text-truncate" href="">Product
									Name Goes Here</a>
								<div
									class="d-flex align-items-center justify-content-center mt-2">
									<h5>$123.00</h5>
									<h6 class="text-muted ml-2">
										<del>$123.00</del>
									</h6>
								</div>
								<div class="price-box-bar">
									<div class="cart-and-bay-btn">
										<button class="btn btn-primary">
											<i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng
										</button>
									</div>
								</div>

							</div>
						</div>
					</div>
					
				</div>
				<div class="col-12">
					<nav>
						<ul class="pagination justify-content-center">
							<li class="page-item disabled"><a class="page-link" href="#">Previous</span></a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- Shop Product End -->
	</div>
	</div>
	<!-- Shop End -->


	<!-- Footer Start -->
	<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
		<div class="row px-xl-5 pt-5">
			<div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
				<h5 class="text-secondary text-uppercase mb-4">Về chúng tôi</h5>
				<p class="mb-2">
					<i class="fa fa-map-marker-alt text-primary mr-3"></i>97 Man Thiện,
								phường Hiệp Phú, quận 9, TPHCM
				</p>
				<p class="mb-2">
					<i class="fa fa-envelope text-primary mr-3"></i>n18dccn133@student.ptithcm.edu.vn
				</p>
				<p class="mb-0">
					<i class="fa fa-phone-alt text-primary mr-3"></i>0353198388
				</p>
			</div>
			<div class="col-lg-8 col-md-12">
				<div class="row">
					<div class="col-md-4 mb-5">
						<h5 class="text-secondary text-uppercase mb-4">Tin tức</h5>
						<div class="d-flex flex-column justify-content-start">
							<a class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Về chúng tôi</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Tuyển dụng</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Giới thiệu chung</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Giới thiệu cửa hàng</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Thời gian làm việc</a> 
						</div>
					</div>
					<div class="col-md-4 mb-5">
						<h5 class="text-secondary text-uppercase mb-4">Câu hỏi thường gặp</h5>
						<div class="d-flex flex-column justify-content-start">
							<a class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Hỏi đáp</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Liên hệ</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Khuyến mãi</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Mẹo bảo quản trang sức</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Sản phẩm mới</a> 
						</div>
					</div>
					<div class="col-md-4 mb-5">
						<h5 class="text-secondary text-uppercase mb-4">Đăng ký nhận thông tin</h5>
						<p>Hãy cho chúng tôi email của bạn và bạn sẽ
						được cập nhật hàng ngày với các chi tiết sự kiện mới nhất!</p>
						<form action="">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Nhập email để đăng ký">
								<div class="input-group-append">
									<button class="btn btn-primary">Đăng ký</button>
								</div>
							</div>
						</form>
						<h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
						<div class="d-flex">
							<a class="btn btn-primary btn-square mr-2" href="#"><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-primary btn-square mr-2" href="#"><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-primary btn-square mr-2" href="#"><i
								class="fab fa-linkedin-in"></i></a> <a
								class="btn btn-primary btn-square" href="#"><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row border-top mx-xl-5 py-4"
			style="border-color: rgba(256, 256, 256, .1) !important;">
			<div class="col-md-6 px-xl-0">
				<p class="mb-md-0 text-center text-md-left text-secondary">
					&copy; <a class="text-primary" href="#">Domain</a>. All Rights
					Reserved. Designed by <a class="text-primary"
						href="https://htmlcodex.com">HTML Codex</a>
				</p>
			</div>
			<div class="col-md-6 px-xl-0 text-center text-md-right">
				<img class="img-fluid"
					src="${root}/resources/user1/img/payments.png" alt="">
			</div>
		</div>
	</div>
	<!-- Footer End -->


	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i
		class="fa fa-angle-double-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="${root}/resources/user1/lib/easing/easing.min.js"></script>
	<script
		src="${root}/resources/user1/lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="${root}/resources/user1/mail/jqBootstrapValidation.min.js"></script>
	<script src="${root}/resources/user1/mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="${root}/resources/user1/js/main.js"></script>
</body>

</html>