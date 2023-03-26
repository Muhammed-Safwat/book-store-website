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
    <title>Manage Users</title>
</head>

<body>
		<!-- include header file -->
      <jsp:include page="../helper/header_admin.jsp"></jsp:include>

 

<h1 class="text-center">Manage Order List </h1>

    <c:if test="${not empty requestScope.message}">
	    <h1 class="text-center">
	        ${requestScope.message}
	    </h1>
	</c:if>
        
    <!-- ==================== start order list =======================-->
    <div class="data-container"> 
    <div class="list-templete book-list order-list">
        <div class="container">
            <table class="table table-striped">
                <thead class="thead-dark table-striped table-bordered table-hover ">
                    <tr>
                        <th scope="col">Index</th>
                        <th scope="col">Order ID</th>
                        <th scope="col">Ordered by</th>
                        <th scope="col">Book Copies</th>
                        <th scope="col">Total</th>
                        <th scope="col">Payment Method</th>
                        <th scope="col">Status</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}" varStatus="status">
                        <tr data-order-id="${order.orderId}">
                            <td>${status.index+1}</td>
                            <td class="book-id order-id">${order.orderId}</td>
                            <td>${order.customer.firstName}</td>
                            <td>${order.getNumberOfCopies()}</td>
                            <td>${order.total}</td>
                            <td>${order.paymentMethod}</td>
                            <td>${order.status}</td>
                            <td>${order.orderDate}</td>
                            <td class="actions-row">
                                <form  action="" method="post">
                                    <a href="" class='detail-button book-details'>Details</a>
                                    <a href="" class='edit-button edit-book'>Edit</a>
                                    <a href="" class='delete-button delete-book'>Delete</a>
                                    <input type="hidden" name="id" value="${order.orderId}">
                                </form>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>
    <!-- ==================== end order list =======================-->
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
    <!-- include footer  -->
    <jsp:include page="../helper/footer.jsp"></jsp:include>

    <!-- =============== MAIN JS ===============-->
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>

    <script type='module' src="../js/order_list.js"></script>
</body>

</html>