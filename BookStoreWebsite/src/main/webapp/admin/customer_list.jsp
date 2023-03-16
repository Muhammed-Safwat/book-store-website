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
     <title>Customer Mangment</title>
 </head>

 <body>
     <!--  include header folder  -->
     <jsp:include page="../helper/header.jsp"></jsp:include>

     <!--  include sub header folder  -->
     <jsp:include page="../helper/sub-header.jsp"></jsp:include>

	<div class='container'>
     <h1 class="text-center">Customer Mangment</h1>

        <c:if test="${not empty requestScope.message}">
		    <h1 class="text-center">
		        ${requestScope.message}
		    </h1>
		</c:if>
    
     <h4 class="text-center">
      	<a href='customer_form.jsp'>Add new Customer</a>
     </h4>
       
<div class="data-container">
    <div class="book-list">
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Index</th>
                        <th>ID</th>
                        <th>E-mail</th>
                        <th>Full Name</th>
                        <th>City</th>
                        <th>state</th>
                        <th>Country</th>
                        <th>Phone</th>
                        <th>Registered Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${customers}" varStatus="status">
                        <tr data-book-id="${customer.customerId}">
                            <td>${status.index+1}</td>
                            <td class="book-id">${customer.customerId}</td>           
                            <td>${customer.email}</td>
                            <td>${customer.firstName} ${customer.lastName}</td>
                            <td>${customer.city}</td>
                            <td>${customer.state}</td>
                            <td>${customer.country}</td>
                            <td>${customer.phone}</td>
                            <td>${customer.registerDate}</td>
                            <td>
                                <form action="" method="post">
                                    <input type="hidden" name='id' value="${customer.customerId}">
                                    <a href="" class='edit-button'>Edit</a>
                                    <a href="" class='delete-button'>Delete</a>
                                </form> 
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>       
        </div>
    </div>
</div>
     <div class="delete-user delete  event-panel none">
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
	<script type='module' src="../js/customer_list.js"></script>
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>
      
     
 </body>

 </html>