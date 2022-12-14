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
<title>${trangsuc.tenTS}</title>
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
	<header class="bg-white fixed-top border-bottom">
		<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
			<ul class="navbar-nav">
				<a href="../home/home.htm" title="Trang ch???"><img alt="logo"
					src="${root}/resources/user2/assets/images/logo3.jfif" width="50"
					height="35"></a>
				<li class="nav-item"><a href="#" class="nav-link text-dark"></a>
					<a href="#" class="nav-link text-dark"></a> <a href="#"
					class="nav-link text-dark"></a></li>
				<li class="nav-item active"><a class="nav-link"
					href="../home/home.htm" title="Trang ch???">TRANG CH???</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../home/gioithieu.htm" title="Gi???i thi???u">GI???I THI???U</a></li>
				<li class="nav-item dropdown"><a 
					class="nav-link dropdown-toggle" id="navbardrop"
					data-toggle="dropdown">S???N PH???M</a>
					<div class="dropdown-menu">
						<a href="../product/sanpham.htm" class="nav-link text-dark">T???t c??? s???n ph???m</a>
						<c:forEach var="type" items="${TypeTS}">
							<a class="dropdown-item" href="TypeTS/${type.getMaLoai()}.htm">${type.getTenLoai()}</a>
						</c:forEach>

					</div></li>
				<li class="nav-item"><a class="nav-link"
					href="../home/tintuc.htm" title="Tin t???c">TIN T???C</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../home/lienhe.htm" title="Li??n h???">LI??N H???</a></li>

				<c:if test="${sessionScope.myLogin== null }">
					<li class="nav-item"><a class="nav-link"
						href="../home/login.htm"
						style="text-align: right; margin-left: 590px">????NG NH???P</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../home/register.htm">????NG K??</a></li>
				</c:if>
				<c:if test="${sessionScope.myLogin!=null }">
					<a href="../cart/index.htm" class="btn btn-secondary"
						style="margin-left: 550px">Gi??? h??ng<span
						class="badge badge-light"></span>
					</a>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbardrop"
						data-toggle="dropdown">Xin ch??o ${sessionScope.myLogin.getKhachhang().getTen()}</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#"> Ch???nh s???a th??ng tin c?? nh??n</a> 
							<a class="dropdown-item" href="../order/show.htm"> L???ch s??? ?????t h??ng</a> 
							<a class="dropdown-item" href="../home/logout.htm"> ????ng xu???t</a>
						</div>
					</li>
				</c:if>

			</ul>

		</nav>

	</header>

	<div class="container-fluid p-3"
		style="margin-top: 102px; background-color: #f0f0f0;">
		<div class="container">
			<h5 class="">
				<a href="../home/home.htm">TRANG CH???</a> / S???N PH???M / <span
					style="color: red;">${trangsuc.tenTS}</span>
			</h5>
		</div>
	</div>

	<div class="container mt-3">
		<div class="row">
			<c:if test="${message==true}">
				<div class="alert alert-success">
					<strong>Gi??? h??ng:</strong> Th??m v??o gi??? h??ng th??nh c??ng!
				</div>
			</c:if>
			<c:if test="${message=='loginFalse'}">
				<div class="alert alert-danger">
					<strong>L???i:</strong> C???n ????ng nh???p ????? th???c hi???n ch???c n??ng n??y
				</div>
			</c:if>
			<c:if test="${message=='max'}">
				<div class="alert alert-danger">
					<strong>L???i:</strong> H??ng trong kho ??t h??n s??? h??ng b???n mu???n ?????t
					vui l??ng ?????t l???i
				</div>
			</c:if>
			<div class="col-md-6">
				<img class="border border-danger"
					style="width: 500px; height: 400px;" src="${hinhanh}" alt="">
			</div>

			<div class="col-md-6">
				<h1 class="name_detail" itemprop="name">${trangsuc.tenTS}</h1>
				<%-- <span class="name-product-nav">${trangsuc.tenTS}</span> --%>
				<p>
					L?????t mua: <span style="color: red;"> ${trangsuc.luotMua}</span> |
					T??nh tr???ng: <span style="color: red;">
						${trangsuc.trangThaiSP}</span>
				</p>
				<h1 class="text-danger">${trangsuc.getGiaVN()}</h1>
				<div class="">
					<p>${trangsuc.moTaNgan}</p>
				</div>
				<form:form modelAttribute="gioHang" action="../cart/themgiohang.htm">
					<div hidden="true">
						<form:input path="maTS" />
						<form:input path="gia" />
					</div>
					<label class="control-label">S??? l?????ng</label>
					<form:input path="soLuong" value="1" min="1" max="50" type="number" />
					<div class="price-box-bar">
						<div class="cart-and-bay-btn">
							<button class="btn btn-primary">
								<i class="fa fa-shopping-cart"></i>Th??m v??o gi??? h??ng
							</button>

							<!-- 						<button type="button" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>Th??m v??o gi??? h??ng</button> -->
						</div>
						<!-- 						<div class="add">
							<button class="add-to-cart title_font"
								data-button-action="add-to-cart" type="submit">
								<i class="shopping-cart  fto fto-bag-2"></i> TH??M V??O GI??? H??NG
							</button>
							<button class="add-to-cart title_font js-buy-now"
								data-button-action="add-to-cart" type="submit">MUA NGAY
							</button>
						</div> -->
					</div>
				</form:form>
			</div>
			<div class="mt-5">
				<!-- 					<h3 class="text-center">M?? t??? s???n ph???m</h3> -->
				<div class="">
					<p>${trangsuc.moTa}</p>
				</div>
			</div>
		</div>


		<div class="container mt-5">
			<div class="row my-2 text-white bg-danger">
				<div class="col-md-6 title ">
					<h3 class="">S???N PH???M LI??N QUAN</h3>
				</div>
				<!-- <div class="col-md-6 mt-3">
					<a href="../product/sanpham.htm" class="float-right text-white">Xem
						t???t c???</a>
				</div> -->
			</div>
		</div>
		<div class="">
			<div class="owl-carousel owl-theme">
				<c:forEach var="sp" items="${tsLienQuan}">
					<div class="item border">
						<div class="product px-2">
							<a href="../product/${sp.maTS}.htm?linkDemo"> <img
								class="product__img" style="width: 240px; height: 230px;"
								src="${sp.getHinhanhList().get(0).getTenHA()}" alt="">
							</a>
							<h6 class="product__name">${sp.getTenTS() }</h6>
							<div class="product__price">
								<p class="new_price">${sp.getGiaVN()}</p>
								<p class="old_price">530,000VN??</p>
							</div>
							<button class="btn btn-success mt-3 w-100">Th??m v??o gi???
								h??ng</button>
						</div>
					</div>
				</c:forEach>



			</div>
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
					<h4 class="text-white">????ng k?? nh???n th??ng tin</h4>
					<p class="text-white">H??y cho ch??ng t??i email c???a b???n v?? b???n s???
						???????c c???p nh???t h??ng ng??y v???i c??c s??? ki???n m???i nh???t, chi ti???t!</p>
					<div class="bg-white d-flex">
						<input class="w-100 border-0 pl-3" type="text"
							placeholder="Nh???p email ????? ????ng k??">
						<button class="btn col-md-2" style="background-color: turquoise;">????ng
							k??</button>
					</div>
				</div>
			</div>
		</div>
		<div class="container mt-4">
			<div class="row pt-3">
				<div class="col-md-3">
					<h4 class="text-white">V??? ch??ng t??i</h4>
					<ul class="navbar-nav footer__menu">
						<li class="nav-item"><a class="nav-link text-secondary"
							href="#"><i class="fas fa-map-marker-alt"></i> 97 Man Thi???n,
								ph?????ng Hi???p Ph??, qu???n 9, TPHCM </a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="#"><i class="fas fa-phone"></i> 0353198388</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="#"><i class="fas fa-envelope"></i>
								n18dccn133@student.ptithcm.edu.vn</a></li>
					</ul>
				</div>

				<div class="col-md-3">
					<h4 class="text-white">Tin t???c</h4>
					<ul class="navbar-nav footer__menu">
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">V??? ch??ng t??i</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Tuy???n d???ng</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Gi???i thi???u chung</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Gi???i thi???u c???a h??ng</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Th???i gian l??m vi???c</a></li>
					</ul>
				</div>

				<div class="col-md-3">
					<h4 class="text-white">C??u h???i th?????ng g???p</h4>
					<ul class="navbar-nav footer__menu">
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">H???i ????p</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Li??n h???</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Khuy???n m??i</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">M???o s??? d???ng m??? ph???m</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">S???n ph???m hot</a></li>
					</ul>
				</div>

				<div class="col-md-3">
					<h4 class="text-white">Ch??nh s??ch</h4>
					<ul class="navbar-nav footer__menu">
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Ch??nh s??ch b???o m???t</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Ch??nh s??ch b???o h??nh</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Ch??nh s??ch v???n chuy???n</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Ch??nh s??ch ?????i h??ng</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="">Quy ?????nh thanh to??n</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<script>
		function tang() {
			var x = $(".so_luong").text();
			x++;
			$(".so_luong").text(x);
		}

		function giam() {
			var x = $(".so_luong").text();
			if (x > 1) {
				x--;
				$(".so_luong").text(x);
			}
		}

		function add_li_hover(x) {
			$(x).addClass("nav-item__after");
		}

		function remove_li_hover(x) {
			$(x).removeClass("nav-item__after");
		}

		function hide() {
			$(".mega-content").addClass("d-none");
		}

		function show() {
			$(".mega-content").removeClass("d-none");
		}

		$(".tang").click(tang);
		$(".giam").click(giam);

		var owl = $('.owl-carousel');
		owl.owlCarousel({
			items : 4,
			loop : true,
			margin : 10,
		});
	</script>
</body>
</html>