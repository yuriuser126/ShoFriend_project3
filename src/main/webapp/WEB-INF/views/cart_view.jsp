<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html class="no-js" lang="zxx"></html>
<head>
<meta charset="UTF-8">
	<title>장바구니</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/script.js"></script>


    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />

     <!-- ========================= CSS here =========================  -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
	<script>
		window.onload = function(){
			calculateTotal();
			setIndividualCheckbox();
		}
		function toggleAll(source){
			const checkboxes = document.getElementsByClassName('cartCheckbox');
			for(let i = 0; i <checkboxes.length; i++){
				if (!checkboxes[i].disabled) {
					checkboxes[i].checked = source.checked;
					}
		}
			calculateTotal();
			}
		function setIndividualCheckbox(){
			const checkboxes = document.querySelectorAll('.cartCheckbox');
			const selectAll = document.getElementById('selectAll');

			checkboxes.forEach(cb=>{
				cb.addEventListener('change', () =>{
					if (!cb.checked) {
						selectAll.checked = false;
					}else{
						const allChecked = Array.from(checkboxes).every(box => box.checked);
						selectAll.checked = allChecked;
					}
					calculateTotal();
				});
			});
		}
			
		function updateSubtotal(input){
		
			const price = parseInt(input.dataset.price);
			const qty = parseInt(input.value);
			const row = input.closest('.cart-row');
			const subtotalCell = row.querySelector('.subtotal');
			const subtotal = qty * price;
			subtotalCell.textContent = subtotal +'원';

			calculateTotal();
		}
		function calculateTotal(){
			const rows = document.querySelectorAll('.cart-row');
			let total = 0;
			rows.forEach(row =>{
				const checkbox = row.querySelector('.cartCheckbox');
				// const input = row.querySelector('.qty');
				const subtotalCell = row.querySelector('.subtotal');
				
				if(!checkbox || !checkbox.checked || checkbox.disabled) return;
					const rawText = subtotalCell.textContent ||"";
					const digitsOnly = rawText.replace(/[^\d]/g,'').trim();
					if(digitsOnly === '') return;
					const subtotal = parseInt(digitsOnly);
					// const subtotal = parseInt(row.querySelector('.subtotal').textContent);
					if (!isNaN(subtotal) && subtotal >0) {
						total += subtotal;
					}
			
			});
			const totalEl = document.getElementById('totalAmount')
			if (totalEl) {
				const numberFormat = new Intl.NumberFormat('ko-KR'); // 한국 통화 형식
				totalEl.textContent = numberFormat.format(total) + '원';
			}
			// document.getElementById('totalAmount').textContent = total+'원';
		}

	</script>
	<style>
		.text-muted{
			color: #999;
		}
		.text-soldOut{
			color: red;
			font-weight: bold;
		}
		.original{
			color: #aaa;
			margin-right: 4px;
		}
		.discount{
			color: blue;
			font-weight: bold;
		}
		.rate{
			color: #444;
			font-size: 0.9em;
			margin-left: 3px;
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
                                <li><a href="main">Home</a></li>
                                <li><a href="friend">Friend</a></li>
								<c:choose>
									<c:when test="${sessionScope.userType == 'seller'}">
	                                    <li><a href="my_page">seller</a></li>
									</c:when>
									<c:when test="${sessionScope.userType == 'customer'}">
	                                    <li><a href="my_page">customer</a></li>
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
                                    <a href="my_page">My Page</a>
                                </li>
								<c:choose>
									<c:when test="${sessionScope.userType == 'seller'}">
	                                    <li><a href="logout">Log out</a></li>
									</c:when>
									<c:when test="${sessionScope.userType == 'customer'}">
	                                    <li><a href="logout">Log out</a></li>
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
                        <a class="navbar-brand" href="main">
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
												    <a href="cart_view" class="btn animate" >View Cart</a>
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
							<span class="cat-button"><a href="category"><i class="lni lni-menu"></i>All
									Categories</a></span>
							<ul class="sub-category">
                                <c:forEach var="cat" items="${categorylist}">
                                    <li>
                                        <a href="/category?categoryId=${cat.id}&sort=${sort}">${cat.name}</a>
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
                                        <a href="main" class="active" aria-label="Toggle navigation">Home</a>
                                    </li>
									<li class="nav-item">
									    <a href="friend" aria-label="Toggle navigation">Friend</a>
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
                                            <li class="nav-item"><a href="my_page">My Page</a></li>
                                            <li class="nav-item"><a href="check_pwd">Information</a></li>
											<c:if test="${sessionScope.userType == 'customer'}">
                                            	<li class="nav-item"><a href="order_view">Order List</a></li>
											</c:if>
                                        </ul>
                                    </li>
									<c:if test="${sessionScope.userType == 'seller'}">
	                                    <li class="nav-item">
	                                        <a class="dd-menu collapsed" href="javascript:void(0)" data-bs-toggle="collapse"
	                                            data-bs-target="#submenu-1-3" aria-controls="navbarSupportedContent"
	                                            aria-expanded="false" aria-label="Toggle navigation">Manage</a>
	                                        <ul class="sub-menu collapse" id="submenu-1-3">
	                                            <li class="nav-item"><a href="store_list">My Store</a></li>
	                                            <li class="nav-item"><a href="product_insert">Add Product</a></li>
	                                            <li class="nav-item"><a href="store_register">Add Store</a></li>
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
                        <!-- <h1 class="page-title">Single Product</h1> -->
                        <h1 class="page-title">Cart</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="main"><i class="lni lni-home"></i> Main</a></li>
                        <!-- <li><a href="index.html">Shop</a></li> -->
                        <li>Cart</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
	
	<!-- Shopping Cart -->
		<form method="post" action="/cartAction">
		    <div class="account-login section">
		        <div class="container">
		            <div class="cart-list-head">
		                <!-- Cart List Title -->
		                <div class="cart-list-title">
		                    <div class="row">
		                        <div class="col-lg-1 col-md-1 col-12">
									<input type="checkbox" id="selectAll" onclick="toggleAll(this)" checked>
		                        </div>
		                        <div class="col-lg-1 col-md-1 col-12">
									<p>전체선택</p>
		                        </div>
		                        <div class="col-lg-3 col-md-3 col-12">
		                            <p>상품명</p>
		                        </div>
		                        <div class="col-lg-2 col-md-2 col-12">
		                            <p>수량</p>
		                        </div>
		                        <div class="col-lg-2 col-md-2 col-12">
		                            <p>할인 적용가</p>
		                        </div>
		                        <div class="col-lg-2 col-md-2 col-12">
		                            <p>합계</p>
		                        </div>
		                        <div class="col-lg-1 col-md-2 col-12">
		                            <p>삭제</p>
		                        </div>
		                    </div>
							<hr>
		                </div>
		                <!-- End Cart List Title -->
						
		                <!-- Cart Single List list -->
						<c:forEach var="dto" items="${items}">
							<c:set var="isSoldOut"  value="${dto.stock == 0}"/>
			                <div class="cart-single-list cart-row ${isSoldOut ? 'text-muted' : ''}">
			                    <div class="row align-items-center">
									<div class="col-lg-1 col-md-1 col-12">
										<input type="checkbox" name="selectedIds" value="${dto.id}" class="cartCheckbox" 
												         ${isSoldOut ? 'disabled' :''} onchange="calculateTotal()" checked>
								 	</div>
			                        <div class="col-lg-1 col-md-1 col-12">
										<a class="cart-img" href="content?id=${dto.product_id}"><img
		                                    src="/display?fileName=${dto.picture}" alt="${dto.product_title}" onerror="this.onerror=null; this.src='assets/images/products/crack.png'"></a>
			                        </div>
			                        <div class="col-lg-3 col-md-3 col-12">
			                            <h5 class="product-name"><a href="/content?id=${dto.product_id}">
			                                    ${dto.product_title}</a></h5>
			                        </div>
			                        <div class="col-lg-2 col-md-2 col-12">
			                            <div class="count-input">
											<input type="number" class="qty form-control" name="cart_quantity_${dto.id}" value="${dto.quantity}" min="1"
												data-price="${dto.final_price}" onchange="updateSubtotal(this)" ${isSoldOut ? 'disabled' :''}>
			                            </div>
			                        </div>
			                        <div class="col-lg-2 col-md-2 col-12">
										<c:choose>
											<c:when test="${dto.final_price lt dto.price}">
													<span class="rate">(${dto.discount_percentage}%)</span>
													<span class="discount"><fmt:formatNumber value="${dto.final_price}" pattern="#,###" />원</span>
											</c:when>
											<c:otherwise>
												<fmt:formatNumber value="${dto.price}" pattern="#,###" />원
											</c:otherwise>
										</c:choose>
			                        </div>
			                        <div class="col-lg-2 col-md-2 col-12">
										<div class="subtotal">
											<c:choose>
												<c:when test="${isSoldOut}">
													<span class="text-soldOut">품절</span>
												</c:when>
												<c:otherwise>
													<fmt:formatNumber value="${dto.final_price*dto.quantity}" pattern="#,###" />원
												</c:otherwise>
											</c:choose>
											
											<c:if test="${!isSoldOut}">
											   <c:set var="itemSubtotal" value="${dto.final_price * dto.quantity}" />
											   <c:set var="itemOriginal" value="${dto.price * dto.quantity}" />
											   <c:set var="total" value="${total + itemSubtotal}" />
											   <c:set var="originalTotal" value="${originalTotal + itemOriginal}" />
											 </c:if>
											
										</div>
			                        </div>
									<div class="col-lg-1 col-md-2 col-12">
									    <a class="remove-item" href="javascript:void(0)" onclick="removeItemFromCart('${dto.id}')"><i class="lni lni-close"></i></a>
									</div>
			                    </div>
			                </div>
						</c:forEach>
		                <!-- End Single List list -->
						
						
						
						<div class="col-lg-3 col-md-4 col-12 cart-buttons d-flex justify-content-end">
						  <div class="button-group d-flex gap-2">
						    <button type="button" onclick="submitDeleteSoldOut()" class="btn-delete-soldout">품절 상품 삭제</button>
						    <button type="submit" onclick="return validateCartSelection()" name="submitType" value="delete" class="btn-delete-selected">선택 삭제</button>
						  </div>
						</div>
						
					</div>
	<!-- end of Shopping Cart -->
					
				<!--Start Total Amount-->
					<div class="cart-summary-container">
					  <div class="row justify-content-between align-items-start">


					    
					    <div class="col-lg-4 col-md-6 col-12 cart-summary">
					      <div class="summary-box">
					        <ul class="summary-list">
					          <li>합계 <span><fmt:formatNumber value="${originalTotal}" pattern="#,###"/>원</span></li>
					          <li>배송비 <span>무료</span></li>
					          <li>할인된 금액 <span><fmt:formatNumber value="${originalTotal - total}" pattern="#,###"/>원</span></li>
					          <hr>
					          <li class="summary-total">총 합계 <span id="totalAmount"></span></li>
					        </ul>
					        <div class="summary-buttons">
					          <button type="submit" onclick="return validateCartSelection()" name="submitType" value="order" class="btn-checkout">주문하기</button>
					          <a href="main" class="btn-continue">Continue Shopping</a>
					        </div>
					      </div>
					    </div>

					  </div>
					</div>
		                    <!--/ End Total Amount -->
							
							
		                </div>
		            </div>
		        </div>
		    </div>
		</form>
	    <!--/ End Shopping Cart -->
	

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
                                <p>Designed and Developed by<a href="main" rel="nofollow"
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
    <script type="text/javascript">
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

<script>
		function submitDeleteSoldOut(){
			const form = document.createElement("form");
			form.method = "post";
			form.action = "deleteSoldOut";
			document.body.appendChild(form);
			form.submit();
		}
		function validateCartSelection() {
			const checkboxes = document.querySelectorAll('.cartCheckbox');
			for(let cb of checkboxes){
				if(cb.checked && !cb.disabled){
				return true;
			}
		}
		alert("선택된 상품이 없습니다.");
		return false;
		}
		function removeItemFromCart(itemId) {
		    if (confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")) {
		        const form = document.createElement("form");
		        form.method = "post";
		        form.action = "/cartAction";

		        const selectedIdsInput = document.createElement("input");
		        selectedIdsInput.type = "hidden";
		        selectedIdsInput.name = "selectedIds";
		        selectedIdsInput.value = itemId;

		        const submitTypeInput = document.createElement("input");
		        submitTypeInput.type = "hidden";
		        submitTypeInput.name = "submitType";
		        submitTypeInput.value = "delete"; // 단일 삭제 요청임을 명시

		        form.appendChild(selectedIdsInput);
		        form.appendChild(submitTypeInput);

		        document.body.appendChild(form);
		        form.submit();
		    }
		}
</script>

<script>
  // 총합계 계산
  function calculateTotal() {
    let total = 0;
    const items = document.querySelectorAll('.cart-single-list');

    items.forEach(item => {
      const checkbox = item.querySelector('.cartCheckbox');
      const qtyInput = item.querySelector('.qty');

      if (checkbox && checkbox.checked && !checkbox.disabled && qtyInput) {
        const price = parseFloat(qtyInput.getAttribute('data-price')) || 0;
        const quantity = parseInt(qtyInput.value) || 1;
        total += price * quantity;
      }
    });

    // 포맷팅
    const formatted = total.toLocaleString('ko-KR') + ' 원';
    document.getElementById('totalAmount').textContent = formatted;
  }

  // 수량 변경 or 체크박스 변경 
  document.addEventListener('DOMContentLoaded', () => {
    calculateTotal();

    // 수량 변경
    document.querySelectorAll('.qty').forEach(input => {
      input.addEventListener('input', calculateTotal);
    });

    // 체크박스 변경 
    document.querySelectorAll('.cartCheckbox').forEach(checkbox => {
      checkbox.addEventListener('change', calculateTotal);
    });
  });
</script>
</body>
</html>