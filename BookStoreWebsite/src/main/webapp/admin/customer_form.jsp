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
      <title>Customer Form</title>
    </head>

    <body>
    
      <!-- include header file -->
      <jsp:include page="../layout/header_admin.jsp"></jsp:include>

      <c:if test="${not empty requestScope.message}">
        <div class=" error-message hidden d-flex align-items-center gap-2">
          
          <i class="err fa-solid fa-circle-exclamation"></i>
          ${requestScope.message}
        </div>
	    </c:if>

      <div class="container">
          <div class="card my-5">
            <div class="card-body p-5">
              <form action="create_customer" method='post' class="create-user-form row">
                <div class="h3 card-title fw-bold mb-4 main-color">
                  Add New Customer
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
                  <a href="${pageContext.request.contextPath}/admin" class="btn btn-outline-danger  col-5 mt-3 bg-main text-white">Cencle</a>
                </div>
    
              </form>

            </div>
          </div>
      </div>

      <!-- include footer file -->
      <jsp:include page="../layout/footer.jsp"></jsp:include>

      <!-- =============== SCROLL UP =============== -->
      <a class="scroll-up" href="#">
        <i class="bx bx-up-arrow-alt"></i>
      </a>

      <!-- =============== MAIN JS ===============--><script  src="../js/notification.js"></script>
      <script src="${pageContext.request.contextPath}/js/customer_Form.js"></script>
  </body>

</html>