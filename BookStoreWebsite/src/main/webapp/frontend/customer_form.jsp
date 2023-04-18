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
      <title>Add New Customer</title>
    </head>

    <body>
     
      <div>
        <div class="container">
            <div class="text-center my-4">
              <a class="main-color display-4" href="${pageContext.request.contextPath}">
                Book Store 
                 <i class="main-color fa-solid fa-book-open"></i>
             </a>
            </div>
            <div class="card shadow-lg">

              <div class="card-body p-5">

                <form action="register_new_customer" method='post' class="create-user-form row">
                  <div class="h3 card-title fw-bold mb-4 main-color">
                    Sign Up
                  </div>
                  <div class="input-row col-4 mb-3">
                    <label for="email">E-mail</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                    <div class="error">
								    	${requestScope.message}
							    	</div>
                  </div>
      
                  <div class="input-row col-4 mb-3">
                    <label for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" class="form-control" required>
                  </div>
      
                  <div class="input-row col-4 mb-3">
                    <label for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" class="form-control" required>
                  </div>
      
                  <div class="input-row col-4 mb-3">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                  </div>
                  
                 <div class="input-row col-4 mb-3">
                    <label for="confirm-password">confirm-password</label>
                    <input type="password" id="confirm-password" name="confirm-password" class="form-control" required>
                    <div class=" hidden error error-passward">
                      Passwords do not match
							    	</div>
                  </div>
                  
                  <div class="input-row col-4 mb-3">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" class="form-control" required>
                  </div>
      
                  <div class="input-row col-4 mb-3">
                    <label for="addressLine1">Address Line 1</label>
                    <input type="text" id="addressLine1" name="addressLine1" class="form-control" required>
                  </div>
      
                  <div class="input-row col-4 mb-3">
                    <label for="addressLine2">Address Line 2</label>
                    <input type="text" id="addressLine2" name="addressLine2" class="form-control" required>
                  </div>
                  
                  <div class="input-row col-4 mb-3">
                    <label for="city">City</label>
                    <input type="text" id="city" name="city" class="form-control" required>
                  </div>
      
                  <div class="input-row col-4 mb-3">
                    <label for="state">State</label>
                    <input type="text" id="state" name="state" class="form-control" required>
                  </div>
      
                <div class="input-row col-4 mb-3">
                    <label for="zip-code">Zip Code</label>
                    <input type="text" id="zip-code" name="zip-code" class="form-control" required>
                  </div>
                  
                  <div class="input-row col-4 mb-3">
                    <label for="country">Country</label>
                    <input type="text" id="country" name="country" class="form-control" required>
                  </div>
      
                  <div class="form_button row justify-content-around col-4 m-auto">
                    <button type="submit" class="btn submitBtn col-5 mt-3 bg-main text-white">Save</button>
                    <a href="login-customer" class="btn btn-outline-danger  col-5 mt-3 bg-main text-white">Login</a>
                  </div>
      
                </form>

              </div>
            </div>
            <div class="text-center mt-3 mb-3 text-muted">
              Copyright &copy; 2022-2023 &mdash; Book Store
            </div>
        </div>
      </div>
      <script src="${pageContext.request.contextPath}/js/cart.js"></script>
      <script src="${pageContext.request.contextPath}/js/customer_Form.js"></script>
    </body>

    </html>