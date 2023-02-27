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
  <title>Manage Users</title>
</head>

  <body>
      <!--  include header folder  -->
      <jsp:include page="../helper/header.jsp"></jsp:include>

      
      <div class="container">
     <c:if test="${request.getAttribute('massage') != null}">
        <h1 class="text-center">
            <%=request.getAttribute("massage")%>
        </h1>	
    </c:if>
      
      <h2 class="text-center mt-5">Details of Order ID: ${order.orderId}</h2>

      <div class="container">
        <div class="overview-overview order-overview mb-5">
          <h4 class="text-center mb-5">Order Overview</h4>
          <table class="table table-striped table-bordered ">
          
            <tbody>
                <tr scope="row">
                  <th>Ordered by:</th>
                  <td>${order.customer.firstName}</td>
                </tr>

                <tr>
                  <th>Order Status</th>
                  <td>${order.status}</td>
                </tr>

                <tr>
                  <th>Order Date</th>
                  <td>${order.orderDate}</td>
                </tr>

                <tr>
                  <th>Payment Method</th>
                  <td>${order.paymentMethod}</td>
                </tr>

                <tr>
                  <th>Book Copies:</th>
                  <td>${order.getNumberOfCopies()}</td>
                </tr>

                <tr>
                  <th>Total Amount:</th>
                  <td>${order.total}</td>
                </tr>
              </tbody>
            </table>
          </div>

          <div class="recipient-information  order-overview mb-5">
            <h4 class="text-center mb-5">Recipient Information</h4>
            <table class="table table-striped table-bordered ">
            
              <tbody>
                <tr>
                  <th>First Name:</th>
                  <td>${order.firstName}</td>
                </tr>
                <tr>
                  <th>Last Name:</th>
                  <td>${order.lastName}</td>
                </tr>
                <tr>
                  <th>Pecipient Phone:</th>
                  <td>${order.phone}</td>
                </tr>
                <tr>
                  <th>Address Line 1:</th>
                  <td>${order.addressLine1}</td>
                </tr>
                <tr>
                  <th>Address Line 2:</th>
                  <td>${order.addressLine2}</td>
                </tr>
                <tr>
                  <th>City</th>
                  <td>${order.city}</td>
                </tr>
                <tr>
                  <th>State</th>
                  <td>${order.state}</td>
                </tr>
                <tr>
                  <th>Country</th>
                  <td>${order.country}</td>
                </tr>
                <tr>
                  <th>Country</th>
                  <td>${order.zipcode}</td>
                </tr>
              </tbody>
            </table>
          </div>

        
        <div class="order-books mb-5">
          <h4 class='text-center mb-5'>Ordered Books</h4>
            <table class="table table-bordered ">
            <thead>
                <tr>
                <th scope="col">No</th>
                <th scope="col">Book</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${order.orderDetails}" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td>
                        <div class="row d-flex align-items-center">
                            <div class="item-image col-4">
                                <img class="img-fluid" src="data:image/png;base64,${item.book.getBase64Image()}" >
                            </div>
                            <div class="book-tilte text-bold col-8">
                                ${item.book.title}
                            </div> 
                        </div>
                    </td>
                    <td>${item.book.author}</td>
                    <td>${item.book.price}</td>
                    <td>${item.quantity}</td>
                    <td>${item.book.price*item.quantity}$ </td>
                </tr>
                </c:forEach>
                <tr>
                    <td colspan="4" class="text-end">Total</td>
                    <td>${order.getNumberOfCopies()}</td>
                    <td>${order.total}</td>
                </tr>
            </tbody>
            </table>
        </div>
 	  </div>
  </div>
    <!-- include footer  -->
    <jsp:include page="../helper/footer.jsp"></jsp:include>

    <!-- =============== MAIN JS ===============-->
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>

    <script src="../js/edit_order.js"></script>
</body>

</html>