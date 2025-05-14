<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
	
	<!-- bootstrap css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css ">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Single Product - ShopGrids Bootstrap 5 eCommerce HTML Template.</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />

	
	
    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.3.0.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/glightbox.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	<style>
		.your-personal-details-container {
		    padding: 10px;
		    margin-bottom: 10px;
		    cursor: pointer;
		    display: flex; /* 추가 */
		    justify-content: space-between; /* 추가 */
		    align-items: center; /* 추가 */
		}

		.toggle-icon {
		    font-size: 1.2em; /* 아이콘 크기 조절 (선택 사항) */
		    /* margin-left: auto; /* 이전 방법: 왼쪽 마진을 auto로 설정 */ */
		}

		.personal-details-content {
		    overflow: hidden;
		    max-height: 0; /* 초기 높이를 0으로 설정하여 숨김 */
		    margin-top: 0;
		    padding-top: 0;
		    padding-bottom: 0;
		    transition: max-height 0.3s ease-in-out, margin-top 0.3s ease-in-out, padding-top 0.3s ease-in-out, padding-bottom 0.3s ease-in-out;
		}

		.personal-details-content.open {
		    max-height: 1000px; /* 충분히 큰 값으로 설정 (실제 내용에 따라 조절) */
		    margin-top: 15px;
		    padding-top: 15px;
		    padding-bottom: 15px;
		}
		
		
		.delivary-container {
		    padding: 10px;
		    margin-bottom: 10px;
		    cursor: pointer;
		    display: flex; /* 추가 */
		    justify-content: space-between; /* 추가 */
		    align-items: center; /* 추가 */
		}

		.delivary-details-content {
		    overflow: hidden;
		    max-height: 0; /* 초기 높이를 0으로 설정하여 숨김 */
		    margin-top: 0;
		    padding-top: 0;
		    padding-bottom: 0;
		    transition: max-height 0.3s ease-in-out, margin-top 0.3s ease-in-out, padding-top 0.3s ease-in-out, padding-bottom 0.3s ease-in-out;
		}

		.delivary-details-content.open {
		    max-height: 1000px; /* 충분히 큰 값으로 설정 (실제 내용에 따라 조절) */
		    margin-top: 15px;
		    padding-top: 15px;
		    padding-bottom: 15px;
		}
	</style>
	<!-- ========================= script here ========================= -->
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<!--	<script src="${pageContext.request.contextPath}/js/script.js"></script>-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//토글 스위치
		document.addEventListener('DOMContentLoaded', function() {
		        const detailsContainer = document.querySelector('.your-personal-details-container');
		        const detailsContent = document.querySelector('.personal-details-content');

		        if (detailsContainer && detailsContent) {
		            detailsContainer.addEventListener('click', function() {
		                detailsContent.classList.toggle('open');
		            });
		        }
		    });
		//토글 스위치
		document.addEventListener('DOMContentLoaded', function() {
		        const detailsContainer = document.querySelector('.delivary-container');
		        const detailsContent = document.querySelector('.delivary-details-content');

		        if (detailsContainer && detailsContent) {
		            detailsContainer.addEventListener('click', function() {
		                detailsContent.classList.toggle('open');
		            });
		        }
		    });
			
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
		
		document.addEventListener('DOMContentLoaded', function() {
		    const deliveryMemoSelect = document.getElementById('delivery_memo_select');
		    const directInputContainer = document.getElementById('direct_input_container');
		    const deliveryMemoDirectInput = document.getElementById('delivery_memo_direct');
		    const deliveryMemoHiddenInput = document.getElementById('delivery_memo');

		    deliveryMemoSelect.addEventListener('change', function() {
		        const selectedValue = this.value;

		        if (selectedValue === 'direct_input') {
		            directInputContainer.style.display = 'block';
		            deliveryMemoHiddenInput.value = deliveryMemoDirectInput.value; // 초기 값 동기화
		        } else {
		            directInputContainer.style.display = 'none';
		            deliveryMemoHiddenInput.value = selectedValue;
		        }
		    });

		    deliveryMemoDirectInput.addEventListener('input', function() {
		        deliveryMemoHiddenInput.value = this.value;
		    });
		});
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
	
	
	

    <!-- Start Item Details -->
	<section class="item-details section">
	    <div class="container">
	        <div class="row">
	            <div class="col-md-9">
	                <div class="top-area">
	                    <div class="your-personal-details-container" style="cursor: pointer; display: flex; justify-content: space-between; align-items: center;">
	                        Your Personal Details
	                        <i class="lni lni-chevron-down toggle-icon"></i>
	                    </div>
