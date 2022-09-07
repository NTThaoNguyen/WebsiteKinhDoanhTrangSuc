<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<title>Xem chi tiết đơn hàng | Quản trị Admin</title>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

</head>

<body onload="time()" class="app sidebar-mini rtl">
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
			<li><a class="app-menu__item"
				href="../adminTS/quan-li-san-pham.htm"><i
					class='app-menu__icon bx bx-purchase-tag-alt'></i><span
					class="app-menu__label">Quản lý trang sức</span></a></li>
			<li><a class="app-menu__item active"
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
		<ul class="app-breadcrumb breadcrumb side">
			<li class="breadcrumb-item active"><a href="#"><b>Danh
						sách đơn hàng</b></a> > Xem chi tiết đơn hàng</li>
		</ul>
		<div id="clock"></div>
	</div>
	<div class="container">
		<h2 class="main-title text-primary">Thông tin của đơn hàng
			${name}</h2>
		<div class="p-3 mb-2 bg-light text-dark">
			<div class="row">
				<div class="col-md-4">
					<label class="form-label"><b>Mã đơn hàng:</b></label> <label>${gioHang.maGioHang}</label>
				</div>
				<div class="col-md-3">
					<label class="form-label"><b>Tên khách hàng:</b></label> <label>${gioHang.hoTen}</label>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<label class="form-label"><b>Địa chỉ nhận:</b></label> <label>${gioHang.diaChiNhan}</label>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label class="form-label"><b>Ngày đặt:</b></label> <label>${gioHang.ngayDat}</label>
				</div>
				<div class="col-md-3">
					<label class="form-label"><b>Ngày giao dự kiến:</b></label> <label>${gioHang.ngayGiaoDuKien}</label>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<label class="form-label"><b>Số điện thoại:</b></label> <label>${gioHang.sDTNhan}</label>
				</div>
				<c:if test="${gioHang.emailNhan != null}">
					<div class="col-md-3">
						<label class="form-label"><b>Email:</b></label> <label>${gioHang.emailNhan}</label>
					</div>
				</c:if>
			</div>
			<div class="row">
				<div class="col-md-6">
					<label class="form-label"><b>Hình thức thanh toán:</b></label> <label>Thanh
						toán khi nhận hàng</label>
				</div>
			</div>
		</div>
		<div class="p-3 mb-2 bg-light text-dark">
			<table class="table">
				<thead>
					<tr class="table-secondary">
						<th class="text-center">Hình ảnh</th>
						<th class="text-center">Tên sản phẩm</th>
						<th class="text-center">Số lượng</th>
						<th class="text-center">Giá</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="sp" items="${dSSP}">
						<tr>
							<td class="align-middle"><img src="${sp.tenHA}" alt=""
										style="width: 60px;"></td>
							<td class="text-center">${sp.tenTS}</td>
							<td class="text-center"><p>${sp.soLuong}</p></td> 
							<td class="text-center"><h6 class="money well">${sp.getGiaVN()}</h6></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<p3>Tổng tiền: </p3>
			<b class="money well"
				style="margin-left: 5px; font-size: 20px; color: black;">${tongTien}</b>
		</div>
		<div class="col-md-6">
			<c:if test="${loaiTrang == 'choXacNhan'}">
				<a href="../admin/${gioHang.maGioHang}.htm?linkXacNhan"><button
						class="btn btn-success">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-check-circle"
							viewBox="0 0 16 16"> <path
							d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
						<path
							d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
						</svg>
						&nbsp;Xác nhận
					</button></a>
				<a href="../admin/${gioHang.maGioHang}.htm?linkHuy" type="button" data-bs-toggle="modal"
					data-bs-target="#staticBackdrop"><button class="btn btn-danger">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
						<path
							d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
						<path
							d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
						</svg>
						&nbsp;Huỷ đơn
					</button></a>
			</c:if>
			<c:if test="${loaiTrang == 'daXacNhan'}">
				<label class="form-label"><b>Chọn nhân viên giao hàng</b></label><label style="color: red;">&nbsp *</label>
				<select class="form-control" id="exampleSelect1" name="nhanVienGiao">
					<option>-- Chọn nhân viên --</option>
					<c:forEach var = "nv" items="${nhanvien}">
						<option value="${nv.maNV}">${nv.ho} ${nv.ten}</option>
					</c:forEach>
				</select>
				<br>
				<a href="../admin/${gioHang.maGioHang}.htm?linkGiao"><button
						class="btn btn-success">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-check-circle"
							viewBox="0 0 16 16"> <path
							d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
						<path
							d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
						</svg>
						&nbsp;Xác nhận giao
					</button></a>
			</c:if>
			<c:if test="${loaiTrang == 'dangGiao'}">
				<a href="../admin/${gioHang.maGioHang}.htm?linkDaGiao"><button
						class="btn btn-success">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-check-circle"
							viewBox="0 0 16 16"> <path
							d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
						<path
							d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
						</svg>
						&nbsp;Xác nhận đã giao
					</button></a>
			</c:if>
		</div>
	</div>
	</main>
	<!-- Essential javascripts for application to work-->
	<script src="${root}/resources/admin/mainFrame/js/jquery-3.2.1.min.js"></script>
	<script src="${root}/resources/admin/mainFrame/js/popper.min.js"></script>
	<script src="${root}/resources/admin/mainFrame/js/bootstrap.min.js"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="src/jquery.table2excel.js"></script>
	<script src="${root}/resources/admin/mainFrame/js/main.js"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script src="${root}/resources/admin/mainFrame/js/plugins/pace.min.js"></script>
	<!-- Page specific javascripts-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
	<!-- Data table plugin-->
	<script type="text/javascript"
		src="${root}/resources/admin/mainFrame/js/plugins/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="${root}/resources/admin/mainFrame/js/plugins/dataTables.bootstrap.min.js"></script>
	<script type="text/javascript">$('#sampleTable').DataTable();</script>
	<script>


    //Thời Gian
    function time() {
      var today = new Date();
      var weekday = new Array(7);
      weekday[0] = "Chủ Nhật";
      weekday[1] = "Thứ Hai";
      weekday[2] = "Thứ Ba";
      weekday[3] = "Thứ Tư";
      weekday[4] = "Thứ Năm";
      weekday[5] = "Thứ Sáu";
      weekday[6] = "Thứ Bảy";
      var day = weekday[today.getDay()];
      var dd = today.getDate();
      var mm = today.getMonth() + 1;
      var yyyy = today.getFullYear();
      var h = today.getHours();
      var m = today.getMinutes();
      var s = today.getSeconds();
      m = checkTime(m);
      s = checkTime(s);
      nowTime = h + " giờ " + m + " phút " + s + " giây";
      if (dd < 10) {
        dd = '0' + dd
      }
      if (mm < 10) {
        mm = '0' + mm
      }
      today = day + ', ' + dd + '/' + mm + '/' + yyyy;
      tmp = '<span class="date"> ' + today + ' - ' + nowTime +
        '</span>';
      document.getElementById("clock").innerHTML = tmp;
      clocktime = setTimeout("time()", "1000", "Javascript");

      function checkTime(i) {
        if (i < 10) {
          i = "0" + i;
        }
        return i;
      }
    }
    //In dữ liệu
    var myApp = new function () {
      this.printTable = function () {
        var tab = document.getElementById('sampleTable');
        var win = window.open('', '', 'height=700,width=700');
        win.document.write(tab.outerHTML);
        win.document.close();
        win.print();
      }
    }


    //Modal
    $("#show-emp").on("click", function () {
      $("#ModalUP").modal({ backdrop: false, keyboard: false })
    });
  </script>
</body>

</html>