<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<title>Login | Story Adminstration</title>
		</head>

		<body>
			<jsp:include page="../helper/header.jsp"></jsp:include>

			<div class="login d-flex align-items-center justifay-content-center">
				<div class="container">
					<h1 class="main-headline m-4 text-center"> Book store Adminstraion </h1>
					<h4 class="sub-headline mb-4 text-center"> Admin Login </h4>
					<h5 class="error-massage"> <%=request.getAttribute("massage")%></h5>
					<form action="${pageContext.request.contextPath}/admin/login" method="post" class="form-input row mb-5">
						<div class="form--input col-6">
							<label for="email"> Email </label>
							<input type="email" name ="email" id="email" class="form-control" placeholder="Enter Your Email" required>
						</div>
						<div class="form--input col-6">
							<label for="password">Password</label>
							<input type="password" name ="password" id="password" class="form-control" placeholder="Enter Your password" required>
						</div>
						<button type="submit" class="btn btn-primary">Login</button>
					</form>
				</div>
			</div>

			<jsp:include page="../helper/footer.jsp"></jsp:include>
		</body>

		</html>