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
  <title>Added to Cart</title>
</head>
<body> 

    <!-- include header file -->
    <jsp:include page="../helper/header.jsp"></jsp:include>

    <div class="shopping-cart-container">
        <div class="container">
           <div class="card p-4">
                <div class="h2 card-header border-bottom">
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
                                <div class="item-image col-3">
                                    <img class="img-fluid" src="data:image/png;base64,${item.key.getBase64Image()}" >
                                </div>
                                <div class="item-info col-8">
                                        <div class="h2 item-title">${item.key.title}</div>
                                        <div class="p">in stock</div>
                                        <div class="d-flex mt-3">
                                            <div class="d-flex align-items-center mb-2">
                                                <p class="text-bold mr-2">Qty:</p>
                                            <form class="update-cart-form" method="post" action="update-cart">
                                                <input type="hidden" name="id" value="${item.key.bookId}">
                                                <input type ='number' value="${item.value }" 
                                                            class="update-cart form-control" name="quantity" id="quantity" style="width: 60px;"/>
                                            </form>  
                                               
                                            </div>
                                            <form action='delete-item' class="delete-cartItem-form" method="post">
                                            	<input  type='hidden' name='id' value="${item.key.bookId}">
                                                <a class='delete-cartItem' href=''>Delete</a>
                                            </form>
                                        </div>
                                </div>
                                <div class="col-1">
                                    <strong class="price">${item.key.price}$</strong>
                                </div>
                            </div>
                    </c:forEach>
                    </c:if>
                </div>
                <div class=" d-flex justify-content-end">
                    <span>Subtotal</span><span class="number-items">(${cart.getTotalQuantity()} item)</span> : <strong class="total-price">${cart.GetTotalAmount()}</strong> 
                </div>
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
    <script src="../js/main.js"></script>
    <script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>

</body>
</html>