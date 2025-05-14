<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>${product.title} 상세페이지</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/content.css ">
	<script src="${pageContext.request.contextPath}/resources/js/timer.js"></script>
</head>
<!-- product_id 받아와서 상세페이지 출력-->
<!-- 작성일      작성자   개발내용,수정내용 -->
<!-- 25/04/10    우주연   세션이랑 디자인전까지 완성됨-->
<!-- 25/04/11    우주연   세션추가 -->
<!-- 25/04/14 	 김채윤   css -->
<!-- 25/04/14 	 성유리   img 추가, nav바 추가, 재정렬 , 카테고리 추가 -->
<body>
<!-- 	<a href="main">홈으로가기</a> -->

	<c:choose>
		    
		    <c:when test="${sessionScope.userType == 'customer'}">
		  	    <nav class="nav">
				  <a class="nav-link active" aria-current="page" href="main">ShoFriend</a>
				  <a class="nav-link" href="my_page">마이페이지</a>
				  <a class="nav-link" href="friend">친구</a>
				  <a class="nav-link disabled"  aria-disabled="true">${sessionScope.loginCustomer.name} 님은 seller 입니다.</a>
				  <a class="nav-link" href="logout">로그아웃</a>
			</nav>
		    </c:when>
		  
		    <c:when test="${sessionScope.userType == 'seller'}">
		       <nav class="nav">
				  <a class="nav-link active" aria-current="page" href="main">ShoFriend</a>
				  <a class="nav-link" href="my_page">마이페이지</a>
				  <a class="nav-link" href="store_list">점포관리</a>
				  <a class="nav-link" href="product_insert">상품추가</a>
				  <a class="nav-link disabled"  aria-disabled="true">${sessionScope.loginSeller.name} 님은 seller 입니다.</a>
				  <a class="nav-link" href="logout">로그아웃</a>
			</nav>
		    </c:when>
		    <c:otherwise>
		           <nav class="nav">
				  <a class="nav-link active" aria-current="page" href="main">ShoFriend</a>
				  <a class="nav-link" href="my_page">마이페이지</a>
				  <a class="nav-link" href="friend">친구</a>
				  <a class="nav-link disabled"  aria-disabled="true">로그인 상태가 아닙니다.</a>
				  <a class="nav-link" href="log/login">로그인</a>
			</nav>
		    </c:otherwise>
		   
		</c:choose>
		<br>
		<br>
		<br>
		<br>

<!-- 	<h1 class="text-center">쇼프렌입니다</h1> -->
<div align="center" style="overflow: scroll; width: 100%; ">
<img  src="resources/images/ShoFriend_rogo.PNG" class="img-fluid" alt="...">

	<br>
	<br>
<a href="category?category_id=9" class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2">
		 추천상품
		</a>
		<a href="category?category_id=8" class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2">
		반짝세일</a>
		<a href="category?category_id=1" class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2">
		식품</a>
		<a href="category?category_id=2" class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2">
		가구</a>
		<a href="category?category_id=3" class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2">
		도서</a>
		<a href="category?category_id=4" class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2">
		스포츠/레저</a>
		<a href="category?category_id=5" class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2">
		출산/유아용품</a>
		<a href="category?category_id=6" class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2">
		반려동물용품</a>
		<a href="category?category_id=7" class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2"
		style="margin-bottom: 20px">
		뷰티</a>
	</div>
	<hr>
	<div class="product-container">
	<div class="product-image">
   	<img src="${pageContext.request.contextPath}/resources/images/${product.picture}" class="img-thumbnail" width="200" height="200"/><br>
<%--     <img src="${product.picture}" width="200" height="200"/><br> --%>
	</div>
	<div class="product-info">

    <h2 style="margin-bottom:30px; font-size: 60px;" >${product.title}</h2>
    <strong>가게이름:</strong> ${storeName}<br>
 
    <p>
	  카테고리: 
	  <c:forEach var="cat" items="${categorylist}">
	    <c:if test="${cat.id == product.category_id}">
	      ${cat.name}
	    </c:if>
	  </c:forEach>
	</p>
	
    
	<div style="margin-top: 200px;">
	<strong style="font-size: 20px;">재고:</strong> ${product.stock}개<br>
    <c:choose>
    	<c:when test="${product.status == '품절'}">
    		<span style="color: red; font-size: 20px;">해당 상품은 품절입니다. </span><br>
    	</c:when>
    	<c:when test="${product.status == '숨김'}">
    		<span style="color: red; font-size: 20px;">해당 상품은 숨김상태입니다. </span><br>
    	</c:when>
    </c:choose>
	<c:set var="now" value="<%= new java.util.Date() %>" />
    <c:choose>
	    <c:when test="${product.discount_start <= now and now <= product.discount_end}">
	        <del><fmt:formatNumber value="${product.price}" pattern="#,###" />원</del> ${product.discount_percentage}%<br>
	        <strong><fmt:formatNumber value="${product.price - (product.price * product.discount_percentage / 100)}" pattern="#,###" />원</strong>
			<br>
			
		    <small class="time-left">
				data-end-time="<fmt:formatDate value='${product.discount_end}' pattern='yyyy-MM-dd\'T\'HH:mm:ss' />">
			</small> 
			<small> 남았습니다! </small>
	    </c:when>
	    <c:otherwise>
	    <div style="font-size: 30px; color:blue; ">
	        <b><fmt:formatNumber value="${product.price}" pattern="#,###" />원</b>
	    </div>
	    </c:otherwise>
	</c:choose>
	<br>
	<c:choose>
		<c:when test="${sessionScope.userType == 'seller'}">
			<input type="button"  class="btn btn-outline-secondary" style="margin-bottom:5px; margin-top: 20px;" value="수정하기" onclick="location.href='product_modify?id=${product.id}'">
			<input type="button" class="btn btn-outline-secondary" value="삭제하기" onclick="location.href='product_delete?id=${product.id}'">
		</c:when>
		<c:otherwise>
		    <c:choose>
		        <c:when test="${product.status == '품절' and sessionScope.userType == 'customer'}">
		            <input type="button" class="btn btn-secondary w-100" style="margin-top:25px;" value="구매하기" onclick="alert('⚠ 이 제품은 품절입니다!')" style="background-color: lightgray;">
		        </c:when>
		        
		        <c:otherwise>
		            <form id="orderForm" action="product_order" method="post">
					    <input type="hidden" name="product_id" value="${product.id}">
					    
					    
						    
						    
					    <!-- 수량 입력 폼 추가 -->
					    <label class="form-label mt-4">수량: </label>
					    <input type="number" class="form-control" name="quantity" value="1" min="1" max="${product.stock}" required>
					
					    <input type="submit" class="btn btn-primary w-100"   value="구매하기">
					</form>
		        </c:otherwise>
		    </c:choose>
		</c:otherwise>
	</c:choose>
	</div>
	</div>
	</div>
	<hr>
	<div class="product-container">
	<div class="product-description">
	<p>${product.description}</p>
	</div>
    </div>
	
   
</body>
</html>