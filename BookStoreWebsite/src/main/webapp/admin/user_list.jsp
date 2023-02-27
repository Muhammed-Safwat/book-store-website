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
     <title>Manage Users</title>
 </head>

 <body>
     <!--  include header folder  -->
     <jsp:include page="../helper/header.jsp"></jsp:include>

     <!--  include sub header folder  -->
     <jsp:include page="../helper/sub-header.jsp"></jsp:include>
	
	<div class='container'>
    	 <h1 class="text-center">manage user list </h1>
	
		<c:if test="${request.getAttribute('massage') != null}">
		     <h1 class="text-center">
		         <%=request.getAttribute("massage")%>
		     </h1>	
	    </c:if>
    
	    <h4 class="text-center mt-4">
	   		<a href='user_form.jsp'>Create new User</a>
	    </h4>
      
     
     
     
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
	                         <a href="" class='edit-button'>Edit</a>
	                         <a href="" class='delete-button'>Delete</a>
	                     </td>
	                 </tr>
	             </c:forEach>
	         </tbody>
	     </table>
	     <div class="delete-user none">
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

         <!-- =============== MAIN JS ===============-->
     <script src="../css/bootstrap/js/bootstrap.min.js"></script>
     <script src="../js/delete_user.js"></script>
 </body>

        </html>