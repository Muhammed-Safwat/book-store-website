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
    <title>Order List</title>
</head>

<body>
		<!-- include header file -->
      <jsp:include page="../layout/header_admin.jsp"></jsp:include>

      <c:if test="${not empty requestScope.message}">
        <div class=" error-message  hidden d-flex align-items-center gap-2">
          <i class="done fa-solid fa-circle-check"></i>
          
          ${requestScope.message}
        </div>
	    </c:if>
        
 <div class="container my-5">
    <div class="card p-4">
        <div class="h2 card-header bg-main text-white justify-content-between border-bottom d-flex">
            <h5 class='text-start text-white ms-3'>
                Manage Order List
            </h5>
        </div>
        <div class="card-body">
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
                                            <form  action="" method="post" class='d-flex gap-2'>
                                                <a href="" class='detail-button book-details main-color'>Details</a>|
                                                <a href="" class='edit-button edit-book main-color'>Edit</a>|
                                                <a href="" class='delete-button delete-book main-color'>Delete</a>
                                                <input type="hidden" name="id" value="${order.orderId}">
                                            </form>
            
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                         <div class="pages d-flex mb-2 gap-2 align-items-center justify-content-center  mt-2">
                                 <a href="page=1" class="btn bg-main text-white mr-1">1</a>
                                 <a href="page=1" class="btn bg-main text-white mr-1">2</a>
                                 <a href="page=1" class="btn bg-main text-white mr-1">3</a>
                                 <a href="page=1" class="btn bg-main text-white mr-1">4</a>
                             </div> 
                    </div>
                </div>
            
                </div>
        </div>
    </div>
 </div>

    
    <!-- ==================== end order list =======================-->
    <div class="delete-user delete  event-panel none">
        <div class="box">
            <h3 class="text-white">Do you want to delete id = <span class="id">12</span></h3>
            <div class="btns row">
                <button class="ok-btn btn main-color bg-white col-3">OK</button>
                <button class="cencel-btn btn main-color bg-white col-3">Cencle</button>
            </div>
        </div>
    </div>
    <div class="overlay none">

    </div>
    <!-- include footer  -->
    <jsp:include page="../layout/footer.jsp"></jsp:include>

    <!-- =============== MAIN JS ===============-->
    <script  src="../js/notification.js"></script>
    <script type='module' src="../js/order_list.js"></script>
</body>

</html>