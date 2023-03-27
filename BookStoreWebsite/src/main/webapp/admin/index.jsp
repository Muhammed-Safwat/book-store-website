<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
    <link href="../css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    
    <!-- ================== Font Awesome ============== -->
    <link rel="stylesheet" href="../css/fontawesome/css/all.min.css">
    
    <!-- =============== CSS ===============-->
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <title>Book Store Administration</title>
  </head>
  <body> 

    <!-- include header file -->
      <jsp:include page="../helper/header_admin.jsp"></jsp:include>
     
    <!--  -->
    <jsp:include page="../helper/sub-header.jsp"></jsp:include>
   <div class=" ">
    <section class="row">
      <aside class="col-3 p-3 bg-light">
        <ul class="d-grid admin-sidebar">
          <li><a href="${pageContext.request.contextPath}/admin/" class="h5 text-white active"><i class="fa-solid fa-house"></i>Overview</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/list_book"><i class="fa-solid fa-book-bookmark"></i>Books</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/list_category"><i class="fa-solid fa-layer-group"></i>Categories</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/list_customer"><i class="fa-solid fa-user-group"></i>Customers</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/list_user"><i class="fa-solid fa-user-tie"></i>Admins</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/list_review"><i class="fa-solid fa-comments"></i>Reviews</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/list_order"><i class="fa-solid fa-bag-shopping"></i>Orders</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/create_customer"><i class="fa-solid fa-user-plus"></i>Add Customer</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/create-user"><i class="fa-solid fa-user-tie"></i>Add Admin</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/create_book"><i class="fa-solid fa-book"></i>Add Book</a></li>
          <li><a href="${pageContext.request.contextPath}/admin/create_category"><i class="fa-solid fa-chart-simple"></i>Add Category</a></li>
        </ul>
      </aside>
      <article class="col-9">
        <div class="mr-12">
        <div class="statistics bg-light">
          <div class="statistics-row row justify-content-around">
            <div class="item col-2 mb-2">
              <span class="text-bold mr-2">
                <i class="fa-solid fa-users"></i>
                Users
              </span>
              <p>${totalUsers}</p>
            </div>
            <div class="item col-2 mb-2">
              <span class="text-bold mr-2">
                <i class="fa-solid fa-book-bookmark"></i>
                Books
              </span>
             <p>${totalBooks}</p> 
            </div>
            <div class="item col-2 mb-2">
              <span class="text-bold mr-2">
                <i class="fa-solid fa-user-group"></i>
                Custoemrs
              </span>
             <p>${totalCustomers}</p> 
            </div>
            <div class="item col-2 mb-2">
              <span class="text-bold mr-2">
                <i class="fa-solid fa-comments"></i>
                Reviews
              </span>
             <p>${totalReviews}</p> 
            </div>
            <div class="item col-2 mb-2">
              <span class="text-bold mr-2">
                <i class="fa-solid fa-bag-shopping"></i>
                Orders
              </span>
              <p>${totalOrders}</p>
            </div>
          </div>
        </div>
          <div class="resent-seles"> 
            <div class="container"> 
            <div class="title text-md-center mb-2">
                <h4 class="text-bold text-start main-color my-4 ">Recent seles</h4>
            </div>
            <div class="resent-seles-table">
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
                          </tr>
                      </c:forEach>
                  </tbody>
              </table>
              </div>
            </div>
          </div>
          <div class="resent-reviews"> 
            <div class="container"> 
              
            <div class="title text-md-center mb-2">
                <h4 class="text-bold text-start main-color my-4 ">Recent reviews</h4>
            </div>
              <div class="recent-reviews-table">
                <table class="table table-bordered">
                  <thead>
                      <tr>
                          <th>Index</th>
                          <th>ID</th>
                          <th>Book</th>
                          <th>Rating</th>
                          <th>Headline</th>
                          <th>Customer</th>
                          <th>Comment</th>
                      </tr>
                  </thead>
                  <tbody>
                      <c:forEach var="review" items="${reviews}" varStatus="status">
                          <tr data-book-id="${review.reviewId}">
                              <td>${status.index+1}</td>
                              <td class="review-id">${review.reviewId}</td>
                              <td>${review.book.title}</td>
                              <td>
                                <div class="review d-flex">
                          <input data-role="rating"
                          data-value="${review.rating}"
                          data-static="true">
                        </div>
                              </td>
                              <td>${review.headline}</td>
                              <td>${review.customer.firstName}</td>
                              <td>${review.comment}</td>
                          </tr>
                      </c:forEach>
                  </tbody>
              </table> 
              </div>
            </div>
          </div>

          <div class="event-panel logout-panel none">
            <div class="box">
                <h3>Are you sure to logout</h3>
                <div class="btns row">
                    <button class="ok-btn btn btn-outline-primary col-6">OK</button>
                    <button class="cencel-btn btn btn-outline-primary col-6">Cencle</button>
                </div>
            </div>
        </div>           
      </div>
      </article>
    </section>
   </div>

	<!-- include footer file -->
	<jsp:include page="../helper/footer.jsp"></jsp:include>
	
    <!-- =============== SCROLL UP ===============-->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>
    
    <!-- =============== MAIN JS ===============-->
    <script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
  </body>
</html>