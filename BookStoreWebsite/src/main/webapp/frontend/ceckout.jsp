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

        <div class="d-flex align-items-center  justify-content-center mb-5">
            <h3>Review Your Order Details <a href="">Edit</a></h3>
            
        </div>

        <div class="order-books mb-5">
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
                <c:forEach var="item" items="${cart.getItems()}" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td>
                        <div class="row d-flex align-items-center">
                            <div class="item-image col-4">
                                <img class="img-fluid" src="data:image/png;base64,${item.key.getBase64Image()}" >
                            </div>
                            <div class="book-tilte text-bold col-8">
                                ${item.key.title}
                            </div> 
                        </div>
                    </td>
                    <td>${item.key.author}</td>
                    <td>${item.key.price}</td>
                    <td>${item.value}</td>
                    <td>${item.key.price*item.value}$ </td>
                </tr>
                </c:forEach>
                <tr>
                    <td colspan="4" class="text-end">Total</td>
                    <td>${cart.getTotalQuantity()} </td>
                    <td>${cart.GetTotalAmount()}</td>
                </tr>
            </tbody>
            </table>
        </div>
        
        <div class="shopping-information">
            <h3 class="text-center mb-4">Your Shopping Information</h3>
        </div>

        <div class="information-form d-flex justify-content-center mt-5 mb-5">
            <form action="place_order" method="post">
                <div class="row">
                    
                    <div class="col-6">First Name</div>  
                    <div class="col-6">
                        <input class="form-control" type="text" name="firstName"   value='${customer.firstName}' id="" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">Last Name</div>
                    <div class="col-6">
                        <input class="form-control" type="text" name="lastName" value='${customer.lastName}' id="" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">Recipient Phone</div>
                    <div class="col-6">
                        <input class="form-control" type="text" name="phone" value='${customer.phone}' id="" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">Recipient Address Line1</div>
                    <div class="col-6">
                        <input class="form-control" type="text" name="addressLine1" value='${customer.addressLine1}' id="" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">Recipient Address Line2</div>
                    <div class="col-6">
                        <input class="form-control" type="text" name="addressLine2" value='${customer.addressLine2}' id="" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">City</div>
                    <div class="col-6">
                        <input class="form-control" type="text" name="city" id="" value='${customer.city}' required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">State</div>
                    <div class="col-6">
                        <input class="form-control" type="text" name="state" value='${customer.state}' id="" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">Country</div>
                    <div class="col-6">
                        <input class="form-control" type="text" name="country"  value='${customer.country}' id="" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">Zip Code</div>
                    <div class="col-6">
                        <input class="form-control" type="text" name="zipcode" value='${customer.zipcode}'  id="" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        Chosse your payment method
                    </div>
                    <div class="col-6">
                        <select class="form-select" name="payment-method" required>
                            <option value="Cach on delevriy">Cach on delevriy</option> 
                            <option value="paypal">pay pal</option>    
                        </select>
                    </div>
                </div>
                <!-- div class="row">
                    <div class="col-6">
                        Order Status
                    </div>
                      <div class="col-6">
                        <select class='form-select' name="order-status">
                            <option value="Processing" >Processing</option>
                            <option value="Shipping">Shipping</option>
                            <option value="Delivered">Delivered</option>
                            <option value="Completed">Completed</option>
                            <option value="Cancelled">Cancelled</option>
                          </select>
                    </div-->
                </div>

                <div class="row mt-4">
                    <div class="col-6">
                        <button type="submit" class="btn btn-primary">Place Order</button>
                    </div>
                    <div class="col-6">
                        <a href="" >Countinue Shopping</a>
                    </div>
                </div>
            </form>
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