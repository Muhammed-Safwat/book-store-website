<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
 <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- =============== BOXICONS ===============-->
    <link rel="stylesheet" href="https://cdn.metroui.org.ua/v4/css/metro-all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- ================== BOOTSTRAP ============== -->
    <link href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- ================== Font Awesome ============== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome/css/all.min.css">
    <!-- =============== CSS ===============-->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <title>${key} Books</title>
  </head>
  <body> 

  <!-- include header file -->
  <jsp:include page="../layout/header.jsp"></jsp:include>
  
  <c:set var="myList" value="${books}" />
  
  <c:if test="${fn:length(myList) == 0}">
    <div class="empty-image mt-5 text-center">
      <img src="${pageContext.request.contextPath}/images/31554827.jpeg" alt="Not found">
    </div>
      <h1 class="text-center mb-3">
        NO Result for ${key}
     </h1>
  </c:if>
  
  <c:if test="${fn:length(myList) > 0}">
    <div class="new-books mt-5 mb-5">
      <div class="container">   
        <div class="new-books-list d-flex justify-content-center">
            <c:forEach var="book" items="${books}"> 
              <div class="col-lg-4 col-md-6 col-12">  
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
                          <span class="product-atc rounded-circle">
                              <button type="button" class="btn btn-circle text-muted">
                                  <i class="fa fa-shopping-cart"></i>
                              </button>
                          </span>
                      </div>
                  </div>
                </div>
              </div>
            </c:forEach>
        </div>
      </div>
    </div>
  </c:if>
     
	
	<!-- include footer file -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
    <!-- =============== SCROLL UP ===============-->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>
    
    <!-- =============== MAIN JS ===============-->
    <script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/js/cart.js"></script>
</body>
</html>