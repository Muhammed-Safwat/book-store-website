<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <title>Edit Category</title>
  </head>
  <body> 	
   <!-- include header file -->
      <jsp:include page="../layout/header_admin.jsp"></jsp:include>
	
	<!-- core page  -->
 
 	<h1 class="text-center mb-4 mt-4 main-color">Edit Category</h1>

  <c:if test="${not empty requestScope.message}">
    <div class=" error-message hidden d-flex align-items-center gap-2">
 
      <i class="err fa-solid fa-circle-exclamation"></i>
      ${requestScope.message}
    </div>
  </c:if>

  <div class='container'>
	  <div class="create-category">
	    <form action="update_category" method='post' class="create-user-form row justify-content-center" >
	      <div class="input-row col-6 mb-3">
	        <label for="name">Full Name</label>
	        <input type="hidden" id="id" name="id" value="${categroy.categoryId }"/>
	        <input type="text" id="name" name="name" class="form-control" value="${categroy.name}" required/>
	      </div>
	      <div class="form_button col-12 row justify-content-center gap-3">
	        <button type="submit"  class="btn col-2 bg-main  text-white  mt-3 mb-3">Update</button>
	        <a  class="btn col-2 bg-main text-white mt-3 mb-3 text-white" href="list_category">Back</a>
	      </div>
	    </form>
	  </div>
  </div>
	<!-- include footer file -->
	<jsp:include page="../layout/footer.jsp"></jsp:include>
	
    <!-- =============== SCROLL UP ===============-->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>
    <script  src="../js/notification.js"></script>
  </body>
</html>