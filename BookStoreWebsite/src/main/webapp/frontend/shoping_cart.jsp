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
  <title>Added to Cart</title>
</head>
<body> 

    <!-- include header file -->
    <jsp:include page="../helper/header.jsp"></jsp:include>
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
    <div class="shopping-cart-container">
        <div class="container">
           <div class="card p-4">
                <div class="h2 card-header bg-main text-white border-bottom">
                    Shopping Cart
                </div>
                <div class="card-body">
                    <c:set var="cart" value="${sessionScope['cart']}" />

                    <c:if test="${cart.totalItems() == 0}">
                        <div class="row">
                            <div class="col text-center"><h4>There's no items in your cart</h4></div>
                        </div>		
                    </c:if>

                    <c:if test="${cart.totalItems() > 0}">
                        <c:forEach items="${cart.getItems()}" var="item" varStatus="status">
                            <div class="item row border-bottom pb-2">
                                <div class="item-image col-2">
                                    <img class="img-fluid" src="data:image/png;base64,${item.key.getBase64Image()}" >
                                </div>
                                <div class="item-info col-8">
                                        <div class="h2 item-title">${item.key.title}</div>
                                        <div class="p my-2 "><strong class="price h4 my-0">${item.key.price*item.value}$</strong></div>
                                        <div class="d-flex mt-3">
                                            <div class="d-flex align-items-center mb-2">
                                                <p class="text-bold mr-2 mb-0">Quantity:</p>
                                                <form class="update-cart-form" method="post" action="update-cart">
                                                    <input type="hidden" name="id" value="${item.key.bookId}">
                                                    <input type ='number' value="${item.value}" 
                                                        class="update-cart form-control" name="quantity" id="quantity" style="width: 60px;"/>
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
                    </c:if>
                </div>
                <div class=" d-flex justify-content-end h5 mb-0">
                    <span>Subtotal</span><span class="number-items">(${cart.getTotalQuantity()} item)</span> : <strong class="total-price">${cart.GetTotalAmount()}$</strong> 
                </div>
            </div>
            <div class="cark-links mt-4 mb-4">
                <ul class="d-flex gap-2 algin-items-center justify-content-center">
                    <li><a class="text-bold main-color" href="${pageContext.request.contextPath}">Continue Shopping</a></li>
                    <li><a class="text-bold main-color" href="${pageContext.request.contextPath}/profile/checkout">Checkout</a></li>
                </ul>
            </div>
        </div>
    </div>




    <!-- include footer file -->
    <jsp:include page="../helper/footer.jsp"></jsp:include>

    <!-- =============== SCROLL UP ===============-->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>

    <!-- =============== MAIN JS ===============-->
    <script type="text/javascript" src='js/update-cart.js'></script>
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>
 

</body>
</html>