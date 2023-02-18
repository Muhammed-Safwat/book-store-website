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
    <title>${book.title}</title>
  </head>
  <body> 

	  <!-- include header file -->
	  <jsp:include page="../helper/header.jsp"></jsp:include>
          
    <div class="book-details">
      <div class="container">
        <div class="boot-deteal row align-items-center">
          <div class="col-lg-4 col-md-4 col-12 mt-4 mb-4">
            <div class="book-title">${book.title}</div>
            <div class="book-author">${book.author}</div>
            <div class="book_image">
             	<img class="img-fluid" src="data:image/png;base64,${book.getBase64Image()}" >
            </div>
          </div>
          <div class="col-lg-6 col-md-6 col-12 mt-4 mb-4">
            <div class="review d-flex">
               <input data-role="rating"
							    data-value="${book.getAverageRating()}"
							    data-message="(${book.getNumberOfReviews()})"
							    data-static="true">
            </div>
            <div class="discription">${book.description}</div>
          </div>
          <div class="col-lg-2 col-md-2 col-12 mt-4 mb-4">
             <div class="book-price text-bold mb-2">${book.price}$/book</div>
             <div class="add--cart mb-2">
                <form class="cart-form" method="post" action="add_to_cart"> 
                  <div class="d-flex align-items-center mb-2">
                    <p class="text-bold mr-2">Qty:</p>
                    <div class="form-select-container">
                      <input type='number' min="1"  class="form-control quantity-form-select" name="quantity" id="quantity" required="required" style="width: 60px;"/>
                    </div>

                  </div>
                  <input id="item-id" type="hidden" name="id" value="${book.bookId}">
                  <button type="submit" class="addToCart btn btn-primary mb-2">Add To Cart</button>
                </form> 
            </div> 
              
          </div>
        </div>
        <div class="row justify-content-between">
          <div class="right-customer mt-5 mb-5 border-top border-right  col-4 pt-3">
            <p class="mt-3 h4">Review this product</p> 
            <p>Share your thoughts with other customers</p>
            <form method="post" action="profile/create_review">
              <input type="hidden" name='id' value="${book.bookId}">
              <button type="submit" class="btn btn-primary mt-4">Write A customer Review</button>
            </form>
            
          </div>
          <div class="customr-reviews col-7 mt-5 mb-5 border-top">
            <div class="h3">Top reviews</div>
          	<c:forEach var="review" items="${reviewList }">
              <div class="review border-bottom pb-3">
                <div class="customer-name row align-items-center">
                  <div class="img customer-img col-2">
                    <img src="https://images-na.ssl-images-amazon.com/images/S/amazon-avatars-global/default._CR0,0,1024,1024_SX48_.png">
                  </div>
                  <p class="col-9 text-bold customer-name">${review.customer.fullName }</p>
                </div>
                <div class="headline row align-items-center">
                  <div class="starts col-2 align-items-center">
                    <input data-role="rating"
                    data-value="${review.rating }"
                    data-static="true">
                  </div>
                  <div class="col-8 customer-headline text-bold">${review.headline }</div>
                </div>
                <div class="row">
                  <p class="text-muted">
                    ${review.reviewTime}
                  </p>
                </div>
                <div class="row">
                  <div class="comment">${review.comment}</div>
                </div>
              </div>
            </c:forEach>
            <div class="pages d-flex align-items-center justify-content-center  mt-2">
               <a href="page=1" class="btn btn-primary mr-1">1</a>
               <a href="page=1" class="btn btn-primary mr-1">2</a>
               <a href="page=1" class="btn btn-primary mr-1">3</a>
               <a href="page=1" class="btn btn-primary mr-1">4</a>
            </div>
          </div>
        </div>

        
      </div>
    </div>

    
  
	  <!-- include footer file -->
	  <jsp:include page="../helper/footer.jsp"></jsp:include>
	
      <!-- =============== SCROLL UP ===============-->
      <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>
    
      <!-- =============== MAIN JS ===============-->
      <script src='js/spicail.js'></script>
      <script src="css/bootstrap/js/bootstrap.min.js"></script>
       
      
      <script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>
 
  </body>
</html>