<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Register - ShopGrids Bootstrap 5 eCommerce HTML Template.</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon.svg" />

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="../assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="../assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="../assets/css/main.css" />
	
	<link href="https://fonts.googleapis.com/css2?family=Manrope&display=swap" rel="stylesheet">
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/register.css ">
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.rtl.css "> 
	<script src="${pageContext.request.contextPath}/js/script.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	// 04.10 이메일 중복 처리
	function fn_submit() {
		var formData = $("#frm").serialize();//form 요소 자체
		$.ajax({
			type:"post"
			,data:formData
			,url:"registerOk"
			,success: function(data) {
				alert("가입이 완료되었습니다")
				location.href="login";
			}
			,error: function(){
				alert("중복된 이메일입니다. 다시 입력해주세요")
				location.href="customer_register";
			}
		});
	}



	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                 
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	//                     표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	//                     조합된 참고항목을 해당 필드에 넣는다. //address1 사용안해서 주석처리 04.10
	//                     document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>

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
									                            <a class="cart-img" href="/content?id=${item.product_id}"><img
									                                    src="/display?fileName=${item.picture}" alt="${item.product_title}" onerror="this.onerror=null; this.src='assets/images/products/crack.png'"></a>
									                        </div>

									                        <div class="content">
									                            <h4><a href="product-details.html?id=${item.product_id}">${item.product_title}</a></h4>
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
		                                            <li class="nav-item"><a href="../product_insert">Add product</a></li>
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
	                    <h1 class="page-title">회원가입</h1>
	                </div>
	            </div>
	            <div class="col-lg-6 col-md-6 col-12">
	                <ul class="breadcrumb-nav">
	                    <li><a href="../main"><i class="lni lni-home"></i> Home</a></li>
	                    
	                    <li>회원가입</li>
	                </ul>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- End Breadcrumbs -->


<!--     Start Account Register Area -->
    <div class="account-login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12">
                    <div class="register-form">
<!--                    <div class="card-body">-->
                        <div class="title">
                            <h3>회원가입</h3>
                            <p>! 고객 회원가입입니다 !</p>
                        </div>
                        <form class="row" method="post" action="registerOk">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="reg-fn">이름</label>
                                    <input class="form-control" type="text" name="name" placeholder="이름" id="reg-fn" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="reg-ln">Email</label>
                                    <input class="form-control" type="text" name="email" placeholder="Enter email" id="reg-ln" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="reg-email">비밀번호</label>
                                    <input class="form-control" type="text" name="password" placeholder="비밀번호" autocomplete="off" id="reg-email" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="reg-phone">비밀번호 확인</label>
                                    <input class="form-control" type="text" name="password_check" placeholder="비밀번호 확인" autocomplete="off" id="reg-phone" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="reg-pass">연락처</label>
                                    <input class="form-control" type="text" name="phone" placeholder="연락처" autocomplete="off" id="reg-pass" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="reg-pass-confirm">주소</label>
									<div class="zip-row">
									      <input type="text" name="zipcode"  class="form-control" id="sample6_postcode" placeholder="우편번호">
													<input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></div>
													<input type="text" name="address" class="form-control" id="sample6_address" placeholder="주소">
													<input type="text" name="address1"  class="form-control" id="sample6_extraAddress" placeholder="상세주소">
													<input type="hidden" name="address2" id="sample6_detailAddress" placeholder="참고">
									    </div>
                                </div>
                            <div class="button">
<!--                                <button class="btn" onclick="check_ok()" type="button">등록</button>-->
                                <button class="btn" onclick="check_ok()" type="submit">등록</button>
                            </div>
                            <p class="outer-link"><a href="login">Login Now</a>
                            </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--     End Account Register Area -->



    
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
	</html>