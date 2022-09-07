<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<title>Thống kê doanh thu | Quản trị Admin</title>
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
				href="../admin/quan-li-nhan-vien.htm"><i
					class='app-menu__icon bx bx-run'></i> <span class="app-menu__label">Quản
						lý nhân viên</span></a></li>
			<li><a class="app-menu__item"
				href="../admin/quan-li-khach-hang.htm"><i
					class='app-menu__icon bx bx-user-voice'></i><span
					class="app-menu__label">Quản lý khách hàng</span></a></li>
			<li><a class="app-menu__item"
				href="../admin/quan-li-san-pham.htm"><i
					class='app-menu__icon bx bx-purchase-tag-alt'></i><span
					class="app-menu__label">Quản lý trang sức</span></a></li>
			<li><a class="app-menu__item"
				href="../admin/quan-li-don-hang.htm"><i
					class='app-menu__icon bx bx-cart-alt'></i><span
					class="app-menu__label">Quản lý đơn hàng</span></a></li>
			<li><a class="app-menu__item active"
				href="../admin/quan-li-doanh-thu.htm"><i
					class='app-menu__icon bx bx-pie-chart-alt-2'></i><span
					class="app-menu__label">Báo cáo doanh thu</span></a></li>
			<li><a class="app-menu__item" href="#"><i
					class='app-menu__icon bx bx-cog'></i><span class="app-menu__label">Cài
						đặt hệ thống</span></a></li>
		</ul>
	</aside>
	<main class="app-content">
	<div class="row">
		<div class="col-md-12">
			<div class="app-title">
				<ul class="app-breadcrumb breadcrumb">
					<li class="breadcrumb-item"><a href="../admin/quan-li-doanh-thu.htm"><b>Báo cáo
								doanh thu theo thời gian</b></a></li>
				</ul>
				<div id="clock"></div>
			</div>
		</div>
	</div>
	<div class="p-3 mb-2 bg-light text-dark">
		<form:form modelAttribute="thongKe" action="../admin/laysolieu.htm">
			<div class="row">
				<div class="col-md-3">
					<label class="form-label"><b>Ngày bắt đầu</b></label>
					<div class="input-group date" id="datepicker">
						<form:input path="ngayBD" type="text" class="form-control" />
						<span class="input-group-append"> <span
							class="input-group-text bg-light d-block"> <i
								class="fa fa-calendar"></i>
						</span>
						</span>
					</div>
				</div>
				<div class="col-md-3">
					<label class="form-label"><b>Ngày kết thúc</b></label>
					<div class="input-group date" id="datepicker2">
						<form:input path="ngayKT" type="text" class="form-control" />
						<span class="input-group-append"> <span
							class="input-group-text bg-light d-block"> <i
								class="fa fa-calendar"></i>
						</span>
						</span>
					</div>
					<%-- <form:errors path="ngayApDung" style="color: red; font-size: 12px;"></form:errors> --%>
				</div>
			</div>
			<br>
			<!-- <div class="col-sm-2">
                <a class="btn btn-delete btn-sm print-file js-textareacopybtn" type="button" title="Sao chép"><i
                    class="fas fa-copy"></i> Thống kê</a>
              </div> -->
			<div class="col-md-6">
				<button name="btnSave" class="btn btn-success">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-pencil-square"
						viewBox="0 0 16 16">
  <path
							d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd"
							d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg>
					&nbsp;Thống kê
				</button>
			</div>
		</form:form>
	</div>
	<c:if test="${kq != null && kq != ''}">
		<c:if test="${listKQ.size() > 0}">
			<div class="p-3 mb-2 bg-light text-dark">
				<h1 style="justify-content: center; text-align: center;">THỐNG
					KÊ</h1>
				<div class="row">
					<label class="form-label"><b>Ngày bắt đầu: ${nbd}</b></label>
				</div>
				<div class="row">
					<label class="form-label"><b>Ngày kết thúc: ${nkt}</b></label>
				</div>
				<table class="table">
					<thead>
						<tr class="table-secondary">
							<th class="text-center">Thời gian (Tháng-Năm)</th>
							<th class="text-center">Doanh thu (VND)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${listKQ}">
							<tr>
								<td class="text-center">${i.ngayTaoTN}</td>
								<td class="text-center"><p>${i.getGiaVN()}</p></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- <div class="col-sm-2">
					<a class="btn btn-excel btn-sm" href="" title="In"><i
						class="fas fa-file-excel"></i> Xuất Excel</a>
				</div> -->
				<a href="../admin/exportCSV.htm"><button name="btnSave"
						class="btn btn-success">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-arrow-bar-right"
							viewBox="0 0 16 16">
  <path fill-rule="evenodd"
								d="M6 8a.5.5 0 0 0 .5.5h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L12.293 7.5H6.5A.5.5 0 0 0 6 8zm-2.5 7a.5.5 0 0 1-.5-.5v-13a.5.5 0 0 1 1 0v13a.5.5 0 0 1-.5.5z" />
