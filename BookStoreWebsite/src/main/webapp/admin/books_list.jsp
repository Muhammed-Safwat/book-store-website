<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

 <head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
     <title>Manage books list</title>
 </head>

 <body>
     <!-- include header file -->
      <jsp:include page="../helper/header_admin.jsp"></jsp:include>

     <!--  include sub header folder  -->
     <jsp:include page="../helper/sub-header.jsp"></jsp:include>

 	<div class='container'>
     <h4 class='text-center mt-3 mb-5 h4 main-color'>
     	Manage books list 
     </h4>
	<h5 class='text-start ms-3'>
		<a href='create_book' class='main-color'>
	     	Add New Book 
	     	<i class="fa-solid fa-book"></i>
     	</a>
     </h5>
      <c:if test="${not empty requestScope.message}">
	    <h1 class="text-center">
	        ${requestScope.message}
	    </h1>
	</c:if>
     <div class="data-container">
    
    <div class="book-list">
        <div class="container">
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Index</th>
                        <th>ID</th>
                        <th>Image</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>category</th>
                        <th>Price</th>
                        <th>Last Updated</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${books}" varStatus="status">
                        <tr data-book-id="${book.bookId}">
                            <td>${status.index+1}</td>
                            <td class="book-id">${book.bookId}</td>
                            <td>
                                <img class='book-list-image' src="data:image/jpg;base64,${book.getBase64Image()}"/>
                            </td>
                            <td>${book.title}</td>
                            <td>${book.author}</td>
                            <td>${book.category.name}</td>
                            <td>${book.price}</td>
                            <td>${book.lastUpdateTime}</td>
                             
                            <td>
                                <form class='d-flex gap-1' action="" method="post">
                                    <input type="hidden" name='id' value="${book.bookId}">
                                    <a class='main-color edit-button' href="">Edit</a>
                                    |
                                    <a class='main-color delete-button' href="">Delete</a>
                                </form> 
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table> 
             <div class="pages d-flex mb-2 gap-2 align-items-center justify-content-center  mt-2">
                 <a href="page=1" class="btn bg-main text-white mr-1">1</a>
                 <a href="page=1" class="btn bg-main text-white mr-1">2</a>
                 <a href="page=1" class="btn bg-main text-white mr-1">3</a>
                 <a href="page=1" class="btn bg-main text-white mr-1">4</a>
             </div>      
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
	</div>
     <!-- include footer  -->
     <jsp:include page="../helper/footer.jsp"></jsp:include>

         <!-- =============== MAIN JS ===============-->
     <script src="../css/bootstrap/js/bootstrap.min.js"></script>
      
     <script type="module" src="../js/book_list.js"></script>
 </body>

 </html>