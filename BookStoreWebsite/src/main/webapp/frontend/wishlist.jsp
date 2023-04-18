<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
  <!-- ================== BOOTSTRAP ============== -->
  <link href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <!-- ================== Font Awesome ============== -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome/css/all.min.css">

  <!-- =============== CSS ===============-->
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/css/book_detail.css" rel="stylesheet" type="text/css">
  <title>Added to Cart</title>
</head>
<body> 

    <!-- include header file -->
    <jsp:include page="../helper/header.jsp"></jsp:include>

    <div class="error-message hidden d-flex align-items-center gap-2">
        <i class="fav fa-heart save fa"></i>
        <span></span>
      </div>
      
    <section class=" bg-main d-flex align-items-center mb-9 ">
        <div class="container">
            <ol class="breadcrumb ondark m-0 p-2">
                <li class="breadcrumb-item">
                    <a class="text-white opacity-75" href="${pageContext.request.contextPath}">Home</a>
                </li>
                <li class="breadcrumb-item">
                    <a class="text-white opacity-75" href="${pageContext.request.contextPath}/profile/view-profile">Profile</a>
                </li>
                <li class="breadcrumb-item text-white">
                    WishList
                </li>
            </ol>
        </div>
    </section>
 
    <div class="shopping-cart-container mt-5 mb-4">
        <div class="container">
           <div class="card p-4">
                <div class="h2 card-header bg-main text-white border-bottom">
                    WishList
                </div>
                <div class="card-body">
                    <c:set var="list" value="${sessionScope['wishlist']}" />

                    <c:if test="${list.totalItems() == 0}">
                   		<div class="empty-image mt-5 text-center">
     						 <img src="${pageContext.request.contextPath}/images/31554827.jpeg" alt="Not found"
     						 	style="max-height: 150px">
						 </div>
                        <div class="row mt-5 mb-4">
                            <div class="col text-center"><h4>There's no Saved Book</h4></div>
                        </div>		
                    </c:if>

                    <c:if test="${list.totalItems() > 0}">
                        <c:forEach items="${list.getItems()}" var="item" varStatus="status">
                            <div class="item row border-bottom pb-2 mb-2">
                                <div class="item-image col-2">
                                    <img class="img-fluid" src="data:image/png;base64,${item.value.getBase64Image()}" >
                                </div>
                                <div class="item-info col-8">
                                        <div class="h2 item-title">${item.value.title}</div>
                                        <div class="p my-2 "><strong class="price h4 my-0">${item.value.price}$</strong></div>
                                        <div class="d-flex mt-3">
                                             
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
                                                     <button type="button" class="wish btn text-black me-2"><i  class="fa save fa-heart"></i> Save </button>
                                                    </div>
                                                     <input name="id" type="hidden" value="${item.value.bookId}" class="hidden_id">
                                                  </form> 
                                              </div> 
                                        </div>
                                </div>
                            </div>
                    </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <!-- include footer file -->
    <jsp:include page="../helper/footer.jsp"></jsp:include>

    <!-- =============== SCROLL UP =============== -->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>

    <!-- =============== MAIN JS =============== -->
    <script src="${pageContext.request.contextPath}/js/book_details.js"></script>

</body>
</html>