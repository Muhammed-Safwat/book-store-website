<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
      <title>${customer.firstName} | edit profile</title>
    </head>

    <body>
      <!-- include footer file -->
      <jsp:include page="../layout/header.jsp"></jsp:include>


        <div class="container my-5 pt-3">
             
            <div class="card ">

              <div class="card-body p-5">

                <form  action="edit_customer_profile" method='post' class="create-user-form row">
                  <div class="h3 card-title fw-bold mb-4 main-color">
                    Edit Profile
                  </div>
                  <div class="input-row col-4 mb-3">
                    <label for="email">E-mail</label>
                    <input type="email" id="email" name="email" 
              				value="${customer.email}"  class="form-control" required>
                    <div class="error">
								    	${requestScope.message}
							    	</div>
                  </div>
      
                  <div class="input-row col-4 mb-3">
                    <label for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" 
              			value="${customer.firstName}" class="form-control" required>
                  </div>
      
                  <div class="input-row col-4 mb-3">
                    <label for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" 
              			value="${customer.lastName}" class="form-control" required>
                  </div>
      

                  
                  <div class="input-row col-4 mb-3">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone"
              			    value="${customer.phone}" class="form-control" required>
                  </div>
      
                  <div class="input-row col-4 mb-3">
                    <label for="addressLine1">Address Line 1</label>
                    <input type="text" id="addressLine1" name="addressLine1" 
              				value="${customer.addressLine1}" class="form-control" required>
                  </div>
      
                  <div class="input-row col-4 mb-3">
                    <label for="addressLine2">Address Line 2</label>
                    <input type="text" id="addressLine2" name="addressLine2" 
              				value="${customer.addressLine2}" class="form-control" required>
                  </div>
                  
                  <div class="input-row col-4 mb-3">
                    <label for="city">City</label>
                    <input type="text" id="city" name="city"
              				value="${customer.city}"  class="form-control" required>
                  </div>
      
                  <div class="input-row col-4 mb-3">
                    <label for="state">State</label>
                    <input type="text" id="state" name="state"
              				value="${customer.state}"  class="form-control" required>
                  </div>
      
                <div class="input-row col-4 mb-3">
                    <label for="zip-code">Zip Code</label>
                    <input type="text" id="zip-code" name="zip-code"
              				value="${customer.zipcode}" class="form-control" required>
                  </div>
                  
                  <div class="input-row col-4 mb-3">
                    <label for="country">Country</label>
                    <input type="text" id="country" name="country" 
              				value="${customer.country}" class="form-control" required>
                  </div>
      
                  <div class="form_button row justify-content-center gap-3 col-12 m-auto">
                    <button type="submit" class="btn submitBtn col-2 mt-3 bg-main text-white">Save</button>
                    <a href="${pageContext.request.contextPath}/profile/view-profile" class="btn btn-outline-danger  col-2 mt-3 bg-main text-white">Cencle</a>
                  </div>
      
                </form>

              </div>
            </div>

        </div>
      </div>


      <!-- include footer file -->
      <jsp:include page="../layout/footer.jsp"></jsp:include>

      <!-- =============== SCROLL UP =============== -->
      <a class="scroll-up" href="#">
        <i class="bx bx-up-arrow-alt"></i>
      </a>

      <!-- =============== MAIN JS ===============-->
      <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/cart.js"></script>
    </body>

    </html>