<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- =============== BOXICONS ===============-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    
    <!-- ================== BOOTSTRAP ============== -->
    <link href="../css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    
    <!-- ================== Font Awesome ============== -->
    <link rel="stylesheet" href="../css/fontawesome/css/all.min.css">
    
    <!-- =============== CSS ===============-->
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <title>Create New User</title>
  </head>
  <body> 	
  
    <!-- include header file -->
      <jsp:include page="../helper/header_admin.jsp"></jsp:include>
	
	<!-- core page  -->
 	<h1>Edit user</h1>
 	<c:if test="${not empty requestScope.message}">
	    <h1 class="text-center">
	        ${requestScope.message}
	    </h1>
	</c:if>
     
  <div class="create-user">
    <form action="update_user" method='post' class="create-user-form row" >
      <input value="${user.userId }" name="id" type='hidden'/>
      <div class="input-row col-6 mb-3">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" class="form-control" required  value="${user.email }"/>
      </div>
      
      <div class="input-row col-6 mb-3">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" class="form-control"  value="${user.fullName }" required/>
      </div>
      
      <div class="form_button col-4 m-auto">
        <button type="submit"  class="btn btn-outline-danger mt-3 mb-3">Update</button>
        <a  class="btn btn-outline-danger mt-3 mb-3" href="list_user">Back</a>
      </div>
      
    </form>
  </div>
  
	<!-- include footer file -->
	<jsp:include page="../helper/footer.jsp"></jsp:include>
	
    <!-- =============== SCROLL UP ===============-->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>
    
    <!-- =============== MAIN JS ===============-->
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/user_form.js"></script>
  </body>
</html>