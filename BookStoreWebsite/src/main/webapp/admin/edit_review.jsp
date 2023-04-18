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
    <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <title>Edit Review</title>
  </head>
  <body> 

    <!-- include header file -->
      <jsp:include page="../helper/header_admin.jsp"></jsp:include>
    
      <c:if test="${not empty requestScope.message}">
        <div class=" error-message  hidden d-flex align-items-center gap-2">
           
          <i class="err fa-solid fa-circle-exclamation"></i>
          ${requestScope.message}
        </div>
	    </c:if>
    
    	 
    <div class="container d-flex justify-content-center mt-5 edit-review-container"> 
     <div class="row">
        <form class="form-control card shadow" action="update_review" method="post">
        	<input name='id' value='${review.reviewId}' type='hidden'/>
        	<h2 class="text-center mt-2 mb-5 main-color">Edit Review</h2>
            <div class="col-12 row mb-1">
              <span class="col-2">Book:</span>
              <strong class="col-9">${review.book.title}</strong>
            </div>
            <div class="col-12 row d-flex mb-1">
              <span class="col-2">Rating:</span>
              <span class=" col-9 review d-flex">
				<input data-role="rating" data-value="${review.rating}" data-static="true">
              </span>
          </div>
          <div class="col-12 row mb-1">
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
          <div class="col-12 row justify-content-center mt-2 mb-3">
              <div class="col-4 d-flex justify-content-center">
                <button type="submit" class="btn w-100 bg-main text-white">Save</button>
              </div>
              <div class="col-4 d-flex justify-content-center">
                <a href="list_review" class="btn w-100 bg-main text-white">Cencle</a>
              </div>
          </div>

        </form>
     </div>
    </div>


    <script  src="../js/notification.js"></script>
	<script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>
</body>

</html>