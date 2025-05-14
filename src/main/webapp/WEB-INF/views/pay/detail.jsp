<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 상세 정보</title>
	<!-- bootstrap css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css ">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

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
    <style>
        .order-details {
            margin-top: 30px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .order-item {
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        .order-item:last-child {
            border-bottom: none;
        }
        .total-price {
            margin-top: 20px;
            font-size: 1.2em;
            font-weight: bold;
        }
    </style>
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
	                                            <option value="0" selected>$ USD</option>
	                                            <option value="1">€ EURO</option>
	                                            <option value="2">$ CAD</option>
	                                            <option value="3">₹ INR</option>
	                                            <option value="4">¥ CNY</option>
	                                            <option value="5">৳ BDT</option>
	                                        </select>
	                                    </div>
	                                </li>
	                                <li>
	                                    <div class="select-position">
	                                        <select id="select5">
	                                            <option value="0" selected>English</option>
	                                            <option value="1">Español</option>
	                                            <option value="2">Filipino</option>
	                                            <option value="3">Français</option>
	                                            <option value="4">العربية</option>
	                                            <option value="5">हिन्दी</option>
	                                            <option value="6">বাংলা</option>
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
	                                <li>
	                                    <a href="login">Sign In</a>
	                                </li>
	                                <li>
	                                    <a href="customer_register">Register</a>
	                                </li>
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
	<!--                            <img src="../assets/images/logo/logo.svg" alt="Logo">-->
	                            <img src="../assets/images/logo/ShoFriend_logo.png" alt="Logo" >
	                        </a>
	                        <!-- End Header Logo -->
	                    </div>
	                    <div class="col-lg-5 col-md-7 d-xs-none">
	                        <!-- Start Main Menu Search -->
	                        <div class="main-menu-search">
	                            <!-- navbar search start -->
	                            <div class="navbar-search search-style-5">
	                                <div class="search-select">
	                                    <div class="select-position">
	                                        <select id="select1">
	                                            <option selected>All</option>
	                                            <option value="1">option 01</option>
	                                            <option value="2">option 02</option>
	                                            <option value="3">option 03</option>
	                                            <option value="4">option 04</option>
	                                            <option value="5">option 05</option>
	                                        </select>
	                                    </div>
	                                </div>
	                                <div class="search-input">
	                                    <input type="text" placeholder="Search">
	                                </div>
	                                <div class="search-btn">
	                                    <button><i class="lni lni-search-alt"></i></button>
	                                </div>
	                            </div>
	                            <!-- navbar search Ends -->
	                        </div>
	                        <!-- End Main Menu Search -->
	                    </div>
	                    <div class="col-lg-4 col-md-2 col-5">
	                        <div class="middle-right-area">
	                            <div class="nav-hotline">
	                                <i class="lni lni-phone"></i>
	                                <h3>Hotline:
	<!--                                    <span>(+100) 123 456 7890</span>-->
	                                    <span> 051) 123 4567</span>
	                                </h3>
	                            </div>
	                            <div class="navbar-cart">
	                                <div class="wishlist">
	                                    <a href="javascript:void(0)">
	                                        <i class="lni lni-heart"></i>
	                                        <span class="total-items">0</span>
	                                    </a>
	                                </div>
	                                <div class="cart-items">
	                                    <a href="javascript:void(0)" class="main-btn">
	                                        <i class="lni lni-cart"></i>
	                                        <span class="total-items">2</span>
	                                    </a>
	                                    <!-- Shopping Item -->
	                                    <div class="shopping-item">
	                                        <div class="dropdown-cart-header">
	                                            <span>2 Items</span>
	                                            <a href="cart.html">View Cart</a>
	                                        </div>
	                                        <ul class="shopping-list">
	                                            <li>
	                                                <a href="javascript:void(0)" class="remove" title="Remove this item"><i
	                                                        class="lni lni-close"></i></a>
	                                                <div class="cart-img-head">
	                                                    <a class="cart-img" href="product-details.html"><img
	                                                            src="../assets/images/header/cart-items/item1.jpg" alt="#"></a>
	                                                </div>

	                                                <div class="content">
	                                                    <h4><a href="product-details.html">
	                                                            Apple Watch Series 6</a></h4>
	                                                    <p class="quantity">1x - <span class="amount">$99.00</span></p>
	                                                </div>
	                                            </li>
	                                            <li>
	                                                <a href="javascript:void(0)" class="remove" title="Remove this item"><i
	                                                        class="lni lni-close"></i></a>
	                                                <div class="cart-img-head">
	                                                    <a class="cart-img" href="product-details.html"><img
	                                                            src="../assets/images/header/cart-items/item2.jpg" alt="#"></a>
	                                                </div>
	                                                <div class="content">
	                                                    <h4><a href="product-details.html">Wi-Fi Smart Camera</a></h4>
	                                                    <p class="quantity">1x - <span class="amount">$35.00</span></p>
	                                                </div>
	                                            </li>
	                                        </ul>
	                                        <div class="bottom">
	                                            <div class="total">
	                                                <span>Total</span>
	                                                <span class="total-amount">$134.00</span>
	                                            </div>
	                                            <div class="button">
	                                                <a href="checkout.html" class="btn animate">Checkout</a>
	                                            </div>
	                                        </div>
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
	                            <span class="cat-button"><a href="../category"><i class="lni lni-menu"></i>All Categories</a></span>
	                            <ul class="sub-category">
	                                <li><a href="product-grids.html">추천상품</a>
	<!--                                <li><a href="product-grids.html">추천상품<i class="lni lni-chevron-right"></i></a>-->
	<!--                                    <ul class="inner-sub-category">-->
	<!--                                        <li><a href="product-grids.html">하위목록1</a></li>-->
	<!--                                        <li><a href="product-grids.html">하위목록2</a></li>-->
	<!--                                        <li><a href="product-grids.html">하위목록3</a></li>-->
	<!--                                        <li><a href="product-grids.html">하위목록4</a></li>-->
	<!--                                    </ul>-->
	                                </li>
	                                <li><a href="product-grids.html">반짝세일</a></li>
	                                <li><a href="product-grids.html">식품</a></li>
	                                <li><a href="product-grids.html">가구</a></li>
	                                <li><a href="product-grids.html">도서</a></li>
	                                <li><a href="product-grids.html">스포츠/레저</a></li>
	                                <li><a href="product-grids.html">출산/유아용품</a></li>
	                                <li><a href="product-grids.html">반려동물용품</a></li>
	                                <li><a href="product-grids.html">뷰티</a></li>
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
	                                        <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse"
	                                            data-bs-target="#submenu-1-2" aria-controls="navbarSupportedContent"
	                                            aria-expanded="false" aria-label="Toggle navigation">Pages</a>
	                                        <ul class="sub-menu collapse" id="submenu-1-2">
	<!--                                            <li class="nav-item"><a href="faq.html">Faq</a></li>-->
	                                            <li class="nav-item"><a href="../log/login">Login</a></li>
	<!--                                            <li class="nav-item"><a href="customer_register">Register</a></li>-->
	                                        </ul>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse"
	                                            data-bs-target="#submenu-1-3" aria-controls="navbarSupportedContent"
	                                            aria-expanded="false" aria-label="Toggle navigation">Shop</a>
	                                        <ul class="sub-menu collapse" id="submenu-1-3">
	<!--                                            <li class="nav-item"><a href="product-grids.html">Shop Grid</a></li>-->
	<!--                                            <li class="nav-item"><a href="product-list.html">Shop List</a></li>-->
	<!--                                            <li class="nav-item"><a href="product-details.html">shop Single</a></li>-->
	                                            <li class="nav-item"><a href="../cart_view">Cart</a></li>
	<!--                                            <li class="nav-item"><a href="checkout.html">Checkout</a></li>-->
	                                        </ul>
	                                    </li>
	<!--                                    <li class="nav-item">-->
	<!--                                        <a href="contact.html" aria-label="Toggle navigation">Contact Us</a>-->
	<!--                                    </li>-->
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
	                                <a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a>
	                            </li>
	                            <li>
	                                <a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a>
	                            </li>
	                            <li>
	                                <a href="javascript:void(0)"><i class="lni lni-instagram"></i></a>
	                            </li>
	                            <li>
	                                <a href="javascript:void(0)"><i class="lni lni-skype"></i></a>
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
		                      <h1 class="detail">Detail</h1>
		                  </div>
		              </div>
		              <div class="col-lg-6 col-md-6 col-12">
		                  <ul class="breadcrumb-nav">
		                      <li><a href="../main"><i class="lni lni-home"></i> Home</a></li>
		                      <li>Detail</li>
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
          <div class="card login-form">
            <div class="card-body">
              <div class="title">
                <h3>주문상세정보</h3><br>
                <p>-- 현재 주문된 상세정보란 입니다 --</p>
              </div>

			  	
			  <!--	주문 상세정보 시작-->
			      

			          <c:if test="${empty orderDetail}">
			              <p>해당 주문의 상세 정보가 없습니다.</p>
			          </c:if>

			          <c:if test="${not empty orderDetail}">
			              <div class="order-details">
			                  <h5>주문 정보</h5>
			                  <p><strong>주문 번호:</strong> ${orderDetail.order.partner_order_id}</p>
			                  <p><strong>주문 날짜:</strong> <fmt:formatDate value="${orderDetail.order.order_date}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
			                  <p><strong>배송 주소:</strong> ${orderDetail.order.delivery_address} (${orderDetail.order.delivery_zipcode})</p>
			                  <p><strong>배송 상태:</strong> ${orderDetail.order.payment_status}</p>
			                  <p><strong>총 주문 금액:</strong> <fmt:formatNumber value="${orderDetail.order.total_price}" pattern="#,###원"/></p>

			                  <h5 class="mt-4">주문 상품 목록</h5>
			                  <c:if test="${empty orderDetail.orderItems}">
			                      <p>주문한 상품이 없습니다.</p>
			                  </c:if>
			  				<c:if test="${not empty orderDetail.orderItems}">
			  				    <c:forEach var="item" items="${orderDetail.orderItems}">
			  				        <div class="order-item">
										<br>
			  				            <h6>${item.product.title}</h6>
			  				            <p><strong>수량:</strong> ${item.quantity}개</p>
			  				            <p><strong>가격:</strong> <fmt:formatNumber value="${item.sale_price}" pattern="#,###원"/></p>
			  				            <p><strong>총 상품 금액:</strong> <fmt:formatNumber value="${item.sale_price * item.quantity}" pattern="#,###원"/></p>
			  				        </div>
			  				    </c:forEach>
			  				</c:if>

			                  <div class="total-price">
			                      총 결제 금액: <fmt:formatNumber value="${orderDetail.order.total_price}" pattern="#,###원"/>
			                  </div>
			              </div>
			          </c:if>

			          <a href="javascript:history.back()" class="btn btn-secondary mt-3">뒤로 가기</a>
			          <a href="${pageContext.request.contextPath}/" class="btn btn-primary mt-3 ml-2">홈으로 돌아가기</a>
			      
			  <!--	주문상세정보 끝-->

            </div>
          </div>
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
  	<!--                                    <li>-->
  	<!--                                        <a href="javascript:void(0)">-->
  	<!--                                            <i class="lni lni-play-store"></i>-->
  	<!--                                            <span class="small-title">Download on the</span>-->
  	<!--                                            <span class="big-title">Google Play</span>-->
  	<!--                                        </a>-->
  	<!--                                    </li>-->
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
  									   <li><a href="product-grids.html">반짝세일</a></li>
  		                               <li><a href="product-grids.html">식품</a></li>
  		                               <li><a href="product-grids.html">가구</a></li>
  		                               <li><a href="product-grids.html">도서</a></li>
  		                               <li><a href="product-grids.html">스포츠/레저</a></li>
  		                               <li><a href="product-grids.html">출산/유아용품</a></li>
  		                               <li><a href="product-grids.html">반려동물용품</a></li>
  		                               <li><a href="product-grids.html">뷰티</a></li>
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
  	<!--                                <img src="../assets/images/footer/credit-cards-footer.png" alt="#">-->
  	<!--                                <img src="../assets/images/footer/카카오페이_CI_combination_with_BG.svg" alt="#">-->
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
  <!--		        ========= Hero Slider -->
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

  <!--		        //======== Brand Slider-->
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




  </html>