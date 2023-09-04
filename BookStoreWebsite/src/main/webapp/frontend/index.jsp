<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- ================== Font Awesome ============== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome/css/all.min.css">
    
    <!-- =============== CSS ===============-->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <title>Responsive website delivery</title>
  </head>
  <body> 

  <!-- include header file -->
  <jsp:include page="../layout/header.jsp"></jsp:include>



    <div class="new-books">
      <div class="container"> 
        <div class="month-image mt-4 mb-4">
          <img src="${pageContext.request.contextPath}/images/Bhp_Mar_2023_1500x300.jpg" alt="">
        </div>
        <div class="section--header border-bottom mb-3 d-flex align-items-center justify-between">
          <h1>New Arrivals & Global Trends</h1>
          <a href="">View more</a>
        </div>
          <div class="row new-books-list">
            <c:forEach var="book" items="${books}"> 
              <div class="col-lg-2 col-md-6 col-12">  
                <div class="product">
                  <div class="product-image">
                      <a style="height: 227px;" href="view_book?id=${book.bookId}">
                          <img class="img-fluid" src="data:image/png;base64,${book.getBase64Image()}" alt="Book_image">
                      </a>
                      <p class="product-sale">New</p>
                      <button type="button" class="btn-favourite btn-circle">
                          <i class="fa-solid fa-heart"></i>
                      </button>
                  </div>
                  <div class="product-content">
                      <div class="product-name d-flex justify-content-between align-items-center">
                          <h5 class="item-title"><a href="view_book?id=${book.bookId}">${book.title}</a></h5>
                          <a href="view_category?id=${book.category.categoryId}"><span class="badge badge-pill bg-main p-1">${book.category.name}</span></a>
                      </div>
                      <p class="text-muted text-start small ">${book.author}</p>
                      <div class="d-flex justifay-content-center">
                        <ul class="rating-stars">
                          <input data-role="rating"
                          data-value="${book.getAverageRating()}"  
                          data-static="true">
                        </ul>
                    </div>
              
                      <div class="product-content__footer">
                          <div class="product-content__footer-price">
                              <h5 class="product-price">${book.price}$</h5>
                              <span><fmt:formatNumber value="${book.price*1.2}" type="currency" currencySymbol="$" maxFractionDigits="2" /></span>
                          </div>
                      </div>
                  </div>
                </div>
              </div>
            </c:forEach>
        </div>
      </div>
    </div>
  
    <div class="best-selling">
      <div class="container"> 
        <div class="section--header border-bottom mb-3 d-flex align-items-center justify-between">
          <h1>Best Sellers of the Week</h1>
          <a href="">View more</a>
        </div>
        <div class="row best-selling">
          <c:forEach var="book" items="${bestSaling}"> 
            <div class="col-lg-2 col-md-6 col-12">  
              <div class="product">
                <div class="product-image">
                    <a style="height: 227px;" href="view_book?id=${book.bookId}">
                        <img class="img-fluid" src="data:image/png;base64,${book.getBase64Image()}" alt="Book_image">
                    </a>
                    <p class="product-sale">New</p>
                    <button type="button" class="btn-favourite btn-circle">
                        <i class="fa-solid fa-heart"></i>
                    </button>
                </div>
                <div class="product-content">
                    <div class="product-name d-flex justify-content-between align-items-center">
                        <h5 class="item-title"><a href="view_book?id=${book.bookId}">${book.title}</a></h5>
                        <a href="view_category?id=${book.category.categoryId}"><span class="badge badge-pill bg-main p-1">${book.category.name}</span></a>
                    </div>
                    <p class="text-muted text-start small ">${book.author}</p>
                    <div class="d-flex justifay-content-center">
                      <ul class="rating-stars">
                        <input data-role="rating"
                        data-value="${book.getAverageRating()}"  
                        data-static="true">
                      </ul>
                  </div>
            
                    <div class="product-content__footer">
                        <div class="product-content__footer-price">
                            <h5 class="product-price">${book.price}$</h5>
                            <span><fmt:formatNumber value="${book.price*1.2}" type="currency" currencySymbol="$" maxFractionDigits="2" /></span>
                        </div>
                         
                    </div>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
   
    <div class="most-favored">
      <div class="container"> 
         
        <div class="section--header border-bottom mb-3 d-flex align-items-center justify-between">
          <h1>Highest Rating</h1>
          <a href="">View more</a>
        </div>
        <div class="row most-favored">
          <c:forEach var="book" items="${mostfav}"> 
            <div class="col-lg-2 col-md-6 col-12">  
              <div class="product">
                <div class="product-image">
                    <a style="height: 227px;" href="view_book?id=${book.bookId}">
                        <img class="img-fluid" src="data:image/png;base64,${book.getBase64Image()}" alt="Book_image">
                    </a>
                    <p class="product-sale">New</p>
                    <button type="button" class="btn-favourite btn-circle">
                        <i class="fa-solid fa-heart"></i>
                    </button>
                </div>
                <div class="product-content">
                    <div class="product-name d-flex justify-content-between align-items-center">
                        <h5 class="item-title"><a href="view_book?id=${book.bookId}">${book.title}</a></h5>
                        <a href="view_category?id=${book.category.categoryId}"><span class="badge badge-pill bg-main p-1">${book.category.name}</span></a>
                    </div>
                    <p class="text-muted text-start small ">${book.author}</p>
                    <div class="d-flex justifay-content-center">
                      <ul class="rating-stars">
                        <input data-role="rating"
                        data-value="${book.getAverageRating()}"  
                        data-static="true">
                      </ul>
                  </div>
            
                    <div class="product-content__footer">
                        <div class="product-content__footer-price">
                            <h5 class="product-price">${book.price}$</h5>
                            <span><fmt:formatNumber value="${book.price*1.2}" type="currency" currencySymbol="$" maxFractionDigits="2" /></span>
                        </div>
                        
                    </div>
                </div>
              </div>
            </div>
            </c:forEach>
        </div>
      </div>
    </div>
	
	<!-- include footer file -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
    <!-- =============== SCROLL UP ===============-->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>
    
    <!-- =============== MAIN JS ===============-->
     
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/js/cart.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
 	  <script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>
     
   
</body>
</html>