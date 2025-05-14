<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="zxx"></html>
<head>
	<meta charset="UTF-8">
	<title>상품 등록</title>
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

<!-- product_id값을 쿼리스트링으로 받아서 그 상품의 정보 불러온 상태로, 값을 수정 하는 기능 제작-->
<!-- 작성일      작성자   개발내용,수정내용 -->
<!-- 25/04/10    우주연-->
<!-- 25/04/14    김채윤 css 적용 -->
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/js/product_check.js"></script>
	<script type="text/javascript">
	
		const discountStartVal = '${product.discount_start}';
		const discountEndVal = '${product.discount_end}';
		const discountPercentVal = ${product.discount_percentage};
		
		document.addEventListener("DOMContentLoaded", function () {
		    const start = document.getElementById("discount_start");
		    const end = document.getElementById("discount_end");
		    const percentage = document.getElementById("discount_percentage");
		    const checkbox = document.getElementById("discountCheck");
	
		    const isDiscountEmpty =
		      (!discountStartVal || discountStartVal === 'null') &&
		      (!discountEndVal || discountEndVal === 'null') &&
		      (!discountPercentVal || discountPercentVal === 0);
	
		    if (isDiscountEmpty) {
		        toggleDiscount(checkbox); 
		        checkbox.checked = false;
		    } else {
		        checkbox.checked = true;
		        start.disabled = false;
		        end.disabled = false;
		        percentage.disabled = false;
		        
		        const now = new Date();
		        const offset = now.getTimezoneOffset() * 60000;
		        const localNow = new Date(now - offset).toISOString().slice(0, 16); //
		        
		        start.value = discountStartVal.replace(' ', 'T').slice(0, 16);
		        end.value = discountEndVal.replace(' ', 'T').slice(0, 16);
		        percentage.value = discountPercentVal;
	
		        start.min = localNow;
		        end.min = start.value;
		        
		        start.addEventListener('input', function () {
		            end.min = this.value;
		            if (end.value < this.value) {
		                end.value = this.value;
		            }
		        });
		    }
		});
		function toggleDiscount(checkbox) {
		    const start = document.getElementById("discount_start");
		    const end = document.getElementById("discount_end");
		    const percentage = document.getElementById("discount_percentage");
	
		    if (checkbox.checked) {
		        const now = new Date();
		        const offset = now.getTimezoneOffset() * 60000;
		        const localNow = new Date(now - offset).toISOString().slice(0, 16); // 
	
		        start.disabled = false;
		        end.disabled = false;
		        percentage.disabled = false;
		        
		        start.value = discountStartVal.replace(' ', 'T').slice(0, 16);
		        end.value = discountEndVal.replace(' ', 'T').slice(0, 16);
		        percentage.value = discountPercentVal;
	
		        start.min = localNow;
		        end.min = start.value;
		        
		        start.addEventListener('input', function () {
		            end.value = this.value;
		            end.min = this.value;
		        });
	
		    } else {
		        start.disabled = true;
		        end.disabled = true;
		        percentage.disabled = true;
	
		        start.value = "";
		        end.value = "";
		        percentage.value = 0;
		    }
		}

		const originalStockValue = ${product.stock};

		function handleStatusChange(status) {
			const stock = document.getElementById("stock");

			if (status.value === "품절") {
				stock.readOnly = true;
				stock.value = 0;
			} else {
				stock.readOnly = false;
				stock.value = originalStockValue;
			}
		}
			
	    function fn_submit() {
	    	var formData = new FormData($("#frm_product")[0]);

	    	$.ajax({
	    	    type: "post",
	    	    url: "product_modify_ok",
	    	    data: formData,
	    	    processData: false,
	    	    contentType: false,
	    	    success: function (data) {
	    	        alert("수정완료");
	    	        location.href = "main";
	    	    },
	    	    error: function () {
	    	    	alert("예상치 못한 응답입니다: " + data);
	    	    	alert("오류 발생\n상태코드: " + xhr.status + "\n응답 텍스트: " + xhr.responseText + "\n에러: " + error);
	    	    }
	    	});

	    }

	</script>
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
                        <h1 class="page-title">Product modify</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="main"><i class="lni lni-home"></i> Main</a></li>
                        <!-- <li><a href="index.html">Shop</a></li> -->
                        <li>Product modify</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

     <!-- start product modify -->
      <div class="account-login section">
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-9 offset-lg-2 col-md-10 offset-md-1 col-15">
	          <div class="card login-form">
	            <div class="card-body">
	              <div class="title">
	                <h3>상품 수정</h3>
	             <p>상품수정 페이지입니다.</p>
	              </div>
                  <br>
                  <br>
	        <form id="frm_product" enctype="multipart/form-data">
		    <table class="table">
			<tr>
				<td>가게 이름</td>
				<td>
					<input type="hidden" name="id" value="${product.id}">
					<input type="hidden" name="store_id" value="${product.store_id}">
				    <c:forEach var="store" items="${stores}">
				      <c:if test="${store.id == product.store_id}">
				        <input type="text" size="50" value="${store.name}" disabled>
				      </c:if>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<c:forEach var="cat" begin="1" end="7">
					  <label>
					    <input type="radio" name="category_id" value="${cat}"
					           <c:if test="${product.category_id == cat}">checked</c:if> >
					    <c:choose>
					   
					      <c:when test="${cat == 1}">식품</c:when>
					      <c:when test="${cat == 2}">가구</c:when>
					      <c:when test="${cat == 3}">도서</c:when>
					      <c:when test="${cat == 4}">스포츠/레저</c:when>
					      <c:when test="${cat == 5}">출산/유아용품</c:when>
					      <c:when test="${cat == 6}">반려동물용품</c:when>
					      <c:when test="${cat == 7}">뷰티</c:when>
					    </c:choose>
					  </label><br>
					</c:forEach>
				</td>
			</tr>
			
			<tr>
				<td>상품명 *</td>
				<td>
					<input type="text" class="form-control" name="title" size="50" value="${product.title}">
				</td>
			</tr>
			<tr>
				<td>가격 *</td>
				<td>
					<input type="number" class="form-control" name="price" size="50" value="${product.price}">
				</td>
			</tr>
			<tr>
				<td>재고 *</td>
				<td>
					<input type="number" class="form-control" name="stock" id="stock" min="1" step="1" size="50" value="${product.stock}">
				</td>
			</tr>
			<tr>
			  <td>상태</td>
			  <td>
			    <label>
			      <input type="radio" name="status" value="판매중"
			             onclick="handleStatusChange(this)"
			             <c:if test="${product.status == '판매중'}">checked</c:if> >
			      판매중
			    </label><br>
			
			    <label>
			      <input type="radio" name="status" value="품절"
			             onclick="handleStatusChange(this)"
			             <c:if test="${product.status == '품절'}">checked</c:if> >
			      품절
			    </label><br>
			
			    <label>
			      <input type="radio" name="status" value="숨김"
			             onclick="handleStatusChange(this)"
			             <c:if test="${product.status == '숨김'}">checked</c:if> >
			      숨김
			    </label>
			  </td>
			</tr>
			<tr>
			    <td>
					할인
					<input type="checkbox" id="discountCheck" onclick="toggleDiscount(this)" 
						<c:if test="${product.discount_start != null}">checked</c:if> >
				</td>
			    <td>
			        시작  
			        <input type="datetime-local" class="form-control" name="discount_start" id="discount_start" disabled><br>
			        끝  
			        <input type="datetime-local" class="form-control" name="discount_end" id="discount_end" disabled><br>
			        할인율(%)  
			        <input type="number" class="form-control" name="discount_percentage" id="discount_percentage" value="0" min="1" max="100" step="1" disabled> 
			    </td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td>
					<textarea rows="10" class="form-control" style="height: 150px" name="description">${product.description}</textarea>
				</td>
			</tr>
			<tr>
				<td>이미지 업로드</td>
				<td>
					<input type="file" class="form-control" name="picture" accept="image/*" >
					<input type="hidden" name="old_picture" value="${product.picture}">
				</td>
			</tr>
			
            </table>
                    <div class="text-end">
                        <input type="button" class="btn btn-primary w-100" onclick="product_check_ok()" value="입력">
				
					</div>
                    <div class="text-end">
					<a href="main" style="margin-top: 10px;">메인으로</a>
					</div>
	</form>
	</div>
	     </div>
	        </div>
	      </div>
	    </div>
	  </div>
<!-- end product modify -->


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
</body>

</html>