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
  <title>Tin tức</title>
  <link rel="shortcut icon" type="image/png" href="${root}/resources/user2/assets/img/favicon.png">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
  <link rel="stylesheet" href="${root}/resources/user2/assets/css/style.css">

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
  <script src="http://bfintal.github.io/Counter-Up/jquery.counterup.min.js"></script>
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
				<li class="nav-item active"><a class="nav-link"
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

  <div class="container-fluid p-3" style="margin-top: 102px;background-color: #f0f0f0;">
    <div class="container">
      <h5 class=""><a href="../home/index.htm">Trang chủ</a> / Tin tức</h5>
    </div>
  </div>

  <div class="container mb-5">
    <div class="row mt-2">
      <div class="col-md-9">
        <div class="row card-deck">
          <div class="card col-md-6">
            <a href="../home/tintuc1.htm"><img width="365px" src="${root}/resources/user2/assets/images/tintuc12.jpg" alt=""></a>
            <span class="my-3"><i class="far fa-clock"></i> 22:22 - 23-6-2021</span>
            <h3><a href="tintuc_1.htm" class="news__title">Hướng dẫn đo size, kích cỡ nhẫn</a></h3>
            <p>Vivian JELWELS sẽ hướng dẫn bạn cách đo kích thước nhẫn tại nhà & cách bí mật đo nhẫn để tạo bất ngờ cho món quà dành tặng người thân, nhất là đối với những thời khắc đặc biệt trong đời. Với những bí quyết trong bài, bạn có thể...</p>
            <button class="btn btn-info mb-3"><a href="../home/tintuc_1.htm" class="text-white d-block">Xem thêm</a></button>
          </div>

          <div class="card col-md-6">
            <a href="../home/tintuc2.htm"><img width="365px" src="${root}/resources/user2/assets/images/tintuc21.webp" alt=""></a>
            <span class="my-3"><i class="far fa-clock"></i> 22:22 - 23-6-2021</span>
            <h3><a href="" class="news__title">Tiêu chuẩn chọn lắc tay</a></h3>
            <p>Lắc tay là phụ kiện thời trang mà cô nàng có thể đeo thường
				xuyên, dễ dàng mix and match với nhiều item trang ....</p>
            <button class="btn btn-info mb-3"><a href="../home/tintuc_2.htm" class="text-white d-block">Xem thêm</a></button>
          </div>
        </div>

        <div class="row card-deck mt-4">
          <div class="card col-md-6">
            <a href="../home/tintuc3.htm"><img width="365px" src="${root}/resources/user2/assets/images/tintuc31.webp" alt=""></a>
            <span class="my-3"><i class="far fa-clock"></i> 22:22 - 23-6-2021</span>
            <h3><a href="" class="news__title">Top nhẫn cưới vàng trắng được ưa chuộng nhất tại Nha Trang mùa cưới 2022</a></h3>
            <p>Nhẫn cưới vàng trắng đang trở thành xu hướng trong những năm gần đây bởi vẻ đẹp sang trọng, tinh tế cùng nhiều ưu điểm nổi bật. Giúp cô dâu chú rể tại Nha Trang lựa chọn cặp nhẫn đẹp đi...</p>
            <button class="btn btn-info mb-3"><a href="../home/tintuc_3.html" class="text-white d-block">Xem thêm</a></button>
          </div>

          <div class="card col-md-6">
            <a href="../home/tintuc4.htm"><img width="365px" src="${root}/resources/user2/assets/images/tintuc41.webp" alt=""></a>
            <span class="my-3"><i class="far fa-clock"></i> 22:22 - 23-6-2021</span>
            <h3><a href="" class="news__title">Bí quyết bảo quản trang sức dành cho phái nữ</a></h3>
            <p>Trang sức chắc chắn là những vật dụng phối đồ không thể thiếu trong tủ đồ của mỗi cô nàng. Chính vì vậy, đừng quên dành chút thời gian chăm sóc và bảo quản cẩn thận để những món trang sức luôn sáng bóng và lộng lẫy hơn. Tham khảo ngay các tips sau...</p>
            <button class="btn btn-info mb-3"><a href="../home/tintuc_4.html" class="text-white d-block">Xem thêm</a></button>
          </div>
        </div>
        <div class=" mt-3">
          <ul class="pagination">
            <li class="page-item p-1 disabled"><a href="" class="page-link"><i class="fas fa-angle-double-left"></i></a></li>
            <li class="page-item active p-1"><a href="" class="page-link">1</a></li>
            <li class="page-item p-1"><a href="" class="page-link">2</a></li>
            <li class="page-item p-1"><a href="" class="page-link"><i class="fas fa-angle-double-right"></i></a></li>
          </ul>
        </div>
      </div>

      <div class="col-md-3">
        <h4><a href="" class="text-dark">Tin tức nổi bật</a></h4>

        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="../home/tintuc1.htm">
              <div class="row border-bottom py-3">
                <div class="col-md-5">
                  <img src="${root}/resources/user2/assets/images/img_tintuc1.jpg" width="100px" alt="">
                </div>
                <div class="col-md-7">
                  <h6 class="news__title">Mách cho bạn bí quyết trị nám tại nhà</h6>
                </div>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../home/tintuc2.htm">
              <div class="row border-bottom py-3">
                <div class="col-md-5">
                  <img src="${root}/resources/user2/assets/images/img_tintuc2.jpg" width="100px" alt="">
                </div>
                <div class="col-md-7">
                  <h6 class="news__title">Xu hướng lông mày năm 2021 không thể không biết</h6>
                </div>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../home/tintuc3.htm">
              <div class="row border-bottom py-3">
                <div class="col-md-5">
                  <img src="${root}/resources/user2/assets/images/img_tintuc3.jpg" width="100px" alt="">
                </div>
                <div class="col-md-7">
                  <h6 class="news__title">Top 3 cushion chống nắng HOT nhất 2021</h6>
                </div>
              </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../home/tintuc4.htm">
              <div class="row py-3">
                <div class="col-md-5">
                  <img src="${root}/resources/user2/assets/images/img_tintuc4.jpg" width="100px" alt="">
                </div>
                <div class="col-md-7">
                  <h6 class="news__title">Những công dụng đặc biệt trong làm đẹp da và tóc từ nước vo gạo</h6>
                </div>
              </div>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>

  <footer class="bg-dark py-4">
    <div class="container">
        <div class="row pt-3">
            <div class="col-md-5">
                <h4 class="text-white">Fanpage</h4>
                <a href=""><i class="icon-facebook rounded fab fa-facebook"></i></a>
                <a href=""><i class="icon-twitter rounded fab fa-twitter-square"></i></a>
                <a href=""><i class="icon-google-plus rounded fab fa-google-plus"></i></a>
                <a href=""><i class="icon-wechat rounded fab fa-weixin"></i></a>
            </div>

            <div class="col-md-7 rounded">
                <h4 class="text-white">Đăng ký nhận thông tin</h4>
                <p class="text-white">Hãy cho chúng tôi email của bạn và bạn sẽ được cập nhật hàng ngày với các sự kiện mới nhất, chi tiết!</p>
                <div class="bg-white d-flex">
                    <input class="w-100 border-0 pl-3" type="text" placeholder="Nhập email để đăng ký">
                    <button class="btn col-md-2" style="background-color: turquoise;">Đăng ký</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-4">
        <div class="row pt-3">
            <div class="col-md-3">
                <h4 class="text-white">Về chúng tôi</h4>
                <ul class="navbar-nav footer__menu">
                    <li class="nav-item"><a class="nav-link text-secondary" href="#"><i class="fas fa-map-marker-alt"></i> 97 Man Thiện, phường Hiệp Phú, quận 9, TPHCM</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="#"><i class="fas fa-phone"></i> 0353198388</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="#"><i class="fas fa-envelope"></i> n18dccn133@student.ptithcm.edu.vn</a></li>
                </ul>
            </div>

            <div class="col-md-3">
                <h4 class="text-white">Tin tức</h4>
                <ul class="navbar-nav footer__menu">
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Về chúng tôi</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Tuyển dụng</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Giới thiệu chung</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Giới thiệu cửa hàng</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Thời gian làm việc</a></li>
                </ul>
            </div>

            <div class="col-md-3">
                <h4 class="text-white">Câu hỏi thường gặp</h4>
                <ul class="navbar-nav footer__menu">
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Hỏi đáp</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Liên hệ</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Khuyến mãi</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Mẹo sử dụng mỹ phẩm</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Sản phẩm hot</a></li>
                </ul>
            </div>

            <div class="col-md-3">
                <h4 class="text-white">Chính sách</h4>
                <ul class="navbar-nav footer__menu">
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Chính sách bảo mật</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Chính sách bảo hành</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Chính sách vận chuyển</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Chính sách đổi hàng</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="">Quy định thanh toán</a></li>
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
  </script>
</body>
</html>