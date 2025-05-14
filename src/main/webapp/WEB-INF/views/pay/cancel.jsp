<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>ShopGrids - Bootstrap 5 eCommerce HTML Template.</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css ">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
	
	
	<style>
	/* 결제 취소 알림 스타일 */
	.payment-cancel-notification {
	  padding: 50px 0;
	  background-color: #f7f7f7; /* 배경 색상 */
	}

	.notification-card {
	  position: relative;
	  background-color: #fff;
	  border-radius: 12px;
	  padding: 30px;
	  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 미세한 그림자 */
	  text-align: center;
	  max-width: 600px;
	  margin: 0 auto; /* 가운데 정렬 */
	}

	.notification-body {
	  color: #333;
	}

	.notification-title h3 {
	  font-size: 24px;
	  color: #1e88e5; /* 카카오톡 블루 */
	  font-weight: bold;
	  margin-bottom: 15px;
	}

	.notification-title p {
	  font-size: 16px;
	  color: #555;
	  margin-bottom: 30px;
	}

	/* 말풍선 꼬리 */
	.notification-card::after {
	  content: "";
	  position: absolute;
	  bottom: -20px;
	  left: 50%;
	  transform: translateX(-50%);
	  border-left: 10px solid transparent;
	  border-right: 10px solid transparent;
	  border-top: 20px solid #fff;
	}

	.notification-action .btn-primary {
	  background-color: #1e88e5; /* 카카오톡 블루 */
	  border-color: #1e88e5;
	  font-size: 16px;
	  padding: 12px 30px;
	  border-radius: 30px;
	  text-align: center;
	  transition: background-color 0.3s ease;
	}

	.notification-action .btn-primary:hover {
	  background-color: #1565c0; /* hover 시 더 어두운 블루 */
	  border-color: #1565c0;
	}

	/* 반응형 디자인 */
	@media (max-width: 768px) {
	  .notification-card {
	    padding: 20px;
	  }

	  .notification-action .btn-primary {
	    width: 100%;
	    font-size: 18px;
	  }
	}
	</style>
	

</head>

<body>
	<c:if test="${not empty msg}">
		   <script>
		       alert("${msg}");
		   </script>
		</c:if>
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
		                                    <a href="log/login">Sign In</a>
		                                </li>
		                                <li>
		                                    <a href="log/customer_register">Register</a>
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
                        <a class="navbar-brand" href="../main">
<!--                            <img src="assets/images/logo/logo.svg" alt="Logo">-->
                            <img src="assets/images/logo/ShoFriend_logo.png" alt="Logo" >
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
                                    <a href="../cart_view" class="main-btn">
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
								                            <h4><a href="../content?id=${item.product_id}">${item.product_title}</a></h4>
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
                                        <a class="dd-menu collapsed" href="my_page" data-bs-toggle="collapse"
                                            data-bs-target="#submenu-1-2" aria-controls="navbarSupportedContent"
                                            aria-expanded="false" aria-label="Toggle navigation">My Page</a>
                                        <ul class="sub-menu collapse" id="submenu-1-2">
<!--                                            <li class="nav-item"><a href="faq.html">Faq</a></li>-->
                                            <li class="nav-item"><a href="../my_page">My Page</a></li>
                                            <li class="nav-item"><a href="../check_pwd">Information</a></li>
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
<!--	헤더 끝 !-->
    <!-- End Header Area -->
	

	<!-- Start Breadcrumbs -->
	<div class="breadcrumbs">
	    <div class="container">
	        <div class="row align-items-center">
	            <div class="col-lg-6 col-md-6 col-12">
	                <div class="breadcrumbs-content">
	                    <h1 class="page-title">Pay result</h1>
	                </div>
	            </div>
	            <div class="col-lg-6 col-md-6 col-12">
	                <ul class="breadcrumb-nav">
	                    <li><a href="../main"><i class="lni lni-home"></i> Home</a></li>
	                    <li><a href="#">pay</a></li>
	                    <li>cancel</li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- End Breadcrumbs -->
	

	<!-- 결제 취소 알림 시작 -->
	<div class="payment-cancel-notification section">
	  <div class="container">
	    <div class="row justify-content-center">
	      <div class="col-lg-6 col-md-8 col-12">
	        <div class="notification-card">
	          <div class="notification-body">
	            <div class="notification-title">
	              <h3> 💥카카오페이 결제 취소 💥 </h3><br>
	              <p>결제 진행 중 취소되었습니다! ${message}</p>
	            </div>
	            <div class="notification-action">
	              <a href="../main" class="btn btn-primary">홈으로 돌아가기</a>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 결제 취소 알림 끝 -->
	
	
	
<!--	결제 취소 시작-->
<!--	<div class="account-card section">-->
<!--	  <div class="container">-->
<!--	    <div class="row">-->
<!--	      <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">-->
<!--	        <div class="card pay-form">-->
<!--	          <div class="card-body">-->
<!--	            <div class="title">-->
<!--	              <h3>카카오페이 결제 취소</h3><br>-->
<!--	              <p>결제 진행 중 취소되었습니다! ${message}</p>-->
<!--	            </div>-->
<!--	            <div class="col-md-auto">-->
<!--					<a href="../main" class="btn btn-primary">홈으로 돌아가기</a>-->
<!--	            </div>-->

<!--	          </div>-->
<!--	        </div>-->
<!--	      </div>-->
<!--	    </div>-->
<!--	  </div>-->
<!--	</div>-->
	
	<!--	결제 취소 끝-->

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
	                                        <a href="log/login">
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
		                               <li><a href="../category?categoryId=1">식품</a></li>
		                               <li><a href="../category?categoryId=2">가구</a></li>
		                               <li><a href="../category?categoryId=3">도서</a></li>
		                               <li><a href="../category?categoryId=4">스포츠/레저</a></li>
		                               <li><a href="../category?categoryId=5">출산/유아용품</a></li>
		                               <li><a href="../category?categoryId=6">반려동물용품</a></li>
		                               <li><a href="../category?categoryId=7">뷰티</a></li>
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
								  <img src="assets/images/footer/카카오페이_CI_combination_with_BG.svg" alt="카카오페이" style="height: 24px; max-width: 80px; width: auto;">
								  <img src="assets/images/footer/credit-cards-footer.png" alt="카드로고" style="height: 24px; max-width: 200px; width: auto;">
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
	    <script src="assets/js/bootstrap.min.js"></script>
	    <script src="assets/js/tiny-slider.js"></script>
	    <script src="assets/js/glightbox.min.js"></script>
	    <script src="assets/js/main.js"></script>
</body>
</html>
