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
    <title>Responsive website delivery</title>
  </head>
  <body> 

  <!-- include header file -->
  <jsp:include page="../helper/header.jsp"></jsp:include>
  
 
     <div class="categories">
		  <div class="container">
		    <ul class="list d-flex align-items-center justify-content-between">
		     <c:forEach var="category" items="${categories}">
		      <li><a href='view_category?id=${category.categoryId}'>${category.name}</a></li>
		     </c:forEach>
		    </ul>
		  </div>
	</div>

    <div class="new-books">
      <div class="container"> 
        <h1>new book</h1>
        <div class="row new-books-list">
            <c:forEach var="book" items="${books}"> 
	            <div class="col-lg-4 col-md-6 col-12">
	                <div class="card book-card">
	                  <div class="book-image">
	                   <img class="img-fluid" src="data:image/png;base64,${book.getBase64Image()}" >
	                  </div>
	                  <div class="book-body">
	                    <a href="view_book?id=${book.bookId}">${book.title}</a>
	                    <p>${book.author}</p>
	                    
	                    <input data-role="rating"
							    data-value="${book.getAverageRating()}"  
							    data-static="true">
	                    <p>${book.price}$</p>
	                  </div>
	                </div>
	            </div>
            </c:forEach>
        </div>
      </div>
    </div>
  
    <div class="best-selling">
      <div class="container"> 
        <h1>best selling</h1>
        <div class="row best-selling">
          <c:forEach var="book" items="${bestSaling}"> 
            <div class="col-lg-4 col-md-6 col-12">
                <div class="card book-card">
                  <div class="book-image">
                   <img class="img-fluid" src="data:image/png;base64,${book.getBase64Image()}" >
                  </div>
                  <div class="book-body">
                    <a href="view_book?id=${book.bookId}">${book.title}</a>
                    <p>${book.author}</p>
                    
                    <input data-role="rating"
                data-value="${book.getAverageRating()}"  
                data-static="true">
                    <p>${book.price}$</p>
                  </div>
                </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
   
    <div class="most-favored">
      <div class="container"> 
        <h1>most favored</h1>
        <div class="row most-favored">
          <c:forEach var="book" items="${mostfav}"> 
	            <div class="col-lg-4 col-md-6 col-12">
	                <div class="card book-card">
	                  <div class="book-image">
	                   <img class="img-fluid" src="data:image/png;base64,${book.getBase64Image()}" >
	                  </div>
	                  <div class="book-body">
	                    <a href="view_book?id=${book.bookId}">${book.title}</a>
	                    <p>${book.author}</p>
	                    
	                    <input data-role="rating"
							    data-value="${book.getAverageRating()}"  
							    data-static="true">
	                    <p>${book.price}$</p>
	                  </div>
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
 	<script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>
</body>
</html>