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
      <title>${customer.fullName} | profile</title>
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
						<h2>welecome ${customer.fullName}</h2>
						<ul>
							<li>
								<span class="">E-mail Address</span>
								<span class="">${customer.email}</span>
							</li>
							<li>
								<span class="">Full Name</span>
								<span class="">${customer.fullName}</span>
							</li>
							<li>
								<span class="">Phone Number</span>
								<span class="">${customer.phone}</span>
							</li>
							<li>
								<span class="">Address</span>
								<span class="">${customer.address}</span>
							</li>
							<li>
								<span class="">City</span>
								<span class="">${customer.city}</span>
							</li>
							<li>
								<span class="">Zip Code</span>
								<span class="">${customer.zipcode}</span>
							</li>
							<li>
								<span class="">Country</span>
								<span class="">${customer.country}</span>
							</li>
						</ul>
						<a href="edit-customer-profile">Edit Profile</a>
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