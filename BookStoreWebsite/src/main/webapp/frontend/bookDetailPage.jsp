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
    <!-- =============== CSS ===============-->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <title>${book.title}</title>
  </head>
  <body> 

	  <!-- include header file -->
	  <jsp:include page="../helper/header.jsp"></jsp:include>
          
    <div class="book-details">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-4 col-md-4 col-12 mt-4 mb-4">
            <div class="book-title">${book.title}</div>
            <div class="book-author">${book.author}</div>
            <div class="book_image">
             	<img class="img-fluid" src="data:image/png;base64,${book.getBase64Image()}" >
            </div>
          </div>
          <div class="col-lg-6 col-md-6 col-12 mt-4 mb-4">
            <div class="review d-flex">
              <div class="rev">******</div>
              <div class="reivew_num">5</div>
            </div>
            <div class="discription">${book.description}</div>
          </div>
          <div class="col-lg-2 col-md-2 col-12 mt-4 mb-4">
             <div class="book-price">${book.price}</div> 
              <a href="add_to_cart" class="addToCart">Add To Cart</a>
          </div>
        </div>
      </div>
    </div>
    
  
	  <!-- include footer file -->
	  <jsp:include page="../helper/footer.jsp"></jsp:include>
	
      <!-- =============== SCROLL UP ===============-->
      <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>
    
      <!-- =============== MAIN JS ===============-->
      <script src="../css/bootstrap/js/bootstrap.min.js"></script>
      <script src="../js/main.js"></script>
 
  </body>
</html>