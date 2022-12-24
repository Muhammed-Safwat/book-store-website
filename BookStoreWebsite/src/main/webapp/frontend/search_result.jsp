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
    <title>${key} Books</title>
  </head>
  <body> 

  <!-- include header file -->
  <jsp:include page="../helper/header.jsp"></jsp:include>
  
    

    <div class="new-books">
      <div class="container">  
        <h1>Result of ${key}</h1>
        <h1>${massage}</h1>   
        <div class="new-books-list">
            <c:forEach var="book" items="${books}"> 
	               <div class="book-card row align-items-center mb-5">
	                <div class="col-lg-4 col-md-4 col-12"> 
	                  <div class="book-image">
	                   <img class="img-fluid" src="data:image/png;base64,${book.getBase64Image()}" >
	                  </div>
	                </div>
	                <div class="col-lg-6 col-md-6 col-12"> 
	                  <div class="book-body">
	                    <a href="view_book?id=${book.bookId}">${book.title}</a>
	                    <p>${book.author}</p>
	                    <p>star *****</p>
	                  </div>
	                </div>
         			<div class="col-lg-2 col-md-2 col-12">
         			      <p>${book.price}$</p>
         				 <a href="">Add To Cart</a>
         			</div>
         			</div>
            </c:forEach>
        </div>
      </div>
    </div>
  
     
	
	<!-- include footer file -->
	<jsp:include page="../helper/footer.jsp"></jsp:include>
	
    <!-- =============== SCROLL UP ===============-->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>
    
    <!-- =============== MAIN JS ===============-->
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
 
</body>
</html>