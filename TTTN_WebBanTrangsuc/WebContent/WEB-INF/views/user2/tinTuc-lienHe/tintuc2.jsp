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
  <title>Tiêu chuẩn chọn lắc cho nàng nên biết</title>
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
      <h5 class=""><a href="../home/home.htm">Trang chủ</a> / Tin tức / Chọn lắc</h5>
    </div>
  </div>

  
  <div class="container mb-5">
    <div class="row mt-2">
      <div class="col-md-9">
        <h3>TIÊU CHUẨN CHỌN LẮC TAY NÀNG NÊN BIẾT</h3>
        <span class=""><i class="far fa-clock"></i> 13/05/22 11:09:28</span>

        <h6 class="mt-3"> Lắc tay là phụ kiện thời trang mà cô nàng có thể đeo thường xuyên, dễ dàng mix and match với nhiều item trang phục khác nhau. Một chiếc lắc tay nhỏ nhắn còn giúp bạn tôn lên vẻ đẹp tinh tế của kiểu dáng cổ tay. Vì thế, còn chần chờ gì mà không sở hữu ngay item trang sức vừa túi tiền và có thể thỏa sức mix match này. Bạn cũng đừng quên tham khảo những tiêu chí sau để lựa chọn một món trang sức phù hợp nhất với mình.</h6>
		<img src="${root}/resources/user2/assets/images/tintuc20.webp" width="825px" alt="">
        <p>Sự kiện: <a href="" class="">Cách chọn lắc cho nàng</a>, <a href="" class="">Chọn quà</a> <a href="" class=""></a></p>

        <h3>LỰA CHỌN THEO TÔNG MÀU DA</h3>
        <p>Đầu tiên, nàng cần xác định mình thuộc tông màu da nào. Rất đơn giản, bạn chỉ cần đặt cổ tay dưới ánh sáng mặt trời tự nhiên và xác định màu sắc của các đường gân mạch máu dưới da. </p>
        <img src="${root}/resources/user2/assets/images/tintuc22.webp" width="825px" alt="">
        <p>Đối với tone da lạnh (đường gân màu tím hoặc xanh dương): lắc tay màu platinum hoặc vàng trắng chắc chắn sẽ làm nổi bật làn da của nàng, đặc biệt là khi đi kèm những set phụ kiện trang sức khác như bông tai, dây chuyền hay nhẫn có màu sắc "tông xuyệt tông" với lắc tay.</p>
		<p>Đối với tone da trung tính (đường gân có màu lai giữa xanh lục và xanh dương): đây chắc chắn là màu da được ưu ái nhất trong 3 loại tone da bởi lắc tay vàng vàng, vàng hồng và vàng trắng đều tạo điểm nhấn tuyệt vời trên làn da của bạn.</p>
		<p>Đối với tone da ấm (đường gân có màu xanh lá hoặc màu olive): lắc tay có gam màu nóng như vàng vàng và vàng hồng không hề "chỉm nghỉm" trên làn da của bạn mà còn kết hợp hoàn hảo với tông da, giúp nàng tự tin diện đồ trong bất cứ hoàn cảnh nào, dù là đi làm công sở, đi chơi cùng hội bạn thân hay tham dự tiệc.</p>
        <img src="${root}/resources/user2/assets/images/tintuc24.webp" width="825px" alt="">
        <img src="${root}/resources/user2/assets/images/tintuc23.webp" width="825px" alt="">
        <p>Lắc tay LLF175 dành cho cô nàng tone da lạnh hoặc trung tính </p>
        <img src="${root}/resources/user2/assets/images/tintuc21.webp" width="825px" alt="">
        <p>Lắc tay LLF169 dành cho cô nàng tone da ấm hoặc trung tính</p>
        <img src="${root}/resources/user2/assets/images/tintuc25.webp" width="825px" alt="">
        <p>Lắc tay LLF168 dành cho cô nàng tone da ấm hoặc trung tính</p>

        <h3 class="mt-4">LẮC MẢNH VÀ LẮC CỨNG, DÁNG TAY BẠN NÊN ĐEO LOẠI NÀO?</h3>
        <p>Lắc tay không chỉ là món trang sức tôn lên vẻ đẹp tinh tế và mảnh mai của cổ tay mà còn giúp nàng "tốt khoe xấu che", tạo sự cân đối giữa độ dài cánh tay và bàn tay.</p>

        <h3 class="mt-4">Lắc mảnh LLF</h3>
        <p>Lắc LLF của Huy Thanh được chế tác với kiểu dáng dây mảnh kết hợp với họa tiết kích cỡ nhỏ nhưng vẫn thể hiện sự tinh tế đến từng đường nét. Thiết kế lắc mảnh LLF mang hơi thở của phong cách tối giản minimalism, trẻ trung hiện đại, phù hợp nàng mix and match với trang phục diện hè 2022. Nếu nàng có bàn tay thon dài, một chiếc lắc mảnh vàng trắng, vàng vàng hoặc vàng hồng có hoạ tiết thả rơi không chỉ làm nổi bật tone da mà còn tạo nét nữ tính và thanh lịch cho quý cô. Đặc biệt lắc tay LLF thiết kế với chốt bi rút có thể điều chỉnh độ dài dây, vậy nên dù sở hữu dáng tay mảnh dẻ hay dày dặn, chiếc lắc cũng vừa khít với cổ tay cổ tay của nàng.</p>
		<h4 class="mt-4">Chú ý độ dày của nhẫn</h4>
       	<p>Độ dày của nhẫn cũng ảnh hưởng đến size ni của mỗi người. Đối với các loại nhẫn như nhẫn vàng, nhẫn bạc đặc biệt là nhẫn cưới của Vivian JEWELS, độ dày sẽ khác nhau. Do đó, khi tiến hành đo, bạn cần phải chú ý và cho kích thước thêm hoặc bớt đi một khoản để khi đeo nhẫn có thể thoải mái mà không bị gò bó.</p>
        <img src="${root}/resources/user2/assets/images/tintuc13.jpg" width="825px" alt="">
        <h4 class="mt-4">Để ý những khớp tay</h4>
        <p>Các khớp tay có thể to hơn so với ở phía gốc của ngón. Do đó bạn cần phải đo kích thước ở khớp ngón và gốc ngón, sau đó lấy kích thước giữa 2 phần để chọn size nhẫn phù hợp. Lúc này tay đeo nhẫn của bạn sẽ có cảm giác thoải mái và không bị khó chịu khi co hoặc gập ngón tay.<br>Trong trường hợp khớp xương ngón tay của bạn to, bạn nên đo chu vi ở gần khớp (không phải trên khớp) sao cho khi bạn đeo nhẫn thì nhẫn dễ vào và không bị tuột mất.</p>
        <p>Ngoài ra, Huy Thanh Jewelry cũng sở hữu những chiếc lắc tay có thiết kế dây kép làm tăng thêm sự dày dặn cho cánh tay, tạo nên sự tương phản nhẹ nhàng, giúp cánh tay và bàn tay mảnh mai của phái đẹp trở nên đầy đặn và quyến rũ hơn. </p>
        <img src="${root}/resources/user2/assets/images/tintuc26.webp" width="400x" alt="">
        <p>Xem thêm: <a href="" class="">LẮC TAY HOT TREND MÙA HÈ</a> <a href="" class=""></a></p>
        <h3 class="mt-4">Lắc cứng LCC</h3>
		<p>Lắc cứng LCC của Huy Thanh Jewelry được thiết kế với bản dây to, rộng, có móc nối hoặc vòng tay có thiết kế lượn sóng hay họa tiết cầu kì, giúp cho phần cổ tay đến cánh tay của cô gái trở nên thanh mảnh, mềm mại và gợi cảm hơn. Lắc cứng LCC là phụ kiện thời trang sức "cân" được mọi kiểu dáng tay, bất kể kiểu dáng mảnh khảnh hay đầy đặn. </p>
        <p>Lắc tay LCC dày rộng và ôm khít với cổ tay dễ dàng khiến cho cánh tay thon gầy của cô gái trở nên đầy đặn hơn. Còn đối với những người có dáng cánh tay và bàn tay dày rộng, lắc tay bản rộng, họa tiết cỡ lớn và hoặc lựa chọn lắc kép sẽ tạo điểm nhấn hoàn hảo cho bạn khi phối đồ.</p>
        <img src="${root}/resources/user2/assets/images/tintuc27.webp" width="400x" alt="">
        <img src="${root}/resources/user2/assets/images/tintuc28.webp" width="400x" alt="">
        <h3>LỰA CHỌN THEO DÁNG CỔ TAY</h3>
        <p>Với những người có dáng cổ tay nhỏ nhắn, lắc tay bản rộng, ôm sát cổ tay hoặc lắc mảnh có họa tiết thả rơi nhẹ nhàng giúp cho cổ tay mảnh khảnh của cô nàng nhìn đầy đặn và tạo cảm giác cân bằng kích cỡ với cánh tay. Bên cạnh đó, nếu nàng là cô gái yêu sự dịu dàng, hơi "bánh bèo" thì lắc tay có đính đá màu lấp lánh sẽ dễ dàng tạo điểm nhấn trẻ trung, nhẹ nhàng khi diện váy suông, bồng hoặc kiểu váy công chúa.</p>
        <p>Nếu nàng là cô gái có cổ tay to hơn một chút thì cũng đừng lo lắng, lắc tay vẫn sẽ là phụ kiện trang sức khiến bạn dễ mix match với mọi loại trang phục. Tuy nhiên, thấy vì một chiếc lắc kích cỡ lớn, thiết kế cầu kỳ thì lắc tay kích cỡ rộng cùng với thiết kế trơn hoặc đi kèm họa tiết nhỏ và ít đính đá sẽ "đánh lừa thị giác" khiến cho cổ tay của nàng nhỏ nhắn và tinh tế hơn.</p>
        <p>Để chọn được một chiếc lắc tay ưng ý, kiểu dáng cổ tay là một trong những yếu tố rất quan trọng bởi độ dài rộng của lắc tay thường được thiết kế cố định, khó điều chỉnh trong trường hợp không vừa cổ tay, trong khi đó việc đo size thường không chính xác hoàn toàn. Vì thế nếu bạn vẫn đang băn khoăn chọn sao cho vừa tay thì mẫu lắc tay chốt bi rút sẽ giúp bạn "gỡ rối" chỉ trong 3s. Chốt bi rút trên lắc tay có thể điều chỉnh độ dài của dây từ 11-18cm, vì vậy dù là tay trẻ con, phụ nữ hay thậm chí đàn ông cũng có cảm giác vừa vặn khi đeo lên cổ tay. Trong quá trình điều chỉnh, chốt bi rút sẽ tự động cố định chiều dài dây, vừa vặn với dáng tay và sở thích của mọi cô gái. Đặc biệt, lắc tay chốt bi rút là trang sức chế tác độc quyền của Huy Thanh Jewelry tại Việt Nam. </p>
        <p>Thế nên, nếu có chàng trai nào vẫn chưa biết tặng gì cho bạn gái thì lắc tay của Huy Thanh Jewelry chắc chắn sẽ khiến nàng xiêu lòng bởi sự thấu hiểu và sẵn sàng chiều theo sở thích giống như tri kỷ của nàng. Vì vậy, bạn hãy tham khảo ngay mẫu lắc tay hot trend trong mùa hè 2022 để sở hữu một phụ kiện trang sức có 1-0-2 ngay hôm nay.</p>
         <p>Xem thêm: <a href="" class="">ĐỊA CHỈ BÁN LẮC TAY ĐẸP VÀ ĐỘC ĐÁO TRÊN THỊ TRƯỜNG</a><a href="" class=""></a></p>
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