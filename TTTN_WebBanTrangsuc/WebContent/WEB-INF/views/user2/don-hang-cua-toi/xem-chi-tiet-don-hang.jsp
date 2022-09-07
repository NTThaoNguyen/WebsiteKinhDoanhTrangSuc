<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
<title>Danh sách đơn hàng | Quản trị Admin</title>
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
						data-toggle="dropdown">Xin chào ${sessionScope.myLogin.getKhachhang().getTen()}</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="../order/show.htm"> Lịch sử đặt hàng</a> 
							<a class="dropdown-item" href="../home/logout.htm"> Đăng xuất</a>
						</div>
					</li>
				</c:if>
			</ul>
		</nav>
	</header>
	<div class="container-fluid p-2"
		style="margin-top: 67px; background-color: #f0f0f0;">
		<div class="container">
			<h5 class="">
				<a href="../home/home.htm"><i class="fa fa-home"></i></a>
				<a href="../home/don-hang-cua-toi.htm"> >Lịch sử đặt hàng</a> > Xem chi tiết đơn
				hàng
			</h5>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<br></br>
		</div>
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
				<a href="../home/${gioHang.maGioHang}.htm?linkHuy" type="button" data-bs-toggle="modal"
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
    function deleteRow(r) {
      var i = r.parentNode.parentNode.rowIndex;
      document.getElementById("myTable").deleteRow(i);
    }
    jQuery(function () {
      jQuery(".trash").click(function () {
        swal({
          title: "Cảnh báo",
         
          text: "Bạn có chắc chắn là muốn xóa đơn hàng này?",
          buttons: ["Hủy bỏ", "Đồng ý"],
        })
          .then((willDelete) => {
            if (willDelete) {
              swal("Đã xóa thành công.!", {
                
              });
            }
          });
      });
    });
    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
      $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
      e.stopImmediatePropagation();
    });

    //EXCEL
    // $(document).ready(function () {
    //   $('#').DataTable({

    //     dom: 'Bfrtip',
    //     "buttons": [
    //       'excel'
    //     ]
    //   });
    // });


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
    //     //Sao chép dữ liệu
    //     var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

    // copyTextareaBtn.addEventListener('click', function(event) {
    //   var copyTextarea = document.querySelector('.js-copytextarea');
    //   copyTextarea.focus();
    //   copyTextarea.select();

    //   try {
    //     var successful = document.execCommand('copy');
    //     var msg = successful ? 'successful' : 'unsuccessful';
    //     console.log('Copying text command was ' + msg);
    //   } catch (err) {
    //     console.log('Oops, unable to copy');
    //   }
    // });


    //Modal
    $("#show-emp").on("click", function () {
      $("#ModalUP").modal({ backdrop: false, keyboard: false })
    });
  </script>
</body>

</html>