<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
  <title>Order Details</title>
</head>

  <body>
     <!-- include header file -->
      <jsp:include page="../helper/header_admin.jsp"></jsp:include>

      <div class="container my-5">
        <c:if test="${not empty requestScope.message}">
          <div class=" error-message hidden d-flex align-items-center gap-2">     
            <i class="done fa-solid fa-circle-check"></i>
            ${requestScope.message}
          </div>
        </c:if>
      <div class="container">
        <div class="card rounded-0 p-4"> 
          <div class="h4 card-header text-center bg-main text-white rounded-0">
            Details of Order ID: ${order.orderId}
          </div>
          <div class="card-body">
            <div class="overview-overview order-overview mb-5">
              <div class="h4 card-header bg-main text-white border-bottom rounded-0">
                Order Overview
              </div>
              <div class="card-body">
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
            </div>
            <div class="recipient-information  order-overview mb-5">
              <div class="h4 card-header bg-main text-white rounded-0">
                Recipient Information
              </div>
              <div class="card-body">
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
            </div>
            <div class="order-books mb-5">
              <div class="h4 card-header bg-main text-white rounded-0">
                Ordered Books
              </div>
              <div class="card-body"> 
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
                                  <div class="item-image img col-4">
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
                          <td colspan="4" class="text-end">SubTotal</td>
                          <td></td>
                          <td>${order.subtotal}</td>
                      </tr>
                      <tr>
                          <td colspan="4" class="text-end">Tax</td>
                          <td></td>
                          <td>${order.tax}</td>
                      </tr>
                      <tr>
                          <td colspan="4" class="text-end">ShoppingFee</td>
                          <td></td>
                          <td>${order.shippingFee}</td>
                      </tr>
                      <tr>
                          <td colspan="4" class="text-end text-bold">Total</td>
                          <td>${order.getNumberOfCopies()}</td>
                          <td class="text-bold">${order.total}</td>
                      </tr>
                  </tbody>
                  </table>
              </div>  
            </div>
          </div>
        </div>
 	    </div>
      </div>

    <!-- include footer  --><script  src="../js/notification.js"></script>
    <jsp:include page="../helper/footer.jsp"></jsp:include>
</body>

</html>