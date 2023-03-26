<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- =============== BOXICONS ===============-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- ================== BOOTSTRAP ============== -->
  <link href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <!-- ================== Font Awesome ============== -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome/css/all.min.css">
  <!-- ================== Metro CDN ============== -->
  <link rel="stylesheet" href="https://cdn.metroui.org.ua/v4/css/metro-all.min.css">
  <!-- =============== CSS ===============-->
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
  <title>Added to Cart</title>
</head>
<body> 

	    <!-- include header file -->
	    <jsp:include page="../helper/header.jsp"></jsp:include>
      
      <section id="checkout-complete">
        <div class="checkout-complete-header text-center">
            <div class="rounded-circle checkmark">
               <i class="fa-solid fa-check main-color "></i>
            </div>
            <h4>
                Congratulation! You have completed payment.
            </h4>
            <p>We have recieved your order and it will be delivered in the next 3 days</p>
        </div>
        <div class="checkout-complete-summary text-center">
            <div class="item">
                <h5>Order Number</h5>
                <p>${order.orderId}</p>
            </div>
            <div class="item">
                <h5>Date</h5>
                <p>${order.orderDate}</p>
            </div>
            <div class="item">
                <h5>Total</h5>
                <p>$ ${order.total} </p>
            </div>
            <div class="item">
                <h5>Payment methods</h5>
                <p>${order.paymentMethod}</p>
            </div>
        </div>
        <button class="btn bg-main text-white rounded mt-4">Back to store</button>
    </section>
    	
      <!-- include footer file -->
	    <jsp:include page="../helper/footer.jsp"></jsp:include>
	
        <!-- =============== SCROLL UP ===============-->
        <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>
    
	      <!-- =============== MAIN JS ===============-->
	      <script src="js/showCart.js"></script>
	      <script src="../css/bootstrap/js/bootstrap.min.js"></script>
	      <script src="../js/main.js"></script>
	      <script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>
 
  </body>
</html>