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
  <title>Added to Cart</title>
</head>
<body> 

	    <!-- include header file -->
	    <jsp:include page="../helper/header.jsp"></jsp:include>
      
      <!--Core page -->
      <div class="container">
        <div class="succssfuly-massage p-2 card flex-row d-flex justify-content-between align-items-center ">
          <div class="div d-flex justify-content-between align-items-center gap-2">
              <div class="product-image">
                <img class="img-fluid" src="data:image/png;base64,${book.getBase64Image()}" >
              </div>
              <div class="success-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                </svg>
              </div>
              <div class="success-massage h4">
                Added to Cart
              </div>
          </div>
          <div class="div border-left">
            <div class="subtotal mb-2 d-flex align-items-center">
              <p class="text-bold">Cart subtotal:</p>
              <p class="total-price">${total}$</p>
            </div>
            <div class="buy-button mb-2">
                <button class="btn btn-primary">Proceed to Buy (2 items)</button>
            </div>
            <div class="go-to-basket mb-2">
              <button class=" btn btn-success"><a href='view_cart'>Go to basket</a></button>
            </div>
            <p>For the best experience <a href='${pageContext.request.contextPath}/login-customer'>sign in to your account</a></p>
          </div>

        </div>
      </div>
    	
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