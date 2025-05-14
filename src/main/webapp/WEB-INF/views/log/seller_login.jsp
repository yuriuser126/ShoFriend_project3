<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
	
	<!-- * 25/04/08 성유리  -->
	<!-- * seller_login : 판매자 로그인 -->
	<!-- * 25/04/14 우주연 로그아웃버튼삭제 -->


	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css ">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>


    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Login - ShopGrids Bootstrap 5 eCommerce HTML Template.</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="../assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="../assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="../assets/css/main.css" />

</head>

<body>
    <!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

	    <!-- Preloader -->
	    <div class="preloader">
	        <div class="preloader-inner">
	            <div class="preloader-icon">
	                <span></span>
	                <span></span>
	            </div>
	        </div>
	    </div>
	    <!-- /End Preloader -->

		<!--	헤더 시작 !-->
	    <!-- Start Header Area -->
	    <header class="header navbar-area">
	        <!-- Start Topbar -->
	        <div class="topbar">
	            <div class="container">
	                <div class="row align-items-center">
	                    <div class="col-lg-4 col-md-4 col-12">
	                        <div class="top-left">
	                            <ul class="menu-top-link">
	                                <li>
	                                    <div class="select-position">
	                                        <select id="select4">
	                                            <option value="0" selected>₩ WON</option>
	                                            <option value="1">€ EURO</option>
	                                            <option value="2">$ USD</option>
	                                            <option value="3">₹ INR</option>
	                                        </select>
	                                    </div>
	                                </li>
	                                <li>
	                                    <div class="select-position">
	                                        <select id="select5">
	                                            <option value="0" selected>Korean</option>
	                                            <option value="1">Español</option>
	                                            <option value="2">English</option>
	                                            <option value="3">Français</option>
	                                        </select>
	                                    </div>
	                                </li>
	                            </ul>
	                        </div>
	                    </div>
	                    <div class="col-lg-4 col-md-4 col-12">
	                        <div class="top-middle">
	                            <ul class="useful-links">
	                                <li><a href="../main">Home</a></li>
	                                <li><a href="../friend">Friend</a></li>
									<c:choose>
										<c:when test="${sessionScope.userType == 'seller'}">
		                                    <li><a href="../my_page">seller</a></li>
										</c:when>
										<c:when test="${sessionScope.userType == 'customer'}">
		                                    <li><a href="../my_page">customer</a></li>
										</c:when>
									</c:choose>
	                            </ul>
	                        </div>
	                    </div>
	                    <div class="col-lg-4 col-md-4 col-12">
	                        <div class="top-end">
	                            <div class="user">
									<c:choose>
										<c:when test="${sessionScope.userType == 'seller'}">
			                                <i class="lni lni-user"></i>
		                                	${sessionScope.loginSeller.name}
										</c:when>
										<c:when test="${sessionScope.userType == 'customer'}">
			                                <i class="lni lni-user"></i>
											${sessionScope.loginCustomer.name}
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
	                            </div>
	                            <ul class="user-login">
	                                <li>
	                                    <a href="../my_page">My Page</a>
	                                </li>
									<c:choose>
										<c:when test="${sessionScope.userType == 'seller'}">
		                                    <li><a href="../logout">Log out</a></li>
										</c:when>
										<c:when test="${sessionScope.userType == 'customer'}">
		                                    <li><a href="../logout">Log out</a></li>
										</c:when>
										<c:otherwise>
			                                <li>
			                                    <a href="login">Sign In</a>
			                                </li>
			                                <li>
			                                    <a href="customer_register">Register</a>
			                                </li>
										</c:otherwise>
									</c:choose>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- End Topbar -->
	        <!-- Start Header Middle -->
	        <div class="header-middle">
	            <div class="container">
	                <div class="row align-items-center">
	                    <div class="col-lg-3 col-md-3 col-7">
	                        <!-- Start Header Logo -->
	                        <a class="navbar-brand" href="main">
	<!--                            <img src="assets/images/logo/logo.svg" alt="Logo">-->
	                            <img src="../assets/images/logo/ShoFriend_logo.png" alt="Logo" >
	                        </a>
	                        <!-- End Header Logo -->
	                    </div>
	                    <div class="col-lg-5 col-md-7 d-xs-none">
	                        <!-- Start Main Menu Search -->
	                        <div class="main-menu-search">
	                            <!-- navbar search start -->
								<form method="get" action="/category">
		                            <div class="navbar-search search-style-5">
		                                <div class="search-select">
		                                    <div class="select-position">
		                                        <select id="selectCategory" name="categoryId">
		                                            <option value="" selected>All</option>
					                                <c:forEach var="cat" items="${categorylist}">
			                                        	<option value="${cat.id}" ${categoryId == cat.id ? 'selected' : ''}>${cat.name}</option>
					                                </c:forEach>
		                                        </select>
		                                    </div>
		                                </div>
		                                <div class="search-input">
			                                <input type="text" name="keyword" placeholder="Search" value="${param.keyword}" />
		                                </div>
		                                <div class="search-btn">
		                                    <button><i class="lni lni-search-alt"></i></button>
		                                </div>
		                            </div>
	                            </form>
	                            <!-- navbar search Ends -->
	                        </div>
	                        <!-- End Main Menu Search -->
	                    </div>
	                    <div class="col-lg-4 col-md-2 col-5">
	                        <div class="middle-right-area">
	                            <div class="nav-hotline">
									<a href="mailto:contact@example.com">
		                                <i class="lni lni-phone"></i>
		                                <h3>Hotline:
		                                    <span>KH@exam.com</span>
		                                </h3>
									</a>
	                            </div>
	                            <div class="navbar-cart">
	                                <div class="wishlist">
	                                    <a href="javascript:void(0)">
	                                        <i class="lni lni-heart"></i>
	                                    </a>
	                                </div>
	                                <div class="cart-items">
	                                    <a href="cart_view" class="main-btn">
	                                        <i class="lni lni-cart"></i>
											<c:if test="${sessionScope.userType == 'customer'}">
	                                        	<span class="total-items">${items.size()}</span>
	                                    	</a>
	                                    	<!-- Shopping Item -->
	                                    	<div class="shopping-item">
		                                        <div class="dropdown-cart-header">
		                                            <span>${items.size()} Items</span>
		                                            
		                                        </div>
		                                        <ul class="shopping-list">
													<c:forEach var="item" items="${items}">
														<li>
									                        <div class="cart-img-head">
									                            <a class="cart-img" href="content?id=${item.product_id}"><img
									                                    src="/display?fileName=${item.picture}" alt="${item.product_title}" onerror="this.onerror=null; this.src='assets/images/products/crack.png'"></a>
									                        </div>

									                        <div class="content">
									                            <h4><a href="content?id=${item.product_id}">${item.product_title}</a></h4>
									                            <p class="quantity">${item.quantity}x - <span class="amount"><fmt:formatNumber value="${item.final_price}" pattern="#,###원"/></span></p>
									                        </div>
									                    </li>
														</c:forEach>
													</ul>
			                                        <div class="bottom">
		                                           		<div class="total">
		                                                <span>Total</span>
														<c:forEach var="item" items="${items}">
									                            <c:set var="totalAmount" value="${totalAmount + (item.final_price * item.quantity)}"/>
									                        </c:forEach>
									                        <span class="total-amount"><fmt:formatNumber value="${totalAmount}" pattern="#,###원"/></span>
									                    </span>
		                                            </div>
													<div class="button">
													    <a href="../cart_view" class="btn animate" >View Cart</a>
													</div>
		                                        </div>
											</c:if>
	                                    </div>
	                                    <!--/ End Shopping Item -->
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- End Header Middle -->
			
	        <!-- Start Header Bottom -->
	        <div class="container">
	            <div class="row align-items-center">
	                <div class="col-lg-8 col-md-6 col-12">
	                    <div class="nav-inner">
	                        <!-- Start Mega Category Menu -->
	                        <div class="mega-category-menu">
								<span class="cat-button"><a href="../category"><i class="lni lni-menu"></i>All
										Categories</a></span>
								<ul class="sub-category">
	                                <c:forEach var="cat" items="${categorylist}">
	                                    <li>
	                                        <a href="../category?categoryId=${cat.id}&sort=${sort}">${cat.name}</a>
	                                    </li>
	                                </c:forEach>
								</ul>
	                        </div>
	                        <!-- End Mega Category Menu -->
	                        <!-- Start Navbar -->
	                        <nav class="navbar navbar-expand-lg">
	                            <button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
	                                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
	                                aria-expanded="false" aria-label="Toggle navigation">
	                                <span class="toggler-icon"></span>
	                                <span class="toggler-icon"></span>
	                                <span class="toggler-icon"></span>
	                            </button>
	                            <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
	                                <ul id="nav" class="navbar-nav ms-auto">
	                                    <li class="nav-item">
	                                        <a href="../main" class="active" aria-label="Toggle navigation">Home</a>
	                                    </li>
										<li class="nav-item">
										    <a href="../friend" aria-label="Toggle navigation">Friend</a>
										</li>
										<li class="nav-item">
										    <a href="#" aria-label="Toggle navigation">Review</a>
										</li>
	                                    <li class="nav-item">
	                                        <a class="dd-menu collapsed" href="../my_page" data-bs-toggle="collapse"
	                                            data-bs-target="#submenu-1-2" aria-controls="navbarSupportedContent"
	                                            aria-expanded="false" aria-label="Toggle navigation">My Page</a>
	                                        <ul class="sub-menu collapse" id="submenu-1-2">
	<!--                                            <li class="nav-item"><a href="faq.html">Faq</a></li>-->
	                                            <li class="nav-item"><a href="../my_page">My Page</a></li>
	                                            <li class="nav-item"><a href="check_pwd">Information</a></li>
												<c:if test="${sessionScope.userType == 'customer'}">
	                                            	<li class="nav-item"><a href="../order_view">Order List</a></li>
												</c:if>
	                                        </ul>
	                                    </li>
										<c:if test="${sessionScope.userType == 'seller'}">
		                                    <li class="nav-item">
		                                        <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse"
		                                            data-bs-target="#submenu-1-3" aria-controls="navbarSupportedContent"
		                                            aria-expanded="false" aria-label="Toggle navigation">Manage</a>
		                                        <ul class="sub-menu collapse" id="submenu-1-3">
		                                            <li class="nav-item"><a href="../store_list">My Store</a></li>
		                                            <li class="nav-item"><a href="../product_insert">Add Product</a></li>
		                                            <li class="nav-item"><a href="../store_register">Add Store</a></li>
		                                        </ul>
		                                    </li>
										</c:if>

	                                </ul>
	                            </div> <!-- navbar collapse -->
	                        </nav>
	                        <!-- End Navbar -->
	                    </div>
	                </div>
	                <div class="col-lg-4 col-md-6 col-12">
	                    <!-- Start Nav Social -->
	                    <div class="nav-social">
	                        <h5 class="title">Follow Us:</h5>
	                        <ul>
	                            <li>
	                                <a href="https://www.facebook.com/?locale=ko_KR"><i class="lni lni-facebook-filled"></i></a>
	                            </li>
	                            <li>
	                                <a href="https://x.com/i/flow/login"><i class="lni lni-twitter-original"></i></a>
	                            </li>
	                            <li>
	                                <a href="https://www.instagram.com/"><i class="lni lni-instagram"></i></a>
	                            </li>
	                            <li>
	                                <a href="https://www.skype.com/ko/"><i class="lni lni-skype"></i></a>
	                            </li>
	                        </ul>
	                    </div>
	                    <!-- End Nav Social -->
	                </div>
	            </div>
	        </div>
	        <!-- End Header Bottom -->
	    </header>
	    <!-- End Header Area -->

			<!-- Start Breadcrumbs -->
			  <div class="breadcrumbs">
			      <div class="container">
			          <div class="row align-items-center">
			              <div class="col-lg-6 col-md-6 col-12">
			                  <div class="breadcrumbs-content">
			                      <h1 class="login">Login</h1>
			                  </div>
			              </div>
			              <div class="col-lg-6 col-md-6 col-12">
			                  <ul class="breadcrumb-nav">
			                      <li><a href="../main"><i class="lni lni-home"></i> Home</a></li>
			                      <li>Login</li>
			                  </ul>
			              </div>
			          </div>
			      </div>
			  </div>
			  <!-- End Breadcrumbs -->      

    <!-- Start Account Login Area -->
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <form class="card login-form" method="post" action=../login_yns>
                        <div class="card-body">
                            <div class="title">
                                <h3>Login Now</h3><br>
                                <p>You can login using your social media account or email address.</p>
                            </div>
                            <div class="social-login">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-12"><a class="btn facebook-btn"
                                            href="javascript:void(0)"><i class="lni lni-facebook-filled"></i> Facebook
                                            login</a></div>
                                    <div class="col-lg-4 col-md-4 col-12"><a class="btn twitter-btn"
                                            href="javascript:void(0)"><i class="lni lni-twitter-original"></i> Twitter
                                            login</a></div>
                                    <div class="col-lg-4 col-md-4 col-12"><a class="btn google-btn"
                                            href="javascript:void(0)"><i class="lni lni-google"></i> Google login</a>
                                    </div>
                                </div>
                            </div>
                            <div class="alt-option">
                                <span>Or</span>
                            </div>
                            <div class="form-group input-group">
							<div class="col-sm-12">
                                <label for="reg-fn">Email</label>
                            </div>
                                <input class="form-control" type="text" name="email" id="reg-email" required>
                            </div>
                            <div class="form-group input-group">
							<div class="col-sm-12">
                                <label for="reg-fn">Password</label><br>
                            </div>
                                <input class="form-control" type="password" name="password" id="reg-pass" required>
                            </div>
                            <div class="d-flex flex-wrap justify-content-between bottom-content">
                                <a class="lost-pass" href="find_ids">아이디찾기</a>
                                <a class="lost-pass" href="find_pws">비밀번호찾기</a>
                            </div>
                            <div class="button">
                                <button class="btn" type="submit">Login</button>
                            </div>
                            <p class="outer-link">Don't have an account? <a href="seller_register">회원가입</a>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End Account Login Area -->

	  <!-- Start Footer Area -->
	    <footer class="footer">
	        <div class="footer-middle">
	            <div class="container">
	                <div class="bottom-inner">
	                    <div class="row">
	                        <div class="col-lg-3 col-md-6 col-12">
	                            <!-- Single Widget -->
	                            <div class="single-footer f-contact">
	                                <h3>customer service center</h3>
	                                <p class="phone">Phone: +82 (02) 252 5252</p>
	                                <p class="phone">Email: KH@exam.com</p>
	                                <ul>
	                                    <li><span>Monday-Friday: </span> 9.00 am - 8.00 pm</li>
	                                    <li><span>Saturday: </span> 10.00 am - 6.00 pm</li>
	                                </ul>
	                            </div>
	                            <!-- End Single Widget -->
	                        </div>
	                        <div class="col-lg-3 col-md-6 col-12">
	<!--                             Single Widget -->
	                            <div class="single-footer our-app">
	                                <h3>My Page</h3>
	                                <ul class="app-btn">
	                                    <li>
	                                        <a href="login">
	                                            <i class="lni lni-apple"></i>
	                                            <span class="small-title">login</span>
	                                            <span class="big-title">our store</span>
	                                        </a>
	                                    </li>
	                                </ul>
	                            </div>
	<!--                             End Single Widget -->
	                        </div>
	                        <div class="col-lg-3 col-md-6 col-12">
	                            <!-- Single Widget -->
	                            <div class="single-footer f-link">
	                                <h3>Information</h3>
	                                <ul>
	<!--                                    <li><a href="javascript:void(0)">About Us</a></li>-->
	                                    <li><a href="javascript:void(0)">Contact Us</a></li>
	                                    <li><a href="javascript:void(0)">Downloads</a></li>
	                                    <li><a href="javascript:void(0)">Sitemap</a></li>
	                                    <li><a href="javascript:void(0)">FAQs Page</a></li>
	                                </ul>
	                            </div>
	                            <!-- End Single Widget -->
	                        </div>
	                        <div class="col-lg-3 col-md-6 col-12">
	                            <!-- Single Widget -->
	                            <div class="single-footer f-link">
	                                <h3>Shop Departments</h3>
	                                <ul>
		                               <li><a href="/category?categoryId=1">식품</a></li>
		                               <li><a href="/category?categoryId=2">가구</a></li>
		                               <li><a href="/category?categoryId=3">도서</a></li>
		                               <li><a href="/category?categoryId=4">스포츠/레저</a></li>
		                               <li><a href="/category?categoryId=5">출산/유아용품</a></li>
		                               <li><a href="/category?categoryId=6">반려동물용품</a></li>
		                               <li><a href="/category?categoryId=7">뷰티</a></li>
	                                </ul>
	                            </div>
	                            <!-- End Single Widget -->
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- End Footer Middle -->
	        <!-- Start Footer Bottom -->
	        <div class="footer-bottom">
	            <div class="container">
	                <div class="inner-content">
	                    <div class="row align-items-center">
	                        <div class="col-lg-3 col-md-6 col-12 mb-2">
								
								<div class="footer-logos" style="display: flex; align-items: center; gap: 16px;">
									<span>We Accept:</span>
								  <img src="../assets/images/footer/카카오페이_CI_combination_with_BG.svg" alt="카카오페이" style="height: 24px; max-width: 80px; width: auto;">
								  <img src="../assets/images/footer/credit-cards-footer.png" alt="카드로고" style="height: 24px; max-width: 200px; width: auto;">
								</div>
								
	<!--                            <div class="payment-gateway">-->
	<!--                                <span>We Accept:</span>-->
	<!--                                <img src="assets/images/footer/credit-cards-footer.png" alt="#">-->
	<!--                                <img src="assets/images/footer/카카오페이_CI_combination_with_BG.svg" alt="#">-->
	<!--                            </div>-->
	                        </div>
	                        <div class="col-lg-5 col-md-6 col-12 mb-2 text-center">
	                            <div class="copyright">
	                                <p>Designed and Developed by<a href="../main" rel="nofollow"
	                                        target="_blank">Shofriend</a></p>
	                            </div>
	                        </div>
	                        <div class="col-lg-4 col-12 mb-2 text-end">
	                            <ul class="socila" style="display: flex; justify-content: end; align-items: center; gap: 8px; flex-wrap: wrap;">
	                                <li>
	                                    <span>Follow Us On:</span>
	                                </li>
	                                <li><a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a></li>
	                                <li><a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a></li>
	                                <li><a href="javascript:void(0)"><i class="lni lni-instagram"></i></a></li>
	                                <li><a href="javascript:void(0)"><i class="lni lni-google"></i></a></li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- End Footer Bottom -->
	    </footer>
	    <!--/ End Footer Area -->

	    <!-- ========================= scroll-top ========================= -->
	    <a href="#" class="scroll-top">
	        <i class="lni lni-chevron-up"></i>
	    </a>

	    <!-- ========================= JS here ========================= -->
	    <script src="../assets/js/bootstrap.min.js"></script>
	    <script src="../assets/js/tiny-slider.js"></script>
	    <script src="../assets/js/glightbox.min.js"></script>
	    <script src="../assets/js/main.js"></script>
	    <script type="../text/javascript">
	        //========= Hero Slider 
	        tns({
	            container: '.hero-slider',
	            slideBy: 'page',
	            autoplay: true,
	            autoplayButtonOutput: false,
	            mouseDrag: true,
	            gutter: 0,
	            items: 1,
	            nav: false,
	            controls: true,
	            controlsText: ['<i class="lni lni-chevron-left"></i>', '<i class="lni lni-chevron-right"></i>'],
	        });

	        //======== Brand Slider
	        tns({
	            container: '.brands-logo-carousel',
	            autoplay: true,
	            autoplayButtonOutput: false,
	            mouseDrag: true,
	            gutter: 15,
	            nav: false,
	            controls: false,
	            responsive: {
	                0: {
	                    items: 1,
	                },
	                540: {
	                    items: 3,
	                },
	                768: {
	                    items: 5,
	                },
	                992: {
	                    items: 6,
	                }
	            }
	        });
	    </script>
	</body>




