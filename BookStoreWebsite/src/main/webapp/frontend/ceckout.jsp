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
  <link href="${pageContext.request.contextPath}/css/checkout.css" rel="stylesheet" type="text/css">
  <title>Added to Cart</title>
</head>
<body> 

    <!-- include header file -->
    <jsp:include page="../layout/header.jsp"></jsp:include>
    <c:set var="cart" value="${sessionScope['cart']}" />

    <c:if test="${cart.totalItems() == 0}">
        <div class="empty-cart">
            <img src="${pageContext.request.contextPath}/images/31554827.jpeg" alt="Not found"
			 	style="max-height: 150px">
            <div class="empty-cart__title">Your cart is empty</div>
            <div class="empty-cart__subtitle">Looks like you haven’t added any items to your cart yet.</div>
            <a href="${pageContext.request.contextPath}" class="btn bg-main text-white">Continue shopping</a>
        </div>		
    </c:if>
 
<c:if test="${cart.totalItems() > 0}">
<section class="padding-y ">
    <div class="container mt-4">
        <div class="row">
            <main class="col-xl-8 col-lg-8">
                <article class="card mt-0">
                    <div class="content-body">
                        <h5 class="card-title"> Billing details</h5>
                        <form action="place_order" method="post">

                            <div class="row">
                                <div class="col-lg-6 mb-3">
                                    <label class="form-label">First name</label>
                                    <input class="form-control" placeholder="Type here" type="text" name="firstName"   value='${customer.firstName}'  required>
                                </div>

                                <div class="col-lg-6">
                                    <label class="form-label">Last name</label>
                                    <input class="form-control" placeholder="Type here"  type="text" name="lastName" value='${customer.lastName}'   required>
                                </div>

                                <div class="col-lg-6 mb-3">
                                    <label class="form-label">Phone</label>
                                    <input class="form-control" type="text" name="phone" value='${customer.phone}'   required>
                                </div>
                                <div class="col-lg-6 mb-3">
                                    <label class="form-label">Email</label>
                                    <input type="email" class="form-control" placeholder="example@gmail.com"   name="email" value='${customer.email}'  required>
                                </div>
                            </div>

                            <label class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" value="">
                                <span class="form-check-label"> Keep me up to date on news </span>
                            </label>

                            <hr class="my-4">

                            <h5 class="card-title"> Shipping info </h5>
                            <div class="row">
                                <div class="col-sm-4 mb-3">
                                    <label for="" class="form-label">Address Line 1</label>
                                    <input type="text" class="form-control" placeholder="Type here" type="text" name="addressLine1" value='${customer.addressLine1}' required>
                                </div>
                                <div class="col-sm-4 mb-3">
                                    <label for="" class="form-label">Address Line 2</label>
                                    <input type="text" class="form-control" placeholder="Type here" type="text" name="addressLine2" value='${customer.addressLine2}' required>
                                </div>
                                <div class="col-sm-4 mb-3">
                                    <label for="" class="form-label">City*</label>
                                    <input class="form-control" type="text" placeholder="Type here" name="city" id="" value='${customer.city}' required>
                                </div>

                                <div class="col-sm-4 mb-3">
                                    <label for="" class="form-label">State</label>
                                    <input type="text" class="form-control" placeholder="Type here" type="text" name="state" value='${customer.state}' id="" required >
                                     
                                </div>

                                <div class="col-sm-4 col-6 mb-3">
                                    <label for="" class="form-label">Country</label>
                                    <input type="text" class="form-control" placeholder="Type here"  type="text" name="country"  value='${customer.country}' id="" required>
                                     
                                </div>

                                <div class="col-sm-4 col-6 mb-3">
                                    <label for="" class="form-label">Zip</label>
                                    <input type="text" class="form-control" placeholder=" Type here" type="text" name="zipcode" value='${customer.zipcode}'  id="" required>
                                </div>
                            </div>

                            <label class="form-check pb-4 border-bottom ">
                                <input class="form-check-input" type="checkbox" value="">
                                <span class="form-check-label"> Save this address </span>
                            </label>
                            <h5 class="card-title mt-2"> Chosse your payment method </h5>
                            <div class="col-sm-4 mb-4 ">
                                <select class="form-select" name="payment-method" required>
                                    <option value="Cach on delevriy">Cach on delevriy</option> 
                                    <option value="paypal">pay pal</option>    
                                </select>
                            </div>


                            <div class="mb-4">
                                <label for="" class="form-label">Message to seller</label>
                                <textarea class="form-control"  ></textarea>
                            </div>

                            <div class="float-end">
                                <a href="" class="btn bg-main text-white me-2">Cancel</a>
                                <button type="submit" class="btn bg-main text-white">Place Order</button>
                            </div>
                        </form>
                    </div>
                </article>
            </main>

            <aside class="col-xl-4 col-lg-4 bg-light">
                <article class="ms-lg-4 mt-4 mt-lg-0 summary-body" style="max-width: 320px">
                    <h5 class="card-title">Your Order</h5>

                    <dl class="dlist-align">
                        <dt>Sub Total:</dt>
                        <dd class="text-end"> 
                            <fmt:formatNumber value="${cart.GetTotalAmount()}" type="currency" currencySymbol="$" maxFractionDigits="2" /></span>
                        </dd>
                    </dl>
                    <dl class="dlist-align">
                        <dt>Tax:</dt>
                        <dd class="text-end"> ${cart.getTax()} </dd>
                    </dl>
                    <dl class="dlist-align">
                        <dt>Shopping cost:</dt>
                        <dd class="text-end">
                            <fmt:formatNumber value="${cart.getShippingFee()}" type="currency" currencySymbol="$" maxFractionDigits="2" /></span>
                             </dd>
                    </dl>
                    <dl class="dlist-align">
                        <dt>Total price:</dt>
                        <dd class="text-end">
                            <fmt:formatNumber value="${cart.getShippingFee()+cart.getTax()+cart.GetTotalAmount()}" type="currency" currencySymbol="$" maxFractionDigits="2" /></span>
                            </dd>
                    </dl>
                     
                    <div class="input-group my-4">
                        <input type="text" class="form-control" name="" placeholder="Promo code">
                        <button class="btn bg-main text-warning text-white">Apply</button>
                    </div>

                    <hr>
                    <h5 class="mb-4">Items in cart</h5>
                    <c:forEach var="item" items="${cart.getItems()}" varStatus="status">
                    <figure class="itemside align-items-center mb-4">
                        <div class="aside">
                            <b class="badge bg-main rounded-pill text-white">${item.value}</b>
                            <img class="img-fluid img-sm border" src="data:image/png;base64,${item.key.getBase64Image()}" >
                        </div>
                        <figcaption class="info">
                            <a href="" class="title main-color">${item.key.title}</a>
                            <div class="price text-muted">Price:${item.key.price*item.value}$</div>
                        </figcaption>
                    </figure>
                    </c:forEach>
                </article>
            </aside>
        </div>
        <br><br>
    </div>
</section>
</c:if>
    <!-- include footer file -->
    <jsp:include page="../layout/footer.jsp"></jsp:include>

    <!-- =============== SCROLL UP ===============-->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>

    <!-- =============== MAIN JS ===============-->
    <script type="text/javascript" src='js/update-cart.js'></script>
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
    <script src="${pageContext.request.contextPath}/js/cart.js"></script>
    <script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>

</body>
</html>