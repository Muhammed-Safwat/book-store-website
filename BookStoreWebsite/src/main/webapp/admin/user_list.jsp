<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- =============== BOXICONS ===============-->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
     <!-- ================== BOOTSTRAP ============== -->
     <link href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet"
         type="text/css">
     <!-- ================== Font Awesome ============== -->
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome/css/all.min.css">
     <!-- =============== CSS ===============-->
     <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
     <link href="${pageContext.request.contextPath}/css/user_list.css" rel="stylesheet" type="text/css">
		 <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
		 <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
     <title>Manage Users</title>
</head>

<body>
   <!-- include header file -->
      <jsp:include page="../helper/header_admin.jsp"></jsp:include>
	
	<div class='container'>
    	 <h1 class="text-center my-4 main-color">manage user list </h1>
	 	
	 
	   <c:if test="${not empty requestScope.message}">
	    <h1 class="text-center">
	        ${requestScope.message}
	    </h1>
	</c:if>	

	    <h5 class="text-start mb-2 ms-2">
	   		<a href='user_form.jsp' class='main-color'>Create new User</a>
	    </h5>

      <div class="data-container">


	     <table class="table table-bordered">
	         <thead>
	             <tr>
	                 <th>Index</th>
	                 <th>ID</th>
	                 <th>Email</th>
	                 <th>Full Name</th>
	                 <th>Actions</th>
	             </tr>
	         </thead>
	         <tbody>
	             <c:forEach var="user" items="${users}" varStatus="status">
	                 <tr>
	                     <td>${status.index+1}</td>
	                     <td class="user-id">${user.userId}</td>
	                     <td>${user.email}</td>
	                     <td>${user.fullName}</td>
	                     <td>
							<form action="" method="post" class='d-flex gap-2'>
								<input type="hidden" name='id' value="${user.userId}">
								<a href="" class='edit-button main-color' >Edit</a>|
								<a href="" class='delete-button main-color'>Delete</a>
							</form>   
	                     </td>
	                 </tr>
	             </c:forEach>
	         </tbody>
	     </table>
				 <div class="pages d-flex mb-2 gap-2 align-items-center justify-content-center  mt-2">
	                 <a href="page=1" class="btn bg-main text-white mr-1">1</a>
	                 <a href="page=1" class="btn bg-main text-white mr-1">2</a>
	                 <a href="page=1" class="btn bg-main text-white mr-1">3</a>
	                 <a href="page=1" class="btn bg-main text-white mr-1">4</a>
	             </div> 
</div>
	     <div class="event-panel delete-user none">
	         <div class="box">
	             <h3>Do you want to delete id = <span class="id">12</span></h3>
	             <div class="btns row">
	                 <button class="ok-btn btn btn-outline-primary col-6">OK</button>
	                 <button class="cencel-btn btn btn-outline-primary col-6">Cencle</button>
	             </div>
	         </div>
	     </div>
	     <div class="overlay none">
	
	     </div>
	</div>
     <!-- include footer  -->
     <jsp:include page="../helper/footer.jsp"></jsp:include>
		  
     <script type="module" src="../js/list_user.js"></script>
         <!-- =============== MAIN JS ===============-->
     <script src="../css/bootstrap/js/bootstrap.min.js"></script>
     
 </body>
</html>