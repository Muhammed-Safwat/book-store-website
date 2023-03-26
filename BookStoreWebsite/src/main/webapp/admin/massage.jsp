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
			<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
			<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
			<title>Login | Story Adminstration</title>
		</head>
  <body> 	
    <!-- include footer file -->
	<jsp:include page="../helper/header.jsp"></jsp:include>
	
	 
 	<c:if test="${not empty requestScope.message}">
	    <h1 class="text-center">
	        ${requestScope.message}
	    </h1>
	</c:if> 
  
			<jsp:include page="../helper/footer.jsp"></jsp:include>
		</body>

 
</html>