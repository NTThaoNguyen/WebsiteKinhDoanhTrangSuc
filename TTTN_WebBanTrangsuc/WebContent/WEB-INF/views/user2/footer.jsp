<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Footer Start -->
	<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
		<div class="row px-xl-5 pt-5">
			<div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
				<h5 class="text-secondary text-uppercase mb-4">Về chúng tôi</h5>
				<p class="mb-2">
					<i class="fa fa-map-marker-alt text-primary mr-3"></i>97 Man Thiện,
					phường Hiệp Phú, quận 9, TPHCM
				</p>
				<p class="mb-2">
					<i class="fa fa-envelope text-primary mr-3"></i>n18dccn133@student.ptithcm.edu.vn
				</p>
				<p class="mb-0">
					<i class="fa fa-phone-alt text-primary mr-3"></i>0353198388
				</p>
			</div>
			<div class="col-lg-8 col-md-12">
				<div class="row">
					<div class="col-md-4 mb-5">
						<h5 class="text-secondary text-uppercase mb-4">Tin tức</h5>
						<div class="d-flex flex-column justify-content-start">
							<a class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Về chúng tôi</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Tuyển dụng</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Giới thiệu chung</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Giới thiệu cửa hàng</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Thời gian làm việc</a>
						</div>
					</div>
					<div class="col-md-4 mb-5">
						<h5 class="text-secondary text-uppercase mb-4">Câu hỏi thường
							gặp</h5>
						<div class="d-flex flex-column justify-content-start">
							<a class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Hỏi đáp</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Liên hệ</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Khuyến mãi</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Mẹo bảo quản trang sức</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Sản phẩm mới</a>
						</div>
					</div>
					<div class="col-md-4 mb-5">
						<h5 class="text-secondary text-uppercase mb-4">Đăng ký nhận
							thông tin</h5>
						<p>Hãy cho chúng tôi email của bạn và bạn sẽ được cập nhật
							hàng ngày với các chi tiết sự kiện mới nhất!</p>
						<form action="">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Nhập email để đăng ký">
								<div class="input-group-append">
									<button class="btn btn-primary">Đăng ký</button>
								</div>
							</div>
						</form>
						<h6 class="text-secondary text-uppercase mt-4 mb-3">Follow Us</h6>
						<div class="d-flex">
							<a class="btn btn-primary btn-square mr-2" href="#"><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-primary btn-square mr-2" href="#"><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-primary btn-square mr-2" href="#"><i
								class="fab fa-linkedin-in"></i></a> <a
								class="btn btn-primary btn-square" href="#"><i
								class="fab fa-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row border-top mx-xl-5 py-4"
			style="border-color: rgba(256, 256, 256, .1) !important;">
			<div class="col-md-6 px-xl-0">
				
			</div>
			<div class="col-md-6 px-xl-0 text-center text-md-right">
				<img class="img-fluid"
					src="${root}/resources/user1/img/payments.png" alt="">
			</div>
		</div>
	</div>
	<!-- Footer End -->

	<script>
		function add_li_hover(x) {
			$(x).addClass("nav-item__after");
		}

		function remove_li_hover(x) {
			$(x).removeClass("nav-item__after");
		}

		function hide() {
			$(".mega-content").addClass("d-none");
		}

		function show() {
			$(".mega-content").removeClass("d-none");
		}

		var owl = $('.owl-carousel');
		owl.owlCarousel({
			items : 4,
			loop : true,
			margin : 10,

		});
	</script>
</body>
</html>