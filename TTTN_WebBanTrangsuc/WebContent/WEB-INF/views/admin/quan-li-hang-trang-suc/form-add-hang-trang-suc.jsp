<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<title>Thêm hãng trang sức | Quản trị Admin</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Main CSS-->
<link rel="stylesheet" type="text/css"
	href="${root}/resources/admin/mainFrame/css/main.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<!-- or -->
<link rel="stylesheet"
	href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery.min.js"
	type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script>
	function readURL(input, thumbimage) {
		if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#thumbimage").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		} else { // Sử dụng cho IE
			$("#thumbimage").attr('src', input.value);

		}
		$("#thumbimage").show();
		$('.filename').text($("#uploadfile").val());
		$('.Choicefile').css('background', '#14142B');
		$('.Choicefile').css('cursor', 'default');
		$(".removeimg").show();
		$(".Choicefile").unbind('click');

	}
	$(document)
			.ready(
					function() {
						$(".Choicefile").bind('click', function() {
							$("#uploadfile").click();

						});
						$(".removeimg")
								.click(
										function() {
											$("#thumbimage").attr('src', '')
													.hide();
											$("#myfileupload")
													.html(
															'<input type="file" id="uploadfile"  onchange="readURL(this);" />');
											$(".removeimg").hide();
											$(".Choicefile").bind(
													'click',
													function() {
														$("#uploadfile")
																.click();
													});
											$('.Choicefile').css('background',
													'#14142B');
											$('.Choicefile').css('cursor',
													'pointer');
											$(".filename").text("");
										});
					})
</script>
</head>

<body class="app sidebar-mini rtl">
	<style>
.Choicefile {
	display: block;
	background: #14142B;
	border: 1px solid #fff;
	color: #fff;
	width: 150px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	padding: 5px 0px;
	border-radius: 5px;
	font-weight: 500;
	align-items: center;
	justify-content: center;
}

.Choicefile:hover {
	text-decoration: none;
	color: white;
}

#uploadfile, .removeimg {
	display: none;
}

#thumbbox {
	position: relative;
	width: 100%;
	margin-bottom: 20px;
}

.removeimg {
	height: 25px;
	position: absolute;
	background-repeat: no-repeat;
	top: 5px;
	left: 5px;
	background-size: 25px;
	width: 25px;
	/* border: 3px solid red; */
	border-radius: 50%;
}

.removeimg::before {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	content: '';
	border: 1px solid red;
	background: red;
	text-align: center;
	display: block;
	margin-top: 11px;
	transform: rotate(45deg);
}

.removeimg::after {
	/* color: #FFF; */
	/* background-color: #DC403B; */
	content: '';
	background: red;
	border: 1px solid red;
	text-align: center;
	display: block;
	transform: rotate(-45deg);
	margin-top: -2px;
}
</style>
	<!-- Navbar-->
	<header class="app-header">
		<!-- Sidebar toggle button-->
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
			aria-label="Hide Sidebar"></a>
		<!-- Navbar Right Menu-->
		<ul class="app-nav">


			<!-- User Menu-->
			<li><a class="app-nav__item" href="../home/logout.htm"><i
					class='bx bx-log-out bx-rotate-180'></i> </a></li>
		</ul>
	</header>
	<!-- Sidebar menu-->
	<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	<aside class="app-sidebar">
		<div class="app-sidebar__user">
			<div>
				<p class="app-sidebar__user-name">
					<b>N18DCCN133</b>
				</p>
				<p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
			</div>
		</div>
		<hr>
		<ul class="app-menu">
			<li><a class="app-menu__item" href="index.htm"><i
					class='app-menu__icon bx bx-tachometer'></i><span
					class="app-menu__label">Bảng điều khiển</span></a></li>
			<li><a class="app-menu__item "
				href="../adminTK/quan-li-nhan-vien.htm"><i
					class='app-menu__icon bx bx-run'></i> <span class="app-menu__label">Quản
						lý nhân viên</span></a></li>
			<li><a class="app-menu__item"
				href="../adminTK/quan-li-khach-hang.htm"><i
					class='app-menu__icon bx bx-user-voice'></i><span
					class="app-menu__label">Quản lý khách hàng</span></a></li>
			<li><a class="app-menu__item active"
				href="../adminTS/quan-li-san-pham.htm"><i
					class='app-menu__icon bx bx-purchase-tag-alt'></i><span
					class="app-menu__label">Quản lý trang sức</span></a></li>
			<li><a class="app-menu__item"
				href="../admin/quan-li-don-hang.htm"><i
					class='app-menu__icon bx bx-cart-alt'></i><span
					class="app-menu__label">Quản lý đơn hàng</span></a></li>
			<li><a class="app-menu__item"
				href="../admin/quan-li-doanh-thu.htm"><i
					class='app-menu__icon bx bx-pie-chart-alt-2'></i><span
					class="app-menu__label">Báo cáo doanh thu</span></a></li>
			<li><a class="app-menu__item" href="#"><i
					class='app-menu__icon bx bx-cog'></i><span class="app-menu__label">Cài
						đặt hệ thống</span></a></li>
		</ul>
	</aside>
	<main class="app-content">
	<div class="app-title">
		<ul class="app-breadcrumb breadcrumb">
			<li class="breadcrumb-item">Danh sách hãng trang sức</li>
			<li class="breadcrumb-item"><a href="#">Thêm hãng trang sức</a></li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="tile">
				<h3 class="tile-title">Tạo mới hãng trang sức</h3>
				<div class="tile-body">
					<form:form action="../adminTS/themHangTrangSuc.htm" modelAttribute="hangTS">
						<div class="row">
							<div class="form-group col-md-4">
								<label class="control-label">Mã hãng</label> </label>
								<label
									style="color: red;">&nbsp *</label>
								<form:input class="form-control" path="maHang" type="text" />
								<form:errors path="maHang" style="color: red; font-size: 12px;"></form:errors>
							</div>
							<div class="form-group col-md-4">
								<label class="control-label">Tên hãng</label> </label><label
									style="color: red;">&nbsp *</label>
								<form:input class="form-control" path="tenHang" type="text" />
								<form:errors path="tenHang" style="color: red; font-size: 12px;"></form:errors>

							</div>
						</div>

						<button class="btn btn-save">Lưu lại</button>
						<a class="btn btn-cancel" data-dismiss="modal" href="../adminTS/quan-li-hang-trang-suc.htm">Hủy bỏ</a>
					</form:form>

				</div>

			</div>
		</div>
	</div>
	</main>


	

	<!-- Essential javascripts for application to work-->
	<script src="${root}/resources/admin/mainFrame/js/jquery-3.2.1.min.js"></script>
	<script src="${root}/resources/admin/mainFrame/js/popper.min.js"></script>
	<script src="${root}/resources/admin/mainFrame/js/bootstrap.min.js"></script>
	<script src="${root}/resources/admin/mainFrame/js/main.js"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script src="${root}/resources/admin/mainFrame/js/plugins/pace.min.js"></script>

</body>

</html>