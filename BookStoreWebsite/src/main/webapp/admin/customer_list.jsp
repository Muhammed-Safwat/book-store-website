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

        <c:if test="${request.getAttribute('massage') != null}">
		     <h1 class="text-center">
		         <%=request.getAttribute("massage")%>
		     </h1>	
    	</c:if>
    
     <h4 class="text-center">
      	<a href='customer_form.jsp'>Add new Customer</a>
     </h4>
       
    
    <div class="book-list">
        <div class="container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Index</th>
                        <th>ID</th>
                        <th>E-mail</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Address Line 1</th>
                        <th>Address Line 2</th>
                        <th>City</th>
                        <th>state</th>
                        <th>Country</th>
                        <th>Phone</th>
                        <th>zipcode</th>
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
                            <td>${customer.firstName}</td>
                            <td>${customer.lastName}</td>
                            
                            <td>${customer.addressLine1}</td>
                            <td>${customer.addressLine2}</td>
                            <td>${customer.city}</td>
                            <td>${customer.state}</td>
                            <td>${customer.country}</td>
                            <td>${customer.phone}</td>
                            <td>${customer.zipcode}</td>
                            <td>${customer.registerDate}</td>
                            <td>
                                <a href="" class='edit-button edit-customer'>Edit</a>
                                <a href="" class='delete-button delete-customer'>Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>       
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
     <script src="../css/bootstrap/js/bootstrap.min.js"></script>
      
     <script src="../js/customer_edit.js"></script>
 </body>

 </html>