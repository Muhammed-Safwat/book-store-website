<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

 <head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- ================== Metro CDN ============== -->
 	 <link rel="stylesheet" href="https://cdn.metroui.org.ua/v4/css/metro-all.min.css">
     <!-- =============== BOXICONS ===============-->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
     <!-- ================== BOOTSTRAP ============== -->
     <link href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet"
         type="text/css">
     <!-- ================== Font Awesome ============== -->
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome/css/all.min.css">
     <!-- =============== CSS ===============-->
     <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
     <link href="${pageContext.request.contextPath}/css/user_list.css" rel="stylesheet" type="text/css">

     <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
     <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
     <title>Review List</title>
 </head>

 <body>
   <!-- include header file -->
      <jsp:include page="../helper/header_admin.jsp"></jsp:include>

   <c:if test="${not empty requestScope.message}">
	    <h1 class="text-center">
	        ${requestScope.message}
	    </h1>
	</c:if>

    
    <div class="data-container">
   <div class="book-list">
        <div class="container">
            <h3 class="main-color my-3 ">Manage Review list </h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Index</th>
                        <th>ID</th>
                        <th>Book</th>
                        <th>Rating</th>
                        <th>Headline</th>
                        <th>Customer</th>
                        <th>Comment</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="review" items="${reviews}" varStatus="status">
                        <tr data-book-id="${review.reviewId}">
                            <td>${status.index+1}</td>
                            <td class="review-id">${review.reviewId}</td>
                            <td>${review.book.title}</td>
                            <td>
	                            <div class="review d-flex">
					               <input data-role="rating"
										    data-value="${review.rating}"
										    data-static="true">
					            </div>
                            </td>
                            <td>${review.headline}</td>
                            <td>${review.customer.firstName}</td>
                            <td>${review.comment}</td>
                             
                            <td>
                                <form action="" method="post" cla>
                                    <input type="hidden" name='id' value="${review.reviewId}">
                                    <a href="" class='edit-button main-color'>Edit</a>
                                    <a href="" class='delete-button main-color'>Delete</a>
                                </form> 
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>       
        </div>
    </div>
</div>
     <div class="delete-user delete  event-panel none">
         <div class="box">
             <h3>Do you want to delete id = <span class="id">12</span></h3>
             <div class="btns row">
                 <button class="ok-btn btn btn-outline-primary col-6">OK</button>
                 <button class="cencel-btn btn btn-outline-primary col-6">Cencle</button>
             </div>
         </div>
     </div>
     <div class="overlay none">

     </div>

     <!-- include footer  -->
     <jsp:include page="../helper/footer.jsp"></jsp:include>
	 <script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>
         <!-- =============== MAIN JS ===============-->
     <script src="../css/bootstrap/js/bootstrap.min.js"></script>
      
    
     <script type="module" src="../js/review_list.js"></script>
 </body>

 </html>