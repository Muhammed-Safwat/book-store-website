<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">

      <!-- =============== BOXICONS ===============-->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

      <!-- ================== BOOTSTRAP ============== -->
      <link href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

      <!-- ================== Font Awesome ============== -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome/css/all.min.css">

      <!-- =============== CSS ===============-->
      <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
      <title>${customer.firstName} | profile</title>
    </head>

    <body>
      <!-- include footer file -->
      <jsp:include page="../helper/header.jsp"></jsp:include>

     
     <div class="categories">
		  <div class="container">
		    <ul class="list d-flex align-items-center justify-content-between">
		     <c:forEach var="category" items="${categories}">
		      <li><a href='view_category?id=${category.categoryId}'>${category.name}</a></li>
		     </c:forEach>
		    </ul>
		  </div>
	</div>

			<div class="customer-profile">
				<div class="container">
						<h2 class="mt-5 text-center mb-5">welecome ${customer.firstName}</h2>
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>E-mail Address</th>
									<td>${customer.email}</td>
								</tr>
								<tr>
									<th><span class="">First Name</span></th>
									<td><span class="">${customer.firstName}</span></td>
								</tr>
								<tr>
									<th><span class="">Last Name</span></th>
									<td><span class="">${customer.lastName}</span></td>
								</tr>
								
								<tr>
									<th><span class="">Address Line 1</span></th>
									<td><span class="">${customer.addressLine1}</td>
								</tr>
								<tr>
									<th><span class="">Address Line 2</span></th>
									<td><span class="">${customer.addressLine2}</span></td>
								</tr>
								<tr>
									<th><span class="">City</span></th>
									<td><span class="">${customer.city}</span></td>
								</tr>				
								<tr>
									<th><span class="">State</span></th>
									<td><span class="">${customer.state}</span></td>
								</tr>
								<tr>
									<th><span class="">Country</span></th>
									<td><span class="">${customer.country}</span></td>
								</tr>
								<tr>
									<th><span class="">Phone Number</span></th>
									<td><span class="">${customer.phone}</span></td>
								</tr>
								<tr>
									<th><span class="">Zip Code</span></th>
									<td><span class="">${customer.zipcode}</span></td>
								</tr>
							</tbody>
						</table>
						<div class="mb-5 bt-5 text-center">
								<a class="mb-5 bt-5 text-center" href="edit_customer_profile">Edit Profile</a>
						</div>
						
				</div>
			</div>

 
      <!-- include footer file -->
      <jsp:include page="../helper/footer.jsp"></jsp:include>

      <!-- =============== SCROLL UP =============== -->
      <a class="scroll-up" href="#">
        <i class="bx bx-up-arrow-alt"></i>
      </a>

      <!-- =============== MAIN JS ===============-->
      <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
       
 

</body>
</html>