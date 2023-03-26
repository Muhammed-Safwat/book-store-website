 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- =============== BOXICONS =============== -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    
    <!-- ================== BOOTSTRAP ============== -->
    <link href="../css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    
    <!-- ================== Font Awesome ============== -->
    <link rel="stylesheet" href="../css/fontawesome/css/all.min.css">
    
    <!-- =============== CSS =============== -->
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <title>Create Form</title>
  </head>
  <body> 	
  
  		<!-- include header file -->
      <jsp:include page="../helper/header_admin.jsp"></jsp:include>
      
      
	<c:if test="${not empty requestScope.message}">
	    <h1 class="text-center">
	        ${requestScope.message}
	    </h1>
	</c:if>
	<!-- core page  -->
 	<h1>create category</h1>
 	
  <div class="create-user">
    <form action="create_category" method='post' class="create-user-form row" >
  
      <div class="input-row col-12 mb-3">
        <label for="name">Category Name</label>
        <input type="name" id="name" name="name" class="form-control" required>
      </div>
      
      <div class="form_button col-4 m-auto">
        <button type="submit"  class="btn btn-outline-danger mt-3 mb-3">Add</button>
          <a  class="btn btn-outline-danger mt-3 mb-3" href="list_category">Back</a>
      </div>
      
    </form>
  </div>

    <!-- include footer file -->
    <jsp:include page="../helper/footer.jsp"></jsp:include>
	
    <!-- =============== SCROLL UP =============== -->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>
    
    <!-- =============== MAIN JS =============== -->
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>
     
  </body>
</html>