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
  <link href="${pageContext.request.contextPath}/css/update_order.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
  <title>Manage Users</title>
</head>

  <body>
      <!-- include header file -->
      <jsp:include page="../helper/header_admin.jsp"></jsp:include>
      <!--  include sub header folder  -->
      <jsp:include page="../helper/sub-header.jsp"></jsp:include>

      
      <div class="container">
     <c:if test="${not empty requestScope.message}">
	    <h1 class="text-center">
	        ${requestScope.message}
	    </h1>
	</c:if>
      
      <h2 class="text-center">Details of Order ID: ${order.orderId}</h2>
      <h4 class="text-center mb-5">Order Overview</h4>
      <div class="container">
        <form class="update-order-from" action="update_order" method="post">
          <input type="hidden" name="orderId" value="${order.orderId}">        
        <div class="table-overview order-overview mb-5">
          <table class="table   table-bordered ">
            <tbody>
                <tr>
                  <th>Ordered by:</th>
                  <td>${order.customer.firstName}</td>
                </tr>
                <tr>
                  <th>Order Date</th>
                  <td>${order.orderDate}</td>
                </tr>  
                <tr>
                  <th>Payment Method</th>
                  <td>
                    <select class="form-select" name="payment-method" required>
                      <option <c:if test="${order.paymentMethod eq 'Cach on delevriy' }">selected='selected'</c:if> value="Cach on delevriy">Cach on delevriy</option> 
                      <option <c:if test="${order.paymentMethod eq 'paypal' }">selected='selected'</c:if> value="paypal">pay pal</option>    
                  	</select>
                  </td>
                </tr>
                <tr>
                  <th>Order Status</th>
                  <td> 
                      <select class='form-select' name="order-status">
                      <option value="Processing" <c:if test="${order.status eq 'Processing' }">selected='selected'</c:if> >Processing</option>
                      <option value="Shipping" <c:if test="${order.status eq 'Shipping' }">selected='selected'</c:if>>Shipping</option>
                      <option value="Delivered" <c:if test="${order.status eq 'Delivered' }">selected='selected'</c:if>>Delivered</option>
                      <option value="Completed" <c:if test="${order.status eq 'Completed' }">selected='selected'</c:if>>Completed</option>
                      <option value="Cancelled" <c:if test="${order.status eq 'Cancelled' }">selected='selected'</c:if>>Cancelled</option>
                    </select>
                </td>
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
	              <td>
	                  <input class="form-control" type="text" name="firstName" value="${order.firstName}" required>
	              </td>
	            </tr>
              <tr>
	              <th>Last Name:</th>
	              <td>
	                  <input class="form-control" type="text" name="lastName" value="${order.lastName}" required>
	              </td>
	            </tr>

	            <tr>
	              <th>Pecipient Phone:</th>
	              <td>
	                <input class="form-control" type="text" name="phone" value="${order.phone}" required>
	              </td>
	            </tr>
              <tr>
	              <th>Address Line 1:</th>
	              <td>
	                  <input class="form-control" type="text" name="addressLine1" value="${order.addressLine1}" required>
	              </td>
	            </tr>
              <tr>
	              <th>Address Line 2:</th>
	              <td>
	                  <input class="form-control" type="text" name="addressLine2" value="${order.addressLine1}" required>
	              </td>
	            </tr>
	            <tr>
	              <th>City :</th>
	              <td>
	                <input class="form-control" type="text" name="city" value="${order.city}" required>
	              </td>
	            </tr>
              <tr>
	              <th>State :</th>
	              <td>
	                <input class="form-control" type="text" name="state" value="${order.state}" required>
	              </td>
	            </tr>
              <tr>
	              <th>Zipcode :</th>
	              <td>
	                <input class="form-control" type="text" name="zipcode" value="${order.zipcode}" required>
	              </td>
	            </tr>
              <tr>
	              <th>Country :</th>
	              <td>
	                <input class="form-control" type="text" name="country" value="${order.country}" required>
	              </td>
	            </tr>
	          </tbody>
        </table>
        </div>
      </form>
      </div> 

        <div class="order-books mb-5">
          <table class="table edit-table table-striped table-bordered ">
            <h4 class='text-center mb-5'>Ordered Books</h4>
            <thead>
              <tr>
                <th scope="col">Index</th>
                <th scope="col">Book Title</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Sub Total</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach var="orderBook" items="${order.orderDetails}" varStatus="status">
                <tr>
                  <td>${status.index+1}</td>
                  <td>${orderBook.book.title}</td>
                  <td>${orderBook.book.author}</td>
                  <td>${orderBook.book.price}</td>
                  <td class='quantities'>
                    <form method="POST" action="update_book_in_order">
                      <input type="hidden" name="orderId" value="${order.orderId}"/>
                      <input type="hidden" name="bookId" value="${orderBook.book.bookId}"/>
                      <input type="number" name="quantity" min="1" class="book-quantity form-control" value="${orderBook.quantity}">
                    </form>
                  </td>
                  <td>${orderBook.subtotal}</td>
                  <td class='book-data'>
                    <form method="POST" action="remove_book_from_order">
                      <input type="hidden" name="orderId" value="${order.orderId}"/>
                      <input type="hidden" name="bookId" value="${orderBook.book.bookId}"/>
                      <a class="remove-link" href=''>Remove</a>
                    </form>
                  </td>
                </tr>
              </c:forEach>
                <tr>
                  <td colspan="4" class="text-end">SubTotal</td>
                  <td></td>
                  <td>
                    ${order.subtotal}
                  </td>
              </tr>
              <tr>
                  <td colspan="4" class="text-end">Tax</td>
                  <td></td>
                  <td>
                    <input name="tax" class="form-control" type="number" value="${order.tax}" />
                  </td>
              </tr>
              <tr>
                  <td colspan="4" class="text-end">ShoppingFee</td>
                  <td></td>
                  <td>
                    <input name="shippingFee" class="form-control" type="number" value="${order.shippingFee}" />
                  </td>
              </tr>
              <tr>
                  <td colspan="4" class="text-end text-bold">Total</td>
                  <td>${order.getNumberOfCopies()}</td>
                  <td class="text-bold">${order.total}</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="add-link">
          <a class="addNewBookLink" href="">Add Book</a>
        </div>
        <div class="row d-flex-align-items-center mt-5 mb-5 justifay-content-center">
          <div class="col-6">
            <button type="submit" class="submit-button btn btn-primary">Save</button>
          </div> 
          <div class="col-6">
            <a class="btn btn-primary submit-button" href="${pageContext.request.contextPath}/admin/list_order">Cencle</a>
          </div> 
        </div>

      </div>
    </div>
    <!-- add book form -->
    <div class="overlay"></div>
    <div class="book-form">
      <h5 class="text-center mb-4">Add new Book To Order</h5>
      <form action="add_book_To_order" method="post">
        <input type="hidden" name="id" value="${order.orderId}">
        <div class="row mb-4">
          <div class="col-4 text-bold">Book Name</div>
          <div class="col-8">
            <select name="book-title" class="form-select">
            <c:forEach var='book' items='${bookList }'>
           		 <option value="${book.title}">${book.title}</option>
            </c:forEach>
            </select>
          </div>
        </div>
        <div class="row mb-4">
          <div class="col-4 text-bold">Quantity</div>
          <div class="col-8">
            <input type="number" value="1" min="1" class="form-control" name="quantity">
          </div>
        </div>
        <div class="row">
          <div class="col-6">
            <button type="submit" class="save-book-button btn btn-primary mt-4">Save</button>
          </div>
          <div class="col-6">
            <button class="cencel-book-button btn btn-primary mt-4">Cencle</button>
          </div>
        </div>
      </form>
    </div>

    <!-- include footer  -->
    <jsp:include page="../helper/footer.jsp"></jsp:include>

    <!-- =============== MAIN JS ===============-->
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/update_order.js"></script>
    <script src="../js/edit_order.js"></script>
</body>

</html>