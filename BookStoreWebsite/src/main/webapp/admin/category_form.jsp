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
      
    <div class='container'> 
 	<h1 class="text-center mb-4 mt-4 main-color">Add new Category</h1>
 	  <c:if test="${not empty requestScope.message}">
	    <h1 class="text-center">
	        ${requestScope.message}
	    </h1>
	</c:if>
	<!-- core page  -->
  
 	
  <div class="create-category mb-5">
    <form action="create_category" method='post' class="create-user-form row justify-content-center" >
  
      <div class="input-row col-6 mb-3">
        <label for="name">Category Name</label>
        <input type="name" id="name" name="name" class="form-control" required>
      </div>
      
      <div class="form_button d-flex gap-2 col-12 justify-content-center">
                    <button type="submit" class="btn submitBtn col-2 mt-3 bg-main text-white">Save</button>
                    <a href="${pageContext.request.contextPath}/admin" class="btn btn-outline-danger  col-2 mt-3 bg-main text-white">Cencle</a>
     </div>
      
    </form>
  </div>
</div>
    <!-- include footer file -->
    <jsp:include page="../helper/footer.jsp"></jsp:include>
	
    <!-- =============== SCROLL UP =============== -->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>
    
    <!-- =============== MAIN JS =============== -->
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>
     
  </body>
</html>