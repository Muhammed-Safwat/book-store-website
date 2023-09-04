<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- ================== Metro CDN ============== -->
  <link rel="stylesheet" href="https://cdn.metroui.org.ua/v4/css/metro-all.min.css">
  <!-- =============== BOXICONS ===============-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- ================== BOOTSTRAP ============== -->
  <link href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <!-- ================== Font Awesome ============== -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome/css/all.min.css">

  <!-- =============== CSS ===============-->
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/css/book_detail.css" rel="stylesheet" type="text/css">
  <title>Added to Cart</title>
</head>
<body> 

    <!-- include header file -->
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <section class="bg-warning bg-main d-flex align-items-center mb-9 ">
        <div class="container">
            <ol class="breadcrumb ondark my-3">
                <li class="breadcrumb-item">
                    <a class="text-white opacity-75" href="${pageContext.request.contextPath}">Home</a>
                </li>
                <li class="breadcrumb-item text-white">
                    Shopping Cart
                </li>
            </ol>
        </div>
    </section>
    <div class="shopping-cart-container mb-4">
        <div class="container">
           <div class="card p-4">
                <div class="h2 card-header bg-main text-white border-bottom">
                    Shopping Cart
                </div>
                <div class="card-body">
                    <c:set var="cart" value="${sessionScope['cart']}" />
                    <c:if test="${cart.totalItems() == 0}">
                         <div class="empty-image mt-5 text-center">
     						 <img src="${pageContext.request.contextPath}/images/31554827.jpeg" alt="Not found"
     						 	style="max-height: 150px"
     						 >
						 </div>
                        <div class="row">
                            <div class="col text-center"><h4>There's no items in your cart</h4></div>
                        </div>		
                    </c:if>
                    <c:if test="${cart.totalItems() > 0}">
                        <c:forEach items="${cart.getItems()}" var="item" varStatus="status">
                            <div class="item mt-2 row border-bottom pb-2">
                                <div class="item-image col-2">
                                    <img class="img-fluid" src="data:image/png;base64,${item.key.getBase64Image()}" >
                                </div>
                                <div class="item-info col-8">
                                        <div class="h5 item-title fs-5">${item.key.title}</div>
                                        <div class="p my-2 fs-6">Price:<strong class="price my-0 ms-1">${item.key.price}$</strong></div>
                                        <div class="d-flex align-items-center mt-3 mb-3">
                                            <div class="d-flex align-items-center">
                                                 
                                                <form class="update-cart-form" method="post" action="update-cart">
                                                    <input type="hidden" name="id" value="${item.key.bookId}">
                                                    
                                                        <div class="d-flex gap-2 align-items-center">
                                                            <p class="text-bold mr-2 mb-0">Quantity</p >
                                                            <div class="form-select-container d-flex gap-2 bg-main quntity-button">
                                                              <span class="buttonAction mm sub pb-1 ">-</span>
                                                              <span class="quntity pe-none">${item.value}</span>
                                                              <span class="buttonAction add">+</span>
                                                              <input type='hidden' min="1" value='${item.value}'  class="form-control quantity-form-select" name="quantity" id="quantity" required="required" style="width: 60px;"/>
                                                            </div>
                                                          </div>
                                                </form>  
                                            </div>
                                            <form action='delete-item' class="delete-cartItem-form d-flex align-items-center ms-3 " method="post">
                                            	<input  type='hidden' name='id' value="${item.key.bookId}">
                                                <a class='delete-cartItem main-color' href=''>Delete</a>
                                            </form>
                                        </div>
                                </div>
                            </div>
                    </c:forEach>
                    <div class=" d-flex justify-content-end  g-1 mb-0 fs-5">
                   		<span>Subtotal</span><span class="number-items">(${cart.getTotalQuantity()} item)</span> : <strong class="ms-1 total-price">${cart.GetTotalAmount()}$</strong> 
             		</div>
                    </c:if>
                
                
                </div>
                
            </div>
            <c:if test="${cart.totalItems() > 0}">
            <div class="cark-links mt-4 mb-4">
                <ul class="d-flex gap-2 algin-items-center justify-content-center">
                    <li><a class="text-bold main-color" href="${pageContext.request.contextPath}">Continue Shopping</a></li>
                    <li><a class="text-bold main-color" href="${pageContext.request.contextPath}/profile/checkout">Checkout</a></li>
                </ul>
            </div>
            </c:if>
        </div>
    </div>




    <!-- include footer file -->
    <jsp:include page="../layout/footer.jsp"></jsp:include>

    <!-- =============== SCROLL UP ===============-->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>

    <!-- =============== MAIN JS ===============-->
    <script type="text/javascript" src='js/update-cart.js'></script>
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/cart.js"></script>
     
</body>
</html>