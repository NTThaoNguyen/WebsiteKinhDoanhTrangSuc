<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/user2/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- content-->
<div class="banner container-fluid p-0" style="margin-top: 60px;">
	<div id="demo" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100"
					src="${root}/resources/user2/assets/images/banner01.jpg"
					height="500px" alt="First slide">

			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="${root}/resources/user2/assets/images/banner02.jpg"
					height="500px" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="${root}/resources/user2/assets/images/banner03.jpg"
					height="500px" alt="Third slide">

			</div>
		</div>
		<a class="carousel-control-prev" href="#demo" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#demo" role="button"
			data-slide="next"> <span class="carousel-control-next-icon"
			aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
</div>

<div class="container mt-5">
	<div class="row my-2 text-white bg-danger">
		<div class="col-md-6 title">
			<h3 class="">THƯƠNG HIỆU NỔI BẬT</h3>
		</div>
		<div class="col-md-6 mt-3">
			<a href="../home/sanpham.htm" class="float-right text-white">Xem
				tất cả</a>
		</div>
	</div>
	<div class="">
		<div class="owl-carousel owl-theme">
			<div class="item thuonghieu p-5">
				<a href="../home/sanpham.htm"> <img
					src="${root}/resources/user2/assets/images/TH01.png" height="174px"
					alt="">
				</a>
			</div>

			<div class="item thuonghieu p-5">
				<a href="../home/sanpham.htm"> <img
					src="${root}/resources/user2/assets/images/TH02.png" height="174px"
					alt="">
				</a>
			</div>

			<div class="item thuonghieu p-5">
				<a href="../home/sanpham.htm"> <img
					src="${root}/resources/user2/assets/images/TH03.png" height="174px"
					alt="">
				</a>
			</div>

			<div class="item thuonghieu p-5">
				<a href="../home/sanpham.htm"> <img
					src="${root}/resources/user2/assets/images/TH04.jpg" height="174px"
					alt="">
				</a>
			</div>

			<div class="item thuonghieu p-5">
				<a href="../home/sanpham.htm"> <img
					src="${root}/resources/user2/assets/images/Clinique.png"
					height="174px" alt="">
				</a>
			</div>

			<div class="item thuonghieu p-5">
				<a href="../home/sanpham.htm"> <img
					src="${root}/resources/user2/assets/images/logo-gucci.png"
					height="174px" alt="">
				</a>
			</div>
		</div>
	</div>
</div>

<div class="container mt-5">
	<div class="row my-2 text-white bg-danger">
		<div class="col-md-6 title">
			<h3 class="">SẢN PHẨM KHUYẾN MẠI</h3>
		</div>
		<div class="col-md-6 mt-3">
			<a href="../home/sanpham.htm" class="float-right text-white">Xem
				tất cả</a>
		</div>
	</div>
	<div class="">
		<div class="owl-carousel owl-theme">
			<div class="item border">
				<div class="product px-2">
					<a href="../home/demo_sanpham.htm"> <img class="product-img"
						src="${root}/resources/user2/assets/images/anh1.jpg" alt="">
					</a>

					<h6 class="product__name">Bông Tai Nữ Kiểu X.O Thời Trang
						H.A.S Silver</h6>
					<div class="product__price">
						<p class="new_price">180,000VND</p>
						<p class="old_price">200,000VND</p>
					</div>
					<button class="btn btn-success mt-3 w-100">Thêm vào giỏ
						hàng</button>
				</div>
			</div>
			<div class="item border">
				<div class="product px-2">
					<a href="../home/demo_sanpham.htm"> <img class="product-img"
						src="${root}/resources/user2/assets/images/anh2.jpg" alt="">
					</a>

					<h6 class="product__name">Bông Tai Nữ Chiếc Lá Thời Trang
						H.A.S Silver</h6>
					<div class="product__price">
						<p class="new_price">199,000VND</p>
						<p class="old_price">250,000VND</p>
					</div>
					<button class="btn btn-success mt-3 w-100">Thêm vào giỏ
						hàng</button>
				</div>
			</div>
			<div class="item border">
				<div class="product px-2">
					<a href="../home/demo_sanpham.htm"> <img class="product-img"
						src="${root}/resources/user2/assets/images/anh3.jpg" alt="">
					</a>

					<h6 class="product__name">Nhẫn Cặp Đính Đá Thời Trang
						H.A.S Silver</h6>
					<div class="product__price">
						<p class="new_price">199,000VND</p>
						<p class="old_price">250,000VND</p>
					</div>
					<button class="btn btn-success mt-3 w-100">Thêm vào giỏ
						hàng</button>
				</div>
			</div>
			<div class="item border">
				<div class="product px-2">
					<a href="../home/demo_sanpham.htm"> <img class="product-img"
						src="${root}/resources/user2/assets/images/anh4.jpg" alt="">
					</a>

					<h6 class="product__name">Lắc Tay Nữ Kiểu Bông Hoa Thời Trang
						H.A.S Silver</h6>
					<div class="product__price">
						<p class="new_price">180,000VND</p>
						<p class="old_price">200,000VND</p>
					</div>
					<button class="btn btn-success mt-3 w-100">Thêm vào giỏ
						hàng</button>
				</div>
			</div>
			
		</div>
	</div>
