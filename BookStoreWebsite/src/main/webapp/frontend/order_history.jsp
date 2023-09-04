<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  <title>Added to Cart</title>
</head>
<body> 

    <!-- include header file -->
    <jsp:include page="../layout/header.jsp"></jsp:include>

    <section class="bg-main d-flex align-items-center mb-9 ">
        <div class="container">
            <ol class="breadcrumb ondark m-0 p-2">
                <li class="breadcrumb-item">
                    <a class="text-white opacity-75" href="${pageContext.request.contextPath}">Home</a>
                </li>
                <li class="breadcrumb-item">
                    <a class="text-white opacity-75" href="${pageContext.request.contextPath}/profile/view-profile">Profile</a>
                </li>
                <li class="breadcrumb-item text-white">
                    Order History
                </li>
            </ol>
        </div>
    </section>

    <div class="shopping-cart-container mt-5 mb-5">
        <div class="container">
           <div class="card p-4">
                <div class="h2 card-header bg-main text-white border-bottom">
                    Order History
                </div>
                <div class="card-body">
                    <c:set var="list" value="${sessionScope['wishlist']}" />
                    <c:if test="${empty orders}">
                        <div class="row">
                            <div class="col text-center"><h4>There's no Order yet</h4></div>
                        </div>		
                    </c:if>
                    <c:if test="${not empty orders}">
                        <div class="container">
                            <div class="list-templete order-history-list">
                              <div class="container">
                                  <table class="table table-striped">
                                      <thead>
                                          <tr>
                                              <th scope="col">Index</th>
                                              <th scope="col">Order ID</th>
                                              <th scope="col">Quantity</th>
                                              <th scope="col-2">Total Amount</th>
                                              <th scope="col-2">Order Date</th>
                                              <th scope="col-2">Status</th>
                                              <th scope="col-2">Action</th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                          <c:forEach var="order" items="${orders}" varStatus="status">
                                              <tr data-order-id="${order.orderId}">
                                                  <td>${status.index+1}</td>
                                                  <td class="book-id order-id">${order.orderId}</td>
                                                  <td>${order.getNumberOfCopies()}</td>
                                                  <td>${order.total}$</td>
                                                  <td>${order.orderDate}</td>
                                                  <td>${order.status}</td>
                                                  <td>
                                                    <form method="post" action="${pageContext.request.contextPath}/profile/order_detail">
                                                      <input type="hidden" name="id" value="${order.orderId}">
                                                      <button type="submit" class='btn  bg-main text-white  detail-button book-details'>View Details</button>
                                                    </form>
                                                  </td>
                                              </tr>
                                          </c:forEach>
                                      </tbody>
                                  </table>
                              </div>
                          </div>
                          </div>
                    </c:if>
                </div>
           </div>
        </div>
    </div>

    <!-- include footer file -->
    <jsp:include page="../layout/footer.jsp"></jsp:include>

    <!-- =============== SCROLL UP ===============-->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>

    <!-- =============== MAIN JS ===============-->
    <script type="text/javascript" src='js/update-cart.js'></script>
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
    <script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/cart.js"></script>
</body>
</html>