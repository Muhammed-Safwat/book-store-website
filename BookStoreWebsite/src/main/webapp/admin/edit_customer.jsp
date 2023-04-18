<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">

      <!-- ================== BOOTSTRAP ============== -->
      <link href="../css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

      <!-- ================== Font Awesome ============== -->
      <link rel="stylesheet" href="../css/fontawesome/css/all.min.css">

      <!-- =============== CSS ===============-->
      <link href="../css/style.css" rel="stylesheet" type="text/css">
      <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
      <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
      <title>Edit Customer</title>
    </head>

    <body>
     <!-- include header file -->
      <jsp:include page="../helper/header_admin.jsp"></jsp:include>

      <!-- core page  -->
      <h1 class="text-center mb-2 mt-5 main-color">Edit Customer</h1>
     
      <c:if test="${not empty requestScope.message}">
        <div class=" error-message hidden d-flex align-items-center gap-2">
          
          <i class="err fa-solid fa-circle-exclamation"></i>
          ${requestScope.message}
        </div>
	    </c:if>
     
      <div class="create-book pt-5 pb-5">
        <div class="container">
          <form action="update_customer" method='post' class="create-user-form row">
         	 <input type="hidden" name='id' value="${customer.customerId}">
            <div class="input-row col-6 mb-3">
              <label for="email">E-mail</label>
              <input type="email" id="email" name="email" 
              				value="${customer.email}"  class="form-control" required>
            </div>

            <div class="input-row col-6 mb-3">
              <label for="firstName">First Name</label>
              <input type="text" id="firstName" name="firstName" 
              			value="${customer.firstName}" class="form-control" required>
            </div>

            <div class="input-row col-6 mb-3">
              <label for="lastName">Last Name</label>
              <input type="text" id="lastName" name="lastName" 
              			value="${customer.lastName}" class="form-control" required>
            </div>

            <div class="input-row col-6 mb-3">
              <label for="password">Password</label>
              <input type="password" id="password" name="password" 
              				value="${customer.password}"  class="form-control" required>
            </div>
            
			<div class="input-row col-6 mb-3">
              <label for="confirm-password">confirm-password</label>
              <input type="password" id="confirm-password" name="confirm-password" 
              			     class="form-control" required>
            </div>
            
            <div class="input-row col-6 mb-3">
              <label for="phone">Phone Number</label>
              <input type="text" id="phone" name="phone"
              			value="${customer.phone}" class="form-control" required>
            </div>

            <div class="input-row col-6 mb-3">
              <label for="addressLine1">Address Line</label>
              <input type="text" id="addressLine1" name="addressLine1" 
              				value="${customer.addressLine1}" class="form-control" required>
            </div>

            <div class="input-row col-6 mb-3">
              <label for="addressLine2">Address</label>
              <input type="text" id="addressLine2" name="addressLine2" 
              				value="${customer.addressLine2}" class="form-control" required>
            </div>
            <div class="input-row col-6 mb-3">
              <label for="city">City</label>
              <input type="text" id="city" name="city"
              				value="${customer.city}"  class="form-control" required>
            </div>
            
            <div class="input-row col-6 mb-3">
              <label for="state">State</label>
              <input type="text" id="state" name="state"
              				value="${customer.state}"  class="form-control" required>
            </div>

   

			<div class="input-row col-6 mb-3">
              <label for="zip-code">Zip Code</label>
              <input type="text" id="zip-code" name="zip-code"
              				value="${customer.zipcode}" class="form-control" required>
            </div>
            
            <div class="input-row col-6 mb-3">
              <label for="country">Country</label>
              <input type="text" id="country" name="country" 
              				value="${customer.country}" class="form-control" required>
            </div>

 			<div class="form_button col-12 row justify-content-center gap-3">
		        <button type="submit"  class="btn col-2 bg-main  text-white  mt-3 mb-3">Update</button>
		        <a  class="btn col-2 bg-main text-white mt-3 mb-3 text-white" href="list_customer">Back</a>
	      	</div>
          </form>
        </div>
      </div>

      <!-- include footer file -->
      <jsp:include page="../helper/footer.jsp"></jsp:include>

      <!-- =============== SCROLL UP =============== -->
      <a class="scroll-up" href="#">
        <i class="bx bx-up-arrow-alt"></i>
      </a>
      <script  src="../js/notification.js"></script>
  </body>

</html>