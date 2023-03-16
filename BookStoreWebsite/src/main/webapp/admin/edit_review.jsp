<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
    <link href="../css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    
    <!-- ================== Font Awesome ============== -->
    <link rel="stylesheet" href="../css/fontawesome/css/all.min.css">
    
    <!-- =============== CSS ===============-->
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <title>Responsive website delivery</title>
  </head>
  <body> 

    <!--  -->
    <jsp:include page="../helper/header.jsp"></jsp:include>
    
    <c:if test="${not empty requestScope.message}">
	    <h1 class="text-center">
	        ${requestScope.message}
	    </h1>
	</c:if>
    
    	 
    <div class="container d-flex justify-content-center mt-5 edit-review-container"> 
     <div class="row">
        <form class="form-control" action="update_review" method="post">
        	<input name='id' value='${review.reviewId}' type='hidden'/>
        	<h1 class="text-center mt-2 mb-5">Edit Review</h1>
            <div class="col-12 row mb-3">
              <span class="col-3">Book:</span>
              <strong class="col-9">${review.book.title}</strong>
            </div>
            <div class="col-12 row d-flex mb-3">
              <span class="col-3">Rating:</span>
              <span class=" col-9 review d-flex">
				<input data-role="rating" data-value="${review.rating}" data-static="true">
              </span>
          </div>
          <div class="col-12 row mb-3">
            <span class="col-3">Customer:</span>
            <strong class="col-9">${review.customer.firstName }</strong>
          </div>
          <div class="col-12">
            <label for="headline" class="">Headline</label>
            <input type="text" id="headline" name='headline' class="headline form-control" value="${review.headline }">
          </div>
          <div class="col-12">
            <label for="comment" class="">Comment</label>
            <textarea type="text" name='comment' id="comment" class="comment form-control">${review.comment }</textarea>
          </div>
          <div class="col row justify-content-center mt-3 mb-3">
              <div class="col d-flex justify-content-center">
                <button type="submit" class="btn btn-primary">Save</button>
              </div>
              <div class="col d-flex justify-content-center">
                <a href="list_review" class="btn btn-primary">Cencle</a>
              </div>
          </div>

        </form>
     </div>
    </div>


	
	<script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>
</body>

</html>