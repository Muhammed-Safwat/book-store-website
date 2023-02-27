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
     <title>Manage Users</title>
 </head>

 <body>
     <!--  include header folder  -->
     <jsp:include page="../helper/header.jsp"></jsp:include>

     <!--  include sub header folder  -->
     <jsp:include page="../helper/sub-header.jsp"></jsp:include>

 	<div class='container'>
     <h1 class='text-center mb-5'>Manage books list </h1>

       <c:if test="${request.getAttribute('massage') != null}">
	     <h1 class="text-center">
	         <%=request.getAttribute("massage")%>
	     </h1>	
    </c:if>
     <h4 class='text-center mb-5'>
     	 <a href='create_book'>Create new Book</a>
     </h4>
    
    
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
                                <img src="data:image/jpg;base64,${book.getBase64Image()}"/>
                            </td>
                            <td>${book.title}</td>
                            <td>${book.author}</td>
                            <td>${book.category.name}</td>
                            <td>${book.price}</td>
                            <td>${book.lastUpdateTime}</td>
                             
                            <td>
                                <a href="" class='edit-button edit-book'>Edit</a>
                                <a href="" class='delete-button delete-book'>Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>       
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
      
     <script src="../js/edit_book.js"></script>
 </body>

 </html>