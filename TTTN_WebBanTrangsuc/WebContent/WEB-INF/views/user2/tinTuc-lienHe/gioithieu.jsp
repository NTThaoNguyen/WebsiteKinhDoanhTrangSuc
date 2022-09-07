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
  <title>Giới thiệu</title>
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
				<li class="nav-item active"><a class="nav-link"
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
				<li class="nav-item active"><a class="nav-link"
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
						style="margin-left: 550px">GIỎ HÀNG<span
						class="badge badge-light">${sessionScope.myOrder.size()}</span>
					</a>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbardrop"
						data-toggle="dropdown">Nguyên</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="../order/show.htm"> LỊCH SỬ
								ĐẶT HÀNG</a> <a class="dropdown-item" href="../home/logout.htm">ĐĂNG
								XUẤT</a>
						</div></li>
				</c:if>

			</ul>

		</nav>

	</header>

  <div class="container-fluid p-3" style="margin-top: 102px;background-color: #f0f0f0;">
    <div class="container">
      <h5 class=""><a href="../home/home.htm">Trang chủ</a> / Giới thiệu</h5>
    </div>
  </div>

  <div class="mt-5 container p-5">
    <h1 class="text-center p-5">Về chúng tôi</h1>
    <div class="p-5">
      <h5 class>TRONG 3 NĂM CỬA HÀNG CỦA CHÚNG TÔI ĐÃ TRỞ THÀNH MỘT TRONG NHỮNG CỬA HÀNG LỚN NHẤT CHO NỮ TRÊN TOÀN THẾ GIỚI.</h5>
      <p>
        Chúng tôi cung cấp cho khách hàng của chúng tôi với giá tốt nhất và hệ thống chiết khấu tuyệt vời. Khách hàng thường xuyên của chúng tôi nhận được ưu đãi đặc biệt, thẻ quà tặng và các ưu điểm tích lũy khác. Bộ sưu tập của cửa hàng chúng tôi được làm giàu với các mặt hàng và thương hiệu mới. Chúng tôi cộng tác với các thương hiệu nổi tiếng thế giới và duy trì các thương hiệu trẻ.
      </p>
      <p>
        Phạm vi của chúng tôi sản phẩm bao gồm hơn 5000 mặt hàng và hàng chục các thương hiệu nước hoa tốt nhất. Bạn có thể tìm thấy hương thơm tươi hoặc nước hoa vani ngọt ngào. Sứ mệnh của cửa hàng chúng tôi là cung cấp cho mọi phụ nữ một phong cách và hương thơm độc đáo. Phương châm của chúng tôi là viết tắt của mỗi người phụ nữ là đẹp và xứng đáng với những điều tuyệt vời để có. Sự thoải mái là rất quan trọng trong các sản phẩm của chúng tôi khi chúng tôi đánh giá cao khách hàng của mình và tạo ra bộ sưu tập của chúng tôi với tình yêu và sự chú ý đến từng chi tiết.
      </p>
      <div class="row mt-5 d-flex align-content-around text-center">
        <div class="col-md-3">
          <h1 class="counter-value">225</h1>
          <p>Thương hiệu</p>
        </div>

        <div class="col-md-3">
          <h1 class="counter-value">2314</h1>
          <p>Khách hàng</p>
        </div>

        <div class="col-md-3">
          <h1 class="counter-value">14</h1>
          <p>Cửa hàng</p>
        </div>

        <div class="col-md-3">
          <h1 class="counter-value">623</h1>
          <p>Quà thẻ đã được cấp</p>
        </div>
      </div>
  </div>
      
  </div>
  <div class="container">
    <hr>
    <div class="row text-center py-5">
      <div class="col-md-4">
        <h5>Miễn phí vận chuyển</h5>
        <p>Tin tốt! Bây giờ chúng tôi gửi miễn phí trong phạm vi Hoa Kỳ và Canada! Chúng tôi sử dụng các công ty vận chuyển UPS và USPS.</p>
      </div>

      <div class="col-md-4">
        <h5>Hỗ trợ 24/7</h5>
        <p>Chúng tôi có sẵn suốt ngày đêm! Nếu bạn có bất kỳ câu hỏi nào hoặc muốn đặt hàng, vui lòng liên hệ với chúng tôi!</p>
      </div>

      <div class="col-md-4">
        <h5>Quá trình thanh toán</h5>
        <p>Chúng tôi có nhiều phương thức thanh toán khác nhau: chúng tôi lấy thẻ tín dụng và thẻ ghi nợ, thanh toán qua Paypal, séc và chuyển khoản ngân hàng.</p>
      </div>
    </div>
    <hr>
  </div> 
  
  <div class="container p-5">
    <h2 class="text-center p-5">CHÚNG TÔI CÓ THỂ LÀM GÌ</h2>
    <div class="p-5">
      Chúng tôi tạo ra các mô hình mới, hợp tác với các thương hiệu và nhà cung cấp trang sức, làm một số mặt hàng được đặt làm và cung cấp cho khách hàng của chúng tôi một loạt các dịch vụ đi kèm. Thưởng thức lướt trang web của chúng tôi để biết thêm về chúng tôi!
    </div>

    <div class="px-5">
      <div class="">
        <span>Chất lượng</span>
        <div class="bg-secondary position-relative mt-2" style="height: 5px;width: 100%;">
          <div class="position-absolute" style="width: 100%;height: 5px;background-color: #28e0c8;">
            <span class="position-absolute" style="right: 0;top: -20px;">100%</span>
          </div>
        </div>
      </div>

      <div class="">
        <span>Dịch vụ</span>
        <div class="bg-secondary position-relative mt-2" style="height: 5px;width: 100%;">
          <div class="position-absolute" style="width: 90%;height: 5px;background-color: #28e0c8;">
            <span class="position-absolute" style="right: 0;top: -20px;">90%</span>
          </div>
        </div>
      </div>

      <div class="">
        <span>Hỗ trợ</span>
        <div class="bg-secondary position-relative mt-2" style="height: 5px;width: 100%;">
          <div class="position-absolute" style="width: 80%;height: 5px;background-color: #28e0c8;">
            <span class="position-absolute" style="right: 0;top: -20px;">80%</span>
          </div>
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

    $(document).ready(function( $ ) {
        $('.counter-value').counterUp({
            delay: 10,
            time: 1000
        });
    });
  </script>
</body>
</html>