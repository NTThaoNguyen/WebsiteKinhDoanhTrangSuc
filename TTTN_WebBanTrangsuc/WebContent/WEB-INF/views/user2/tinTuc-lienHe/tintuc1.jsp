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
  <title>Bí quyết giữ gìn trang sức bạc không bị đen, bền màu</title>
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
				<li class="nav-item dropdown"><a href="../product/sanpham.htm"
					class="nav-link dropdown-toggle" id="navbardrop"
					data-toggle="dropdown">SẢN PHẨM</a>
					<div class="dropdown-menu">
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
      <h5 class=""><a href="../home/home.htm">Trang chủ</a> / Tin tức / Chọn Nhẫn</h5>
    </div>
  </div>

  
  <div class="container mb-5">
    <div class="row mt-2">
      <div class="col-md-9">
        <h3>HƯỚNG DẪN ĐO SIZE, KÍCH CỠ NHẪN</h3>
        <span class=""><i class="far fa-clock"></i> 17 Tháng Mười Một, 2021</span>

        <h6 class="mt-3"> Vivian JELWELS sẽ hướng dẫn bạn cách đo kích thước nhẫn tại nhà & cách bí mật đo nhẫn để tạo bất ngờ cho món quà dành tặng người thân, nhất là đối với những thời khắc đặc biệt trong đời. Với những bí quyết trong bài, bạn có thể dễ dàng mua sắm nhẫn vàng, nhẫn bạc, nhẫn cưới, nhẫn kim cương hay nhẫn đôi ngay trên online mà không còn gì phải lo ngại.</h6>

        <p>Sự kiện: <a href="" class="">Cách đo kích thước nhẫn</a>, <a href="" class="">Cẩm nang cưới</a> <a href="" class=""></a></p>

        <h3>1. Đo bằng tờ giấy & thước</h3>
        <p>Bước 1: Chuẩn bị một cây thước, 1 cây kéo, 1 cây bút & một tờ giấy. </p>
        <p>Bước 2: Cắt một mảnh giấy dài khoảng 10 cm và rộng 1 cm. </p>
        <p>Bước 3: Sử dụng đoạn giấy vừa cắt để quấn sát quanh ngón tay muốn đo. </p>
        <p>Bước 4: Đánh dấu điểm giao nhau.</p>
        <p>Bước 5: Tháo ra dùng thước đo chiều dài của đoạn giấy từ điểm đầu cho đến phần đánh dấu. Lấy kết quả đo được chia cho 3,14. Sau đó đối chiếu với Bảng size nhẫn.</p>
        <img src="${root}/resources/user2/assets/images/tintuc11.jpg" width="825px" alt="">

        <h3 class="mt-4">2. Đo theo một chiếc nhẫn có sẵn</h3>
        <p>Bước 1: Chuẩn bị một cây thước cùng chiếc nhẫn muốn đo <br><br>Bước 2: Chuẩn bị một cây thước cùng chiếc nhẫn muốn đo <br><br> Bước 3: Đối chiếu số mm của thước với kích trên BẢNG SIZE NHẪN bên trên. <br></p>
        <img src="${root}/resources/user2/assets/images/tintuc12.jpg" width="825px" alt="">

        <h3 class="mt-4">Những lưu ý khi đo</h3>
        <h4 class="mt-4">Kích cỡ ngón tay phụ thuộc nhiệt độ</h4>
        <p>Nhiệt độ là nguyên nhân gây ra việc đo kích thước nhẫn không chính xác. Khi thời tiết lạnh ngón tay của bạn có thể nhỏ hơn bình thường, bạn nên cộng thêm cho chu vi là 1 mm còn khi thời tiết nóng thì ngược lại, trừ đi 1 mm. Trường hợp xương khớp ngón tay của bạn to, thì bạn nên đo chu vi ở gần khớp (không phải trên khớp) Sao cho khi đeo nhẫn dễ vào nhưng không bị tuột mất.</p>
		<h4 class="mt-4">Chú ý độ dày của nhẫn</h4>
       	<p>Độ dày của nhẫn cũng ảnh hưởng đến size ni của mỗi người. Đối với các loại nhẫn như nhẫn vàng, nhẫn bạc đặc biệt là nhẫn cưới của Vivian JEWELS, độ dày sẽ khác nhau. Do đó, khi tiến hành đo, bạn cần phải chú ý và cho kích thước thêm hoặc bớt đi một khoản để khi đeo nhẫn có thể thoải mái mà không bị gò bó.</p>
        <img src="${root}/resources/user2/assets/images/tintuc13.jpg" width="825px" alt="">
        <h4 class="mt-4">Để ý những khớp tay</h4>
        <p>Các khớp tay có thể to hơn so với ở phía gốc của ngón. Do đó bạn cần phải đo kích thước ở khớp ngón và gốc ngón, sau đó lấy kích thước giữa 2 phần để chọn size nhẫn phù hợp. Lúc này tay đeo nhẫn của bạn sẽ có cảm giác thoải mái và không bị khó chịu khi co hoặc gập ngón tay.<br>Trong trường hợp khớp xương ngón tay của bạn to, bạn nên đo chu vi ở gần khớp (không phải trên khớp) sao cho khi bạn đeo nhẫn thì nhẫn dễ vào và không bị tuột mất.</p>
        <img src="${root}/resources/user2/assets/images/tintuc14.jpg" width="400x" alt="">
        <h4 class="mt-4">Đo lại nhiều lần để có số liệu chính xác nhất</h4>
        <p>Khi đo size tay chắc chắn sẽ có những sai sót, vì vậy hãy cẩn thận đo từ 3-4 lần để tìm ra số đo chính xác nhất. Làm theo cách này, kích cỡ bạn đo được sẽ có độ chính xác cao từ 85-95%.</p>
        <h4 class="mt-4">Size nhẫn nam và nữ có khác nhau không?</h4>
        <p>Với nam và nữ thì kích thước tay sẽ khác nhau nhưng đối với kích thước ngón tay thì tương đối giống nhau. Do đó, bạn có thể thực hiện việc đo size nhẫn tương tự như của nữ. Đối với nhẫn cưới, nhẫn kiểu hoặc nhẫn bạc vẫn có thể áp dụng theo cách này.</p>
        <h3 class="mt-4">Những mẹo đo size nhẫn bí mật</h3>
        <h4 class="mt-4">Mượn nhẫn của người mình muốn tặng</h4>
        <p>Các chàng trai có thể bí mật đo kích cỡ bằng cách giả vờ mượn những chiếc nhẫn của người ấy (nhẫn thường, nhẫn kiểu hay nhẫn đôi đều được), sau đó dùng thước kẻ đo đường kính chu vi phía trong của chiếc nhẫn như hướng dẫn phía trên.</p>
        <h4 class="mt-4">Nhờ người thân</h4>
        <p>Cách đơn giản nhất để biết được size nhẫn của người yêu mà không để nàng phát hiện hay nghi ngờ là nhờ sự trợ giúp từ người thân, có thể là mẹ, chị em gái hoặc là bạn bè. Họ có thể giúp bạn lấy thông tin này một cách tự nhiên và dễ dàng thông qua việc hỏi và nhờ thử giúp những chiếc nhẫn vàng hay nhẫn bạc.</p>
        <h4 class="mt-4">Quan sát và ước lượng</h4>
        <p>Với những ai không biết đo hoặc lý do nào đó chưa đo được thì có thể áng chừng size tay đeo nhẫn qua chiều cao cân nặng theo bảng bên dưới:</p>
        <img src="${root}/resources/user2/assets/images/tintuc15.jpg" width="825px" alt="">
        <h4 class="mt-4">Giả vờ nhờ người ấy thử nhẫn để giúp bạn mua tặng người khác</h4>
        <p>Đối với cách này, bạn cần phải khéo léo nhờ người ấy giúp bạn thử nhẫn, có thể là nhẫn kiểu đẹp hoặc nhẫn vàng mua tặng cho mẹ hoặc chị gái. Đồng thời, bạn cũng cần phải quan sát và chú ý đến kích cỡ ngón tay của người ấy để bạn có thể dễ dàng mua được nhẫn đôi hoặc nhẫn cưới thích hợp.</p>
        <h4 class="mt-4">Bí mật đo một cách tự nhiên</h4>
        <p>Nếu những cách trên vẫn chưa hiệu quả, bạn có thể thử:
			<br><br>Đo tay khi người ấy đang ngủ: Ngoài ra, bạn có thể tiến hành cách này, khi cô ấy ngủ, bạn sử dụng dụng cụ dây hoặc sợi chỉ để đo ngón tay. Nếu cô ấy thức giấc, bạn cần phải bình tĩnh và nói rằng bạn đang vuốt ve tay của cô ấy để tránh sự nghi ngờ.
			<br><br>So sánh ngón tay của mình với người ấy: Đối với cách này, bạn cần phải có sự quan sát kỹ và cẩn thận đến khớp và phía dưới gốc ngón tay có kích cỡ như thế nào so với ngón tay tương tự của mình để tìm ra size nhẫn chính xác nhất.</p>
       

        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v11.0" nonce="t5fJqVUk"></script>
        <div class="fb-comments" data-href="https://www.facebook.com/dekhamypham/" data-width="825" data-numposts="1"></div>
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
            <a class="nav-link" href="../tintuc4.htm">
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
                    <li class="nav-item"><a class="nav-link text-secondary" href="#"><i class="fas fa-map-marker-alt"></i> Liêu Xá, Yên Mỹ, Hưng Yên</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="#"><i class="fas fa-phone"></i> 0368960711</a></li>
                    <li class="nav-item"><a class="nav-link text-secondary" href="#"><i class="fas fa-envelope"></i> tranvudai0210@gmail.com</a></li>
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