</div>

<div class="container mt-5">
	<div class="row my-2 text-white bg-danger">
		<div class="col-md-6 title ">
			<h3 class="">SẢN PHẨM MỚI</h3>
		</div>
		<div class="col-md-6 mt-3">
			<a href="../home/sanpham.htm" class="float-right text-white">Xem
				tất cả</a>
		</div>
	</div>
	<div class="">
		<div class="owl-carousel owl-theme">
			<c:forEach var="tsMoi" items="${TSMoi}">
				<div class="item border">
					<div class="product px-2">
						<a href="../product/${tsMoi.maTS}.htm?linkDemo"> <img class="product__img"
							style="width: 240px; height: 230px;" src="${tsMoi.getHinhanhList().get(0).getTenHA()}" alt="">
						</a> 
						<h6 class="product__name">${tsMoi.getTenTS() }</h6>
						<div class="product__price">
							<p class="new_price">${tsMoi.getGiaVN()}</p>
							<p class="old_price">530,000VNĐ</p>
						</div>
						<button class="btn btn-success mt-3 w-100">Thêm vào giỏ
							hàng</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div> 
	<%-- <div class="">
		<div class="owl-carousel owl-theme">
			<div class="item border">
				<div class="product px-2">
					<a href="../home/demo_sanpham.htm"> <img class="product-img"
						src="${root}/resources/user2/assets/images/spmoi01.jpg" alt="">
					</a>
					<h6 class="product__name">Bông Tai Hình Giọt Nước</h6>
					<div class="product__price">
						<p class="new_price">350,000VND</p>
						<p class="old_price">400,000VND</p>
					</div>
					<button class="btn btn-success mt-3 w-100">Thêm vào giỏ
						hàng</button>
				</div>
			</div>
			<div class="item border">
				<div class="product px-2">
					<a href="../home/demo_sanpham.htm"> <img class="product-img"
						src="${root}/resources/user2/assets/images/spmoi02.jpg" alt="">
					</a>
					<h6 class="product__name">Lắc tay vô cực</h6>
					<div class="product__price">
						<p class="new_price">299,000VND</p>
						<p class="old_price">350,000VND</p>
					</div>
					<button class="btn btn-success mt-3 w-100">Thêm vào giỏ
						hàng</button>
				</div>
			</div>
			<div class="item border">
				<div class="product px-2">
					<a href="../home/demo_sanpham.htm"> <img class="product-img"
						src="${root}/resources/user2/assets/images/spmoi03.jpg" alt="">
					</a>
					<h6 class="product__name">Lắc tay bạc hình trái tim</h6>
					<div class="product__price">
						<p class="new_price">399,000VND</p>
						<p class="old_price">450,000VND</p>
					</div>
					<button class="btn btn-success mt-3 w-100">Thêm vào giỏ
						hàng</button>
				</div>
			</div>
			<div class="item border">
				<div class="product px-2">
					<a href="../home/demo_sanpham.htm"> <img class="product-img"
						src="${root}/resources/user2/assets/images/spmoi04.jpg" alt="">
					</a>
					<h6 class="product__name">Nhẫn trang trí S.N.A.K.E</h6>
					<div class="product__price">
						<p class="new_price">250,000VND</p>
						<p class="old_price">500,000VND</p>
					</div>
					<button class="btn btn-success mt-3 w-100">Thêm vào giỏ
						hàng</button>
				</div>
			</div>		
		</div>
	</div>  --%>
