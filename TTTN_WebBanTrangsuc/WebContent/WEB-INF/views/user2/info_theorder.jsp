<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html >
<html>
<head>
<link rel="shortcut icon" type="image/png" href="images/logo2.png" />
<meta charset="utf-8">

<title>Thông tin đơn hàng</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<base href="${pageContext.servletContext.contextPath}/">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Lora:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Lora', serif, Arial, Helvetica, sans-serif;
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
</style>
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
				<li class="nav-item dropdown"><a href="../product/sanpham.htm"
					class="nav-link dropdown-toggle" id="navbardrop"
					data-toggle="dropdown">SẢN PHẨM</a>
					<div class="dropdown-menu">
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
						href="../home/login.htm"
						style="text-align: right; margin-left: 590px">ĐĂNG NHẬP</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../home/register.htm">ĐĂNG KÝ</a></li>
				</c:if>
				<c:if test="${sessionScope.myLogin!=null }">
					<a href="cart/cart.htm" class="btn btn-secondary"
						style="margin-left: 550px">Giỏ hàng<span
						class="badge badge-light">${sessionScope.myOrder.size()}</span>
					</a>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbardrop"
						data-toggle="dropdown">Xin chào ${sessionScope.myLogin.getKhachhang().getTen()}</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#"> Chỉnh sửa thông tin cá nhân</a> 
							<a class="dropdown-item" href="../order/show.htm"> Lịch sử đặt hàng</a> 
							<a class="dropdown-item" href="../home/logout.htm"> Đăng xuất</a>
						</div>
					</li>
				</c:if>

			</ul>

		</nav>

	</header>
	<br>
	<div class="container" style="width: 700px">
		<h2>Thông tin đơn đặt hàng:</h2>
		<label style="color: red;">${message}</label>
		<%-- <c:if test="${sessionScope.myOrder!=null}"> --%>
			<c:if test="${dSSP != null}">
			<table class="table table-striped">
				<thead>
					<tr>
						<th style="text-align: center;">Hình ảnh</th>
						<th style="text-align: center;">Tên trang sức</th>
						<th style="text-align: center;">Số lượng</th>
						<th style="text-align: center;">Giá</th>
						<th style="text-align: center;">Thành tiền</th>
						<th style="text-align: center;">Thao tác</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="sp" items="${dSSP}">
						<tr>
							<%-- <td>${sp.tenHA}</td> --%>
							<td><a><img alt="logo" src="${sp.tenHA}" width="50" height="35"></a></td>

							<td style="text-align: center;">${sp.tenTS}</td>
							<td style="text-align: center;">${sp.soLuong}</td>
							<td style="text-align: center;">${sp.getTongGiaVN()}</td>
							<td style="text-align: center;">${sp.getGiaVN()}</td>
							<td style="text-align: center;"><a
								href="cart/${sp.maTS}.htm?linkDelete">Xoá</a></td>
						</tr>
					</c:forEach>

					<tr>
						<td>Tổng</td>
						<td style="text-align: center;"></td>
						<td style="text-align: center;"></td>
						<td style="text-align: center;"></td>
						<td style="text-align: center;">${tongTien}</td>
					</tr>

				</tbody>
			</table>
		</c:if>
		<c:if test="${dSSP == null}">
			<div class="text-center">Giỏ hàng trống</div>
		</c:if>
		<form:form modelAttribute="phieuDatHang"
			action="../TTTN_WebBanTrangsuc/cart/order.htm" method="POST">
			<div class="row">
				<div class="col-md-4">
					<label class="form-label"><b>Tên người nhận:</b></label><label
						style="color: red;">&nbsp *</label>
					<form:input path="hoTen" class="form-control" />
					<form:errors path="hoTen" style="color: red; font-size: 12px;"></form:errors>
				</div>
				<div class="col-md-3" hidden="true">
					<label class="form-label"><b>Ngày đặt hàng:</b></label>
					<form:input path="ngayDat" class="form-control" />
				</div>
				<div class="col-md-3">
					<label class="form-label"><b>Ngày đặt hàng:</b></label>
					<form:input path="ngayDat" class="form-control" disabled="true" />
				</div>
				<div class="col-md-3" hidden="true">
					<label class="form-label"><b>Ngày giao dự kiến:</b></label>
					<form:input path="ngayGiaoDuKien" class="form-control" />
				</div>
				<div class="col-md-3">
					<label class="form-label"><b>Ngày giao dự kiến:</b></label>
					<form:input path="ngayGiaoDuKien" class="form-control"
						disabled="true" />
				</div>
			</div>
			<div class="col-md-13">
				<label class="form-label"><b>Địa chỉ nhận hàng:</b></label><label
					style="color: red;">&nbsp *</label>
				<form:textarea path="diaChiNhan" class="form-control" rows="3" />
				<form:errors path="diaChiNhan" style="color: red; font-size: 12px;"></form:errors>
			</div>
			<div class="row">
				<div class="col-md-4">
					<label class="form-label"><b>Email nhận hàng: </b></label>
					<form:input path="emailNhan" class="form-control" />
				</div>
				<div class="col-md-3">
					<label class="form-label"><b>Số điện thoại</b></label><label
						style="color: red;">&nbsp *</label>
					<form:input path="SDTNhan" class="form-control" />
					<form:errors path="SDTNhan" style="color: red; font-size: 12px;"></form:errors>
				</div>
			</div>
			<br>
			<div class="col-md-6">
				<button name="btnSave" class="btn btn-success">Xác nhận đặt
					hàng</button>
			</div>
		</form:form>
	</div>
	<!-- <div id="mySidenav" class="sidenav">
		<a href="https://www.facebook.com/baviet.19/" id="blog">Facebook</a> <a
			href="https://youtu.be/2WU38C1JqQA" id="projects">Youtube</a>
	</div> -->

</body>
</html>