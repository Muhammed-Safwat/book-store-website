<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
    <title>Login</title>
  </head>
<body>
	<jsp:include page="../helper/header.jsp"></jsp:include>

    <h1 class="text-center mt-5 mb-5">Customer Login</h1>
    
    <c:if test="${not empty requestScope.message}">
	    <h1 class="text-center">
	        ${requestScope.message}
	    </h1>
	</c:if>
    
	<div class="customer-login">
      <div class="container">
        <form action="login-customer" method="post" class="row">
          <div class="col-lg-6 col-md-6 col-12 mb-3">
            <label for="email">User name</label>
            <input id="email"  name="email" type="email" class="form-control" required>
          </div>
          <div class="col-lg-6 col-md-6 col-12 mb-3">
            <label for="password">Password</label>
            <input id="password" type="password" name="password" class="form-control" required>
          </div>
          <div class="col-4 m-auto mt-3 mb-3">
          
            <button type="submit" class="btn btn-primary w-100">Login</button>
          </div>
        </form>
      </div>
     </div>
	<jsp:include page="../helper/footer.jsp"></jsp:include>
</body>
</html>