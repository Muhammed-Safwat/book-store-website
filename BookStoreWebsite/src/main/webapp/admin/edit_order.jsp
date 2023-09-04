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
  <link href="${pageContext.request.contextPath}/css/update_order.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
  <title>Edit Order</title>
</head>

  <body>

    <!-- include header file -->
    <jsp:include page="../layout/header_admin.jsp"></jsp:include>
    <!--  include sub header folder  -->
    <jsp:include page="../layout/sub-header.jsp"></jsp:include>
    <c:if test="${not empty requestScope.message}">
      <div class=" error-message hidden d-flex align-items-center gap-2">
        <i class="done fa-solid fa-circle-check"></i>
        ${requestScope.message}
      </div>
    </c:if>

    <div class="container my-5">   
        <div class="card rounded-0 p-4">
          <div class="h4 card-header bg-main text-white rounded-0">
            Details of Order ID: ${order.orderId}
          </div>
          <div class="card-body"> 
          <div class="h4 card-header bg-main text-white rounded-0">
            Order Overview
          </div>
          <div class="card-body container">
            <div class="">
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
                  <div class="h4 card-header bg-main text-white rounded-0">
                    Recipient Information
                  </div>
                  <div class="card-body">
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
                </div>
              </form>
            </div> 
          </div>
  
          <div class="h4 card-header bg-main text-white rounded-0">
            Ordered Books
          </div>
          <div class="card-body">
            <div class="order-books mb-5">
              <table class="table edit-table table-striped table-bordered ">
                <thead>
                  <tr>
                    <th scope="col">Index</th>
                    <th scope="col">Book Title</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Sub Total</th>
                    <th scope="col">Action</th>
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
                      <td colspan="2">
                        ${order.subtotal}
                      </td>
                  </tr>
                  <tr>
                      <td colspan="4" class="text-end">Tax</td>
                      <td></td>
                      <td colspan="2">
                        <input name="tax" class="form-control" type="number" value="${order.tax}" />
                      </td>
                  </tr>
                  <tr>
                      <td colspan="4" class="text-end">ShoppingFee</td>
                      <td></td>
                      <td colspan="2">
                        <input name="shippingFee" class="form-control" type="number" value="${order.shippingFee}" />
                      </td>
                  </tr>
                  <tr>
                      <td colspan="4" class="text-end text-bold">Total</td>
                      <td>${order.getNumberOfCopies()}</td>
                      <td colspan="2" class="text-bold">${order.total}</td>
                  </tr>
                </tbody>
              </table>
  
            </div>
          </div>
        </div>
        </div>
        <div class="row d-flex-align-items-center mt-5 mb-5 gap-3 justify-content-center">
          <div class="  col-2 bg-main btn bg-mainadd-link">
            <a class="addNewBookLink text-white" href="">Add Book</a>
          </div>
            <button type="submit" class="col-2 bg-main btn text-white submit-button">Save</button>
          <div class="col-2 bg-main btn">
            <a class="text-white submit-button" href="${pageContext.request.contextPath}/admin/list_order">Cencle</a>
          </div> 
        </div>
        
    </div>
    <!-- add book form -->
    <div class="overlay"></div>
    <div class="book-form bg-main">
      <h5 class="text-center mb-5 fw-bold">Add new Book To Order</h5>
      <form action="add_book_To_order" method="post">
        <input type="hidden" name="id" value="${order.orderId}">
        <div class="row mb-4">
          <div class="col-3 text-bold">Book Name</div>
          <div class="col-9">
            <select name="book-title" class="form-select">
            <c:forEach var='book' items='${bookList }'>
           		 <option value="${book.title}">${book.title}</option>
            </c:forEach>
            </select>
          </div>
        </div>
        <div class="row mb-5">
          <div class="col-3 text-bold">Quantity</div>
          <div class="col-9">
            <input type="number" value="1" min="1" class="form-control" name="quantity">
          </div>
        </div>
        <div class="row d-flex justify-content-center mb-3">
          <div class="col-4 ">
            <button type="submit" class="save-book-button btn bg-white main-color">Save</button>
          </div>
          <div class="col-4">
            <button class="cencel-book-button btn   bg-white main-color ">Cencle</button>
          </div>
        </div>
      </form>
    </div>

    <!-- include footer  -->
    <jsp:include page="../layout/footer.jsp"></jsp:include>

    <!-- =============== MAIN JS ===============-->
    <script src="${pageContext.request.contextPath}/js/edit_order.js"></script>
    <script  src="${pageContext.request.contextPath}/js/notification.js"></script>
    <script src="${pageContext.request.contextPath}/js/update_order.js"></script>
    
</body>

</html>