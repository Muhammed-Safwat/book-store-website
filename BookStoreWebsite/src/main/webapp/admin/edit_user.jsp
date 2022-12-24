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
    <title>Create New User</title>
  </head>
  <body> 	
  
    <!-- include footer file -->
	<jsp:include page="../helper/header.jsp"></jsp:include>
	
	<!-- core page  -->
 	<h1>Edit user</h1>
 	 <h1>
            <%=request.getAttribute("massage")%>
     </h1>
     
  <div class="create-user">
    <form action="edit_user" method='post' class="create-user-form row" >
      
      <div class="input-row col-12 mb-3">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" class="form-control" required  value="<%=request.getAttribute("email")%>"/>
      </div>
      
      <div class="input-row col-12 mb-3">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" class="form-control"  value="<%=request.getAttribute("password")%>" required/>
      </div>
      
      <div class="input-row col-12 mb-3">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" class="form-control"  value="<%=request.getAttribute("name")%>" required/>
      </div>
      
      <div class="form_button col-4 m-auto">
        <button type="submit"  class="btn btn-outline-danger mt-3 mb-3">Submit</button>
        <button type="reset"  class="btn btn-outline-danger mt-3 mb-3">Cencle</button>
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