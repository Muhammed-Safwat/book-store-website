<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
 <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ================== Metro CDN ============== -->
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
    <link href="${pageContext.request.contextPath}/css/book_detail.css" rel="stylesheet" type="text/css">
    <title>${book.title}</title>
  </head>
  <body> 
    <!-- include header file -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <div class="error-message hidden d-flex align-items-center gap-2">
    </div>
    <section class=" bg-main d-flex align-items-center mb-9 ">
      <div class="container">
            <ol class="breadcrumb ondark m-0 p-2">
                <li class="breadcrumb-item">
                    <a class="text-white opacity-75" href="${pageContext.request.contextPath}">Home</a>
                </li>
                <li class="breadcrumb-item">
                    <a class="text-white opacity-75" href="${pageContext.request.contextPath}/view_category?id=${category.categoryId}">${book.category.name}</a>
                </li>
                <li class="breadcrumb-item text-white">
                    ${book.title}
                </li>
            </ol>
      </div>
    </section>
    <section class="padding-y">
        <div class="container shopping-cart-container">
            <div class="row mt-5">
                <aside class="col-lg-4">
                  <img class="img-fluid book-image" src="data:image/png;base64,${book.getBase64Image()}" >
                </aside>
                <main class="col-lg-6">
                    <article class="ps-lg-3 border-bottom">
                        <h4 class="title text-dark">
                            ${book.title}
                        </h4>
                        <div class="rating-wrap d-flex gap-1 my-1">
                          <ul class="rating-stars">
                            <input data-role="rating"
                            data-value="${book.getAverageRating()}"  
                            data-static="true">
                          </ul>
                          <span class="mr-2 text-muted">(${book.getAverageRating()})</span>
                            <span class="label-rating main-color">
                                <i class="fa fa-shopping-basket"></i>
                            </span>
                            <span class="ml-1 mr-3 label-rating main-color">In stock</span>
                        </div>
                        <div class="mb-1 d-flex">
                            <span class="price h5">${book.price}$</span>
                            <span class="text-muted price-lable">/per book</span>
                        </div>
                        <div class="mb-1 d-flex">
                          <span class="sub-head">Author:</span>
                          <span class="sub-p">${book.author}</span>
                        </div>   
                        <div class="mb-1 d-flex">
                            <span class="sub-head">Category:</span>
                            <span class="sub-p ">${book.category.name}</span>
                        </div> 
                        <div class="mb-3 d-flex"> 
                          <span class="sub-head">
                            Description:
                          </span> 
                          <span class="sub-p">${book.description}</span> 
                        </div>
                    </article>
                    <c:set var="list" value="${sessionScope['wishlist']}" />
                    <article class="d-flex mt-3 pb-3">
                        <div class="add--cart mb-2">
                          <form class="cart-form " method="post" action="add_to_cart"> 
                            <div class="d-flex gap-2 align-items-center mb-4">
                              <p class="text-bold mr-2 mb-0">Quantity</p >
                              <div class="form-select-container d-flex gap-2 bg-main quntity-button">
                                <span class="mm sub pb-1 ">-</span>
                                <span class="quntity pe-none">1</span>
                                <span class="add">+</span>
                                <input type='hidden' min="1" value='1'  class="form-control quantity-form-select" name="quantity" id="quantity" required="required" style="width: 60px;"/>
                              </div>
                            </div>
                            <div class="d-flex gap-3 align-items-center ">
                              <button type="submit" class="addToCart btn text-white bg-main"><i class="fa fa-shopping-basket"></i> Add To Cart</button>
                              <c:if test="${isFav}">
                                <button type="button" class="wish btn text-black me-2"><i  class="fa save fa-heart"></i> Save </button>
                          </c:if>
                          <c:if test="${!isFav}">
                              <div class="row">
                                  <button type="button" class="wish btn text-black me-2"><i  class="fa-regular fa-heart"></i> Save </button>
                              </div>		
                          </c:if>
                            </div>
                            <input name="id" type="hidden" value="${book.bookId}" class="hidden_id">
                          </form> 
                      </div> 
                    </article>
                </main>
            </div>
        </div>
    </section>      
    <div class="container mt-7 mt-4 border-top"> 
      <div class="row d-flex align-items-start justify-content-between">
        <div class="right-customer mb-5 col-4">
          <p class="mt-3 h4 text-bold sub-p">Review this Book</p> 
          <p class="text-muted">Share your thoughts with other customers</p>
          <form method="post" action="profile/create_review">
            <input type="hidden" name='id' value="${book.bookId}">
            <button type="submit" class="btn bg-main text-white mt-1">Write A customer Review</button>
          </form>
        </div>
      <c:set var="myList" value="${reviewList}" />
        <c:if test="${fn:length(myList) > 0}">
          <div class="customr-reviews col-7 mt-5 mb-5">  
            <c:forEach var="review" items="${reviewList }">
              <div class="review border-bottom pb-3 mb-5">
                <div class="customer-name d-flex gap-1 align-items-center">
                  <div class="img customer-img">
                    <img src="https://images-na.ssl-images-amazon.com/images/S/amazon-avatars-global/default._CR0,0,1024,1024_SX48_.png">
                  </div>
                  <p class="col-9 text-bold p-0 pl-0 m-0 customer-name">${review.customer.firstName}</p>
                </div>
                <div class="headline d-flex gap-5 align-items-center">
                  <div class="starts col-2 align-items-center">
                    <input data-role="rating"
                    data-value="${review.rating }"
                    data-static="true">
                  </div>
                  <div class="col-8 customer-headline text-bold">${review.headline}</div>
                </div>
                <div class="row">
                  <p class="text-muted">
                    Reviewed ${review.reviewTime}
                  </p>
                </div>
                <div class="row">
                  <div class="comment">${review.comment}</div>
                </div>
              </div>
            </c:forEach>

            <div class="pages d-flex mb-2 gap-2 align-items-center justify-content-center  mt-2">
              <a href="page=1" class="btn bg-main text-white mr-1">1</a>
              <a href="page=1" class="btn bg-main text-white mr-1">2</a>
              <a href="page=1" class="btn bg-main text-white mr-1">3</a>
              <a href="page=1" class="btn bg-main text-white mr-1">4</a>
            </div>
            
          </div>
        </c:if>
        <c:if test="${fn:length(myList) == 0}">
          <div class="customr-reviews text-cneter display-5 text-muted col-7 mt-5 mb-5">
            NO Reivews Yet
          </div>
        </c:if>
      </div>
      <c:set var="myList" value="${books}"/>
      <c:if test="${fn:length(myList) > 1}">
        <div class="row my-5 position-relative"> 
          <div class="title text-md-center mb-2">
              <h3 class="display-4 text-dark mt-1 section-title">Related Books</h3>
        </div>
      <div class="d-flex mt-5 mb-5 gap-2 align-itmes-center justify-content-center">
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
                      <a href="view_category?id=${book.category.categoryId}"><span class="badge badge-pill bg-main text-white p-1">${book.category.name}</span></a>
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
      </c:if> 
    </div>
    <!-- include footer file -->
    <jsp:include page="../layout/footer.jsp"></jsp:include>
    <!-- =============== SCROLL UP ===============-->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>
    <!-- =============== MAIN JS ===============-->
    <script src='js/spicail.js'></script>
    <script src="css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/cart.js"></script>
    <script src="${pageContext.request.contextPath}/js/book_details.js"></script>
    <script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>
  </body>
</html>