<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="root" value="${pageContext.servletContext.contextPath}" />
<head>
    <meta charset="utf-8">
    <title>MultiShop - Checkout</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="${root}/resources/user1/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${root}/resources/user1/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${root}/resources/user1/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${root}/resources/user1/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Topbar Start -->
	<div class="container-fluid">
		
		<div
			class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
			<div class="col-lg-4">
				<a href="" class="text-decoration-none"> <span
					class="h1 text-uppercase text-primary bg-dark px-2">Vivian</span> <span
					class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Jewels</span>
				</a>
			</div>
			<div class="col-lg-4 col-6 text-left">
				<form action="">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for products">
						<div class="input-group-append">
							<span class="input-group-text bg-transparent text-primary">
								<i class="fa fa-search"></i>
							</span>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-4 col-6 text-right">
				<p class="m-0">Customer Service</p>
				<h5 class="m-0">+0353198388</h5>
			</div>
		</div>
	</div>
	<!-- Topbar End -->


	<!-- Navbar Start -->
	<div class="container-fluid bg-dark mb-30">
		<div class="row px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a
					class="btn d-flex align-items-center justify-content-between bg-primary w-100"
					data-toggle="collapse" href="#navbar-vertical"
					style="height: 65px; padding: 0 30px;">
					<h6 class="text-dark m-0">
						<i class="fa fa-bars mr-2"></i>T???t c??? s???n ph???m
					</h6> <i class="fa fa-angle-down text-dark"></i>
				</a>
				<nav
					class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
					id="navbar-vertical"
					style="width: calc(100% - 30px); z-index: 999;">
					<div class="navbar-nav w-100">
						<!-- <a href="../product/sanpham.htm" class="nav-item nav-link">T???t
							c??? s???n ph???m</a> -->
						<c:forEach var="type" items="${TypeTS}">
							<a class="dropdown-item nav-link"
								href="TypeTS/${type.getMaLoai()}.htm">${type.getTenLoai()}</a>
						</c:forEach>
					</div>
				</nav>
			</div>
			<div class="col-lg-9">
				<nav
					class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
					<a href="" class="text-decoration-none d-block d-lg-none"> <span
						class="h1 text-uppercase text-dark bg-light px-2">Multi</span> <span
						class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
					</a>
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<div class="navbar-nav mr-auto py-0">
							<a href="../home/home.htm" class="nav-item nav-link">TRANG
								CH???</a> <a href="../home/gioithieu.htm"
								class="nav-item nav-link active">GI???I THI???U</a> <a
								href="../product/sanpham.htm" class="nav-item nav-link">S???N
								PH???M</a> <a href="../home/tintuc.htm" class="nav-item nav-link">TIN
								T???C</a> <a href="../home/lienhe.htm" class="nav-item nav-link">LI??N
								H???</a>
							
						</div>
						<c:if test="${sessionScope.myLogin== null }">

							<li class="nav-item"><a class="nav-link"
								href="../home/login.htm"
								style="text-align: right; margin-left: 590px">????NG NH???P</a></li>
							<li class="nav-item"><a class="nav-link"
								href="../home/register.htm">????NG K??</a></li>
						</c:if>
						<c:if test="${sessionScope.myLogin!=null }">
							<div class="navbar-nav ml-auto py-0 d-none d-lg-block">
								<a href="" class="btn px-0 ml-3"> <i
									class="fas fa-shopping-cart text-primary"></i> <span
									class="badge text-secondary border border-secondary rounded-circle"
									style="padding-bottom: 2px;">0</span>
								</a>
							</div>
							<!-- <a href="../cart/index.htm" class="btn btn-secondary"
								style="margin-left: 550px">Gi??? h??ng<span
								class="badge badge-light"></span>
							</a> -->
							<div class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle"
									data-toggle="dropdown">Xin ch??o ${sessionScope.myLogin.getKhachhang().getTen()}<i
									class="fa fa-angle-down mt-1"></i></a>
								<div class="dropdown-menu bg-primary rounded-0 border-0 m-0">
									<a href="#" class="dropdown-item">Ch???nh s???a th??ng tin c?? nh??n</a> 
									<a href="../order/show.htm" class="dropdown-item">L???ch s??? ?????t h??ng</a> 
									<a href="../home/logout.htm" class="dropdown-item">????ng xu???t</a>
								</div>
							</div>
							
						</c:if>
						
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- Navbar End -->


    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="#">Home</a>
                    <a class="breadcrumb-item text-dark" href="#">Shop</a>
                    <span class="breadcrumb-item active">Checkout</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Checkout Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Billing Address</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>First Name</label>
                            <input class="form-control" type="text" placeholder="John">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Last Name</label>
                            <input class="form-control" type="text" placeholder="Doe">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <input class="form-control" type="text" placeholder="example@email.com">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mobile No</label>
                            <input class="form-control" type="text" placeholder="+123 456 789">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address Line 1</label>
                            <input class="form-control" type="text" placeholder="123 Street">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address Line 2</label>
                            <input class="form-control" type="text" placeholder="123 Street">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Country</label>
                            <select class="custom-select">
                                <option selected>United States</option>
                                <option>Afghanistan</option>
                                <option>Albania</option>
                                <option>Algeria</option>
                            </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>City</label>
                            <input class="form-control" type="text" placeholder="New York">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>State</label>
                            <input class="form-control" type="text" placeholder="New York">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>ZIP Code</label>
                            <input class="form-control" type="text" placeholder="123">
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="newaccount">
                                <label class="custom-control-label" for="newaccount">Create an account</label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="shipto">
                                <label class="custom-control-label" for="shipto"  data-toggle="collapse" data-target="#shipping-address">Ship to different address</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="collapse mb-5" id="shipping-address">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Shipping Address</span></h5>
                    <div class="bg-light p-30">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>First Name</label>
                                <input class="form-control" type="text" placeholder="John">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Last Name</label>
                                <input class="form-control" type="text" placeholder="Doe">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>E-mail</label>
                                <input class="form-control" type="text" placeholder="example@email.com">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Mobile No</label>
                                <input class="form-control" type="text" placeholder="+123 456 789">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Address Line 1</label>
                                <input class="form-control" type="text" placeholder="123 Street">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Address Line 2</label>
                                <input class="form-control" type="text" placeholder="123 Street">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Country</label>
                                <select class="custom-select">
                                    <option selected>United States</option>
                                    <option>Afghanistan</option>
                                    <option>Albania</option>
                                    <option>Algeria</option>
                                </select>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>City</label>
                                <input class="form-control" type="text" placeholder="New York">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>State</label>
                                <input class="form-control" type="text" placeholder="New York">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>ZIP Code</label>
                                <input class="form-control" type="text" placeholder="123">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Order Total</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom">
                        <h6 class="mb-3">Products</h6>
                        <div class="d-flex justify-content-between">
                            <p>Product Name 1</p>
                            <p>$150</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>Product Name 2</p>
                            <p>$150</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>Product Name 3</p>
                            <p>$150</p>
                        </div>
                    </div>
                    <div class="border-bottom pt-3 pb-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h6>Subtotal</h6>
                            <h6>$150</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">$10</h6>
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Total</h5>
                            <h5>$160</h5>
                        </div>
                    </div>
                </div>
                <div class="mb-5">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Payment</span></h5>
                    <div class="bg-light p-30">
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="paypal">
                                <label class="custom-control-label" for="paypal">Paypal</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="directcheck">
                                <label class="custom-control-label" for="directcheck">Direct Check</label>
                            </div>
                        </div>
                        <div class="form-group mb-4">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="banktransfer">
                                <label class="custom-control-label" for="banktransfer">Bank Transfer</label>
                            </div>
                        </div>
                        <button class="btn btn-block btn-primary font-weight-bold py-3">Place Order</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Checkout End -->


    <!-- Footer Start -->
	<div class="container-fluid bg-dark text-secondary mt-5 pt-5">
		<div class="row px-xl-5 pt-5">
			<div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
				<h5 class="text-secondary text-uppercase mb-4">V??? ch??ng t??i</h5>
				<p class="mb-2">
					<i class="fa fa-map-marker-alt text-primary mr-3"></i>97 Man Thi???n,
					ph?????ng Hi???p Ph??, qu???n 9, TPHCM
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
						<h5 class="text-secondary text-uppercase mb-4">Tin t???c</h5>
						<div class="d-flex flex-column justify-content-start">
							<a class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>V??? ch??ng t??i</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Tuy???n d???ng</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Gi???i thi???u chung</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Gi???i thi???u c???a h??ng</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Th???i gian l??m vi???c</a>
						</div>
					</div>
					<div class="col-md-4 mb-5">
						<h5 class="text-secondary text-uppercase mb-4">C??u h???i th?????ng
							g???p</h5>
						<div class="d-flex flex-column justify-content-start">
							<a class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>H???i ????p</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Li??n h???</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>Khuy???n m??i</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>M???o b???o qu???n trang s???c</a> <a
								class="text-secondary mb-2" href="#"><i
								class="fa fa-angle-right mr-2"></i>S???n ph???m m???i</a>
						</div>
					</div>
					<div class="col-md-4 mb-5">
						<h5 class="text-secondary text-uppercase mb-4">????ng k?? nh???n
							th??ng tin</h5>
						<p>H??y cho ch??ng t??i email c???a b???n v?? b???n s??? ???????c c???p nh???t
							h??ng ng??y v???i c??c chi ti???t s??? ki???n m???i nh???t!</p>
						<form action="">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="Nh???p email ????? ????ng k??">
								<div class="input-group-append">
									<button class="btn btn-primary">????ng k??</button>
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

    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="${root}/resources/user1/lib/easing/easing.min.js"></script>
    <script src="${root}/resources/user1/lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="${root}/resources/user1/mail/jqBootstrapValidation.min.js"></script>
    <script src="${root}/resources/user1/mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="${root}/resources/user1/js/main.js"></script>
</body>

</html>