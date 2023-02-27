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
  <title>Added to Cart</title>
</head>
<body> 

    <!-- include header file -->
    <jsp:include page="../helper/header.jsp"></jsp:include>

    <div class="container">
      <h3 class="text-center mb-4 mt-4">My Order History</h3>
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
                                <button type="submit" class='btn btn-denger detail-button book-details'>View Details</button>
                              </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    </div>


    <!-- include footer file -->
    <jsp:include page="../helper/footer.jsp"></jsp:include>

    <!-- =============== SCROLL UP ===============-->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>

    <!-- =============== MAIN JS ===============-->
    <script type="text/javascript" src='js/update-cart.js'></script>
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
    <script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>

</body>
</html>