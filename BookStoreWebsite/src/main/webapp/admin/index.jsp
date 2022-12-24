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
    <title>Responsive website delivery</title>
  </head>
  <body> 

    <!--  -->
    <jsp:include page="../helper/header.jsp"></jsp:include>
     
    <!--  -->
    <jsp:include page="../helper/sub-header.jsp"></jsp:include>

    <div class="resent-seles"> 
      <div class="container"> 
        <h1>Recent seles </h1>
      </div>
    </div>
    <div class="resent-reviews"> 
      <div class="container"> 
        <h1>Recent reviews </h1>
      </div>
    </div>
    <div class="statistics">
      <div class="container"> </div>
      <h1> statistics</h1>
    </div>
    <div class="event-panel logout-panel none">
      <div class="box">
          <h3>Are you sure to logout</h3>
          <div class="btns row">
              <button class="ok-btn btn btn-outline-primary col-6">OK</button>
              <button class="cencel-btn btn btn-outline-primary col-6">Cencle</button>
          </div>
      </div>
  </div>
  <div class="overlay none">

  </div>
	<!-- include footer file -->
	<jsp:include page="../helper/footer.jsp"></jsp:include>
	
    <!-- =============== SCROLL UP ===============-->
    <a class="scroll-up" href="#"><i class="bx bx-up-arrow-alt"></i></a>
    
    <!-- =============== MAIN JS ===============-->
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
  </body>
</html>