</div> 

<div class="container mt-5">
	<div class="row my-2 text-white bg-danger">
		<div class="col-md-6 title ">
			<h3 class="">SẢN PHẨM NỔI BẬT</h3>
		</div>
		<div class="col-md-6 mt-3">
			<a href="../home/sanpham.htm" class="float-right text-white">Xem
				tất cả</a>
		</div>
	</div>
	<div class="">
		<div class="owl-carousel owl-theme">
			<c:forEach var="sp" items="${TSBChay}">
				<div class="item border">
					<div class="product px-2">
						<a href="../product/${sp.maTS}.htm?linkDemo"> <img class="product__img"
							style="width: 240px; height: 230px;" src="${sp.getHinhanhList().get(0).getTenHA()}" alt="">
						</a> 
						<h6 class="product__name">${sp.getTenTS() }</h6>
						<div class="product__price">
							<p class="new_price">${sp.getGiaVN()}</p>
							<p class="old_price">530,000VNĐ</p>
						</div>
						<button class="btn btn-success mt-3 w-100">Thêm vào giỏ
							hàng</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div class="container">
	<h3 class="text-center mt-5 badge-danger py-2" style="margin: 0 -14px;">TIN
		TỨC</h3>
	<div class="row card-deck mt-4">
		<div class="card col-md-6">
			<a href="../home/tintuc1.htm"><img
				src="${root}/resources/user2/assets/images/tintuc12.jpg"
				width="510px" alt=""></a> <span class="my-3"><i
				class="far fa-clock"></i> 22:22 - 23-6-2021</span>
			<h3>
				<a href="../home/tintuc1.htm" class="news__title">Hướng dẫn đo
					size, kích cỡ nhẫn</a>
			</h3>
			<p>Vivian JELWELS sẽ hướng dẫn bạn cách đo kích thước nhẫn tại
				nhà & cách bí mật đo nhẫn để tạo bất ngờ cho....</p>
			<button class="btn btn-info mb-3">
				<a href="" class="d-block text-white">Xem thêm</a>
			</button>
		</div>

		<div class="card col-md-6">
			<a href="../home/tintuc2.htm"><img
				src="${root}/resources/user2/assets/images/tintuc21.webp"
				width="510px" height="380px" alt=""></a> <span class="my-3"><i
				class="far fa-clock"></i> 22:22 - 23-6-2021</span>
			<h3>
				<a href="../home/tintuc2.htm" class="news__title">Tiêu chuẩn
					chọn lắc tay</a>
			</h3>
			<p>Lắc tay là phụ kiện thời trang mà cô nàng có thể đeo thường
				xuyên, dễ dàng mix and match với nhiều item trang ....</p>
			<button class="btn btn-info mb-3">
				<a href="" class="d-block text-white">Xem thêm</a>
			</button>
		</div>
	</div>
</div>

<!-- Tin tức -->

<%@include file="/WEB-INF/views/user2/footer.jsp"%> 