<!--	                    <form name="checkout_frm" id="frm" method="post">-->
						<form action="/pay/ready" name="checkout_frm" id="frm" method="post">
							<div class="personal-details-content">
							  <div class="row">
							    <div class="col-lg-6 col-md-6 col-12">
							      <label>이름</label>
							      <input type="text" name="name" class="form-control" value="${sessionScope.loginCustomer.name}" readonly>
							    </div>
							    <div class="col-lg-6 col-md-6 col-12">
							      <label>메일주소</label>
							      <input type="text" name="email" class="form-control" value="${sessionScope.loginCustomer.email}" readonly>
							    </div>
							    <div class="col-lg-12 col-md-12 col-12">
							      <label>전화번호</label>
							      <input type="text" name="phone" class="form-control" value="${sessionScope.loginCustomer.phone}">
							    </div>
							  </div>

							  <div class="wish-button">
							    <button class="btn btn-secondary" onclick="sample6_execDaumPostcode()" type="button">주소찾기</button>
							  </div>

							  <div class="row">
							    <div class="col-lg-4 col-md-4 col-12">
							      <label>우편번호</label>
							      <input type="text" name="zipcode" class="form-control" id="sample6_postcode" value="${sessionScope.loginCustomer.zipcode}">
							    </div>
							    <div class="col-lg-12 col-md-12 col-12">
							      <label>주소</label>
							      <input type="text" name="address" class="form-control" id="sample6_address" value="${sessionScope.loginCustomer.address}">
							    </div>
							    <div class="col-lg-12 col-md-12 col-12">
							      <label>상세주소</label>
							      <input type="text" name="address1" class="form-control" id="sample6_extraAddress" value="${sessionScope.loginCustomer.address1}">
							      <input type="hidden" name="address2" id="sample6_detailAddress" placeholder="참고">
							    </div>
							  </div>
							</div>
	                </div>
					
					<br>
					
	                <div class="top-area">
	                    <div class="delivary-container" style="cursor: pointer; display: flex; justify-content: space-between; align-items: center;">
	                        shipping information
	                        <i class="lni lni-chevron-down toggle-icon"></i>
	                    </div>
                        <div class="delivary-details-content">
                            <div class="row align-items-center">
								<div class="col-lg-6 col-md-6 col-12 delivery-section">
								  <!-- 배송 메시지 선택 -->
								  <label for="delivery_memo_select">배송 메시지:</label>
								  <div class="form-group">
								    <select class="form-control" id="delivery_memo_select" name="delivery_memo_select">
								      <option value="">선택해주세요</option>
								      <option value="배송시 연락 주세요.">배송시 연락 주세요.</option>
								      <option value="경비실에 맡겨주세요.">경비실에 맡겨주세요.</option>
								      <option value="집 앞에 둬주세요.">집 앞에 둬주세요.</option>
								      <option value="direct_input">직접 입력하기</option>
								    </select>
								  </div>

								  <!-- 직접 입력 영역 -->
								  <div id="direct_input_container" style="display: none;">
								    <label for="delivery_memo_direct">직접 입력:</label>
								    <input type="text" id="delivery_memo_direct" name="delivery_memo_direct" class="form-control">
								  </div>

								  <input type="hidden" id="delivery_memo" name="delivery_memo" value="">

								  <!-- 결제 방법 -->
								  <div class="payment-method">
								    <label for="howpay">Select payment method :</label>
								    <img src="../assets/images/footer/카카오페이_CI_combination_with_BG.svg" alt="카카오페이" style="height: 24px; max-width: 80px; width: auto;">
								  </div>
								</div>
								
                            </div>
                        </div>
	                </div>
	            </div>
	            <div class="col-md-3">
	                <div class="top-area">
						상품정보
						            <c:forEach var="product" items="${products}" varStatus="status">
						                <ul>
						                    <li><a href="../content?id=${product.id}">상품명:${product.title}</a></li>
						                    <c:set var="now" value="<%= new java.util.Date() %>"/>
						                    <c:choose>
						                        <c:when test="${product.discount_start <= now and now <= product.discount_end}">
						                            <span><fmt:formatNumber value="${product.price - (product.price * product.discount_percentage / 100)}" pattern="#,###"/>원</span>
						                            <del><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</del>
						                        </c:when>
						                        <c:otherwise>
						                            <span><fmt:formatNumber value="${product.price}" pattern="#,###"/>원</span>
						                        </c:otherwise>
						                    </c:choose>
						                    <input type="hidden" name="productId[]" value="${product.id}">
						                    <input type="hidden" name="quantity[]" value="${quantities[status.index]}">
						                </ul>
						            </c:forEach>
						        </div>
						        <div class="top-area">
						            Payment Info

						            <ul>
						                <li><a href="#">결제 금액:<fmt:formatNumber value="${totalPrice}" pattern="#,###"/></a></li>
						            </ul>
						            <input type="hidden" name="totalAmount" value="${totalPrice}">
						            <input type="hidden" name="itemName" value="${products[0].title} 외 ${products.size() - 1}건">
						            <div class="button cart-button">
						                <button class="btn" style="width: 100%;" type="submit">결제하기</button>
						            </div>
									
									
						        </div>
						    </div>
						</form>
			        <div>
	            </div>
	        </div> 
	    </div>
	</section>
    <!-- End Item Details -->
	
	

    <!-- Review Modal -->
    <div class="modal fade review-modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Leave a Review</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="review-name">Your Name</label>
                                <input class="form-control" type="text" id="review-name" required>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="review-email">Your Email</label>
                                <input class="form-control" type="email" id="review-email" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="review-subject">Subject</label>
                                <input class="form-control" type="text" id="review-subject" required>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="review-rating">Rating</label>
                                <select class="form-control" id="review-rating">
                                    <option>5 Stars</option>
                                    <option>4 Stars</option>
                                    <option>3 Stars</option>
                                    <option>2 Stars</option>
                                    <option>1 Star</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="review-message">Review</label>
                        <textarea class="form-control" id="review-message" rows="8" required></textarea>
                    </div>
                </div>
                <div class="modal-footer button">
                    <button type="button" class="btn">Submit Review</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End Review Modal -->

	
	
	
	
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
				   <script src="assets/js/bootstrap.min.js"></script>
				   <script src="assets/js/tiny-slider.js"></script>
				   <script src="assets/js/glightbox.min.js"></script>
				   <script src="assets/js/main.js"></script>
				   <script type="text/javascript">
				       const current = document.getElementById("current");
				       const opacity = 0.6;
				       const imgs = document.querySelectorAll(".img");
				       imgs.forEach(img => {
				           img.addEventListener("click", (e) => {
				               //reset opacity
				               imgs.forEach(img => {
				                   img.style.opacity = 1;
				               });
				               current.src = e.target.src;
				               //adding class 
				               //current.classList.add("fade-in");
				               //opacity
				               e.target.style.opacity = opacity;
				           });
				       });
				   </script>
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