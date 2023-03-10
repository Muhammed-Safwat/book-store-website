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
    <title>Make Review</title>
 </head>
 <body>
	  <!-- include header file -->
	  <jsp:include page="../helper/header.jsp"></jsp:include>
	
	  <!-- container -->
      <div class="container mb-5">
        <div class="make-review-header d-flex justify-content-between border-bottom pt-3 pb-3 ">
            <h1>Your Review</h1>
            <p class="text-muted">
                Your public pen name is now  .${customer.firstName} <a href="">Change</a>
            </p>
        </div>
        <div class="review-body row justify-content-between pt-3">
            <div class="col-3">
                <img class="img-fluid" src="data:image/png;base64,${book.getBase64Image()}" >
            </div>
            <div class="col-8">
                <div class="book-info">
                    <div class="book-name">
                        <a href="viewbook " class="text-bold">${book.title}</a>
                        <div class="text-muted">${book.category.name }</div>
                    </div>
                    <form class="from" method="post" action="save_review">
                    	
                        <div class="starts makeRating align-items-center">
                            <input class="mt-2" name='rating' data-role="rating"
                            data-value=""
                            data-on-star-click="document.querySelector('.makeRating input').dataset['value'] = arguments[0];" 
                            data-static="false" required>
                        </div>
                        <div>
                            <textarea class="form-control mt-3" name="comment" id="" cols="30" rows="10" required placeholder="Write your review"></textarea>
                        </div>
                        <div>
                            <input class="form-control mt-3" type="text" name="headline" required placeholder="Headline for your review"/>
                        </div>
                        <div>
                        	<input type="hidden" name ="id" value="${book.bookId }">
                       	</div>
                        <div>
                            <button type="submit" class="btn btn-primary mt-3">Submit</button>
                        </div>
                    </form>
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
      <script src="../css/bootstrap/js/bootstrap.min.js"></script>
      <script src="../js/main.js"></script>
      <script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>
 
  </body>
</html>