</svg>
						&nbsp;Xuất file Excel
					</button></a> <label class="form-label"><b
					style="margin-left: 800px; font-size: 20px;">Tổng cộng: ${tong}
						</b></label>
			</div>
		</c:if>
		<c:if test="${listKQ.size() <= 0}">
			<div class="p-3 mb-2 bg-light text-dark">
				<div class="row">
					<label class="form-label"><b>Ngày bắt đầu: ${nbd}</b></label>
				</div>
				<div class="row">
					<label class="form-label"><b>Ngày kết thúc: ${nkt}</b></label>
				</div>
				Không có dữ liệu trong khoảng thời gian đã chọn!
			</div>
		</c:if>
	</c:if> </main>

	<!-- Essential javascripts for application to work-->
	<script src="${root}/resources/admin/mainFrame/js/jquery-3.2.1.min.js"></script>
	<script src="${root}/resources/admin/mainFrame/js/popper.min.js"></script>
	<script src="${root}/resources/admin/mainFrame/js/bootstrap.min.js"></script>
	<script src="${root}/resources/admin/mainFrame/js/main.js"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script src="${root}/resources/admin/mainFrame/js/plugins/pace.min.js"></script>
	<!-- Page specific javascripts-->
	<script type="text/javascript"
		src="${root}/resources/admin/mainFrame/js/plugins/chart.js"></script>
	<script type="text/javascript">
		var data = {
			labels : [ "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5",
					"Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10",
					"Tháng 11", "Tháng 12" ],
			datasets : [ {
				label : "Dữ liệu đầu tiên",
				fillColor : "rgba(255, 255, 255, 0.158)",
				strokeColor : "black",
				pointColor : "rgb(220, 64, 59)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "green",
				data : [ 20, 59, 90, 51, 56, 100, 40, 60, 78, 53, 33, 81 ]
			}, {
				label : "Dữ liệu kế tiếp",
				fillColor : "rgba(255, 255, 255, 0.158)",
				strokeColor : "rgb(220, 64, 59)",
				pointColor : "black",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "green",
				data : [ 48, 48, 49, 39, 86, 10, 50, 70, 60, 70, 75, 90 ]
			} ]
		};

		var ctxl = $("#lineChartDemo").get(0).getContext("2d");
		var lineChart = new Chart(ctxl).Line(data);

		var ctxb = $("#barChartDemo").get(0).getContext("2d");
		var barChart = new Chart(ctxb).Bar(data);
	</script>
	<!-- Google analytics script-->
	<script type="text/javascript">
		if (document.location.hostname == 'pratikborsadiya.in') {
			(function(i, s, o, g, r, a, m) {
				i['GoogleAnalyticsObject'] = r;
				i[r] = i[r] || function() {
					(i[r].q = i[r].q || []).push(arguments)
				}, i[r].l = 1 * new Date();
				a = s.createElement(o), m = s.getElementsByTagName(o)[0];
				a.async = 1;
				a.src = g;
				m.parentNode.insertBefore(a, m)
			})(window, document, 'script',
					'//www.google-analytics.com/analytics.js', 'ga');
			ga('create', 'UA-72504830-1', 'auto');
			ga('send', 'pageview');
		}
	</script>
	<!--  -->
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#datepicker').datepicker();
			$('#datepicker2').datepicker();
		});
	</script>
</body>

</html>