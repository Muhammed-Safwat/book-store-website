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
			<link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
			<link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
			<link href="${pageContext.request.contextPath}/css/view_profile.css" rel="stylesheet" type="text/css">
      <title>${customer.firstName} | profile</title>
    </head>

    <body>
      <!-- include footer file -->
      <jsp:include page="../layout/header.jsp"></jsp:include>
			<c:if test="${not empty requestScope.message}">
        <div class="error-message hidden d-flex align-items-center gap-2">
          <i class="done fa-solid fa-circle-check"></i>
          
          ${requestScope.message}
        </div>
	    </c:if>
			<section class=" bg-main d-flex align-items-center mb-9 ">
        <div class="container">
            <ol class="breadcrumb ondark m-0 p-2">
                <li class="breadcrumb-item">
                    <a class="text-white opacity-75" href="${pageContext.request.contextPath}">Home</a>
                </li>
                <li class="breadcrumb-item">
                    <a class="text-white opacity-75" href="${pageContext.request.contextPath}/profile/view-profile">Profile</a>
                </li>
            </ol>
        </div>
    </section>

			<section class="padding-y my-5">
				<div class="container">
			
					<div class="row">
						<aside class="col-lg-3 col-xl-3  bg-light align-self-start">
							<nav class="nav flex-lg-column nav-pills mb-4">
								<a class="nav-link bg-main text-white">Profile Setting</a>
								<a href="${pageContext.request.contextPath}/wishlist" class="nav-link">My wishlist</a>					 
								<a href= "${pageContext.request.contextPath}/profile/order_history" class="nav-link">My Orders</a>
								<a href="${pageContext.request.contextPath}/profile/change_passward" class="nav-link" >Change Password</a>
								<a href="${pageContext.request.contextPath}/logout" class="nav-link" >Log out</a>
							</nav>
						</aside>
			
						<main class="col-lg-9  col-xl-9">
							<article class="card">
								<div class="content-body">
						
										<figure class="itemside align-items-center">
												<div class="aside">
														<span class="bg-gray icon-md rounded-circle">
																<img src='${pageContext.request.contextPath}/images/avatar.jpg'
																		class=" icon-md rounded-circle">
														</span>
												</div>
												<figcaption class="info d-flex justify-content-between align-items-center">
														<h6 class="title fw-bold">${customer.firstName}  ${customer.lastName}</h6>
														<a href="${pageContext.request.contextPath}/profile/edit_customer_profile" class="bg-main btn   rounded py-2 px-1">
																<i class=" text-white fa fa-pen px-2"></i>
														</a>
												</figcaption>
										</figure>
						
										<hr>
						
										<div class="row g-2 mb-3">
											<div class="col-md-12">
												<article class="box bg-light">
														<b class="mx-2 text-muted">
																<i class="main-color fa-solid fa-user"></i>
														</b>
														Customer
												</article>
										</div>
												<div class="col-md-12">
														<article class="box bg-light">
																<b class="mx-2 text-muted">
																		<i class="main-color fa-solid fa-envelope"></i>
																</b>
																Email: ${customer.email}
														</article>
												</div>
												<div class="col-md-12">
														<article class="box bg-light">
																<b class="mx-2 text-muted">
																		<i class="main-color fa-solid fa-phone-flip"></i>
																</b>
																Phone: ${customer.phone}
														</article>
												</div>

												<div class="col-md-12">
														<article class="box bg-light Address">
																<b class="mx-2 text-muted">
																		<i class="main-color fa fa-map-marker-alt"></i>
																</b>
																Address: ${customer.addressLine1}, ${customer.addressLine2}, ${customer.city}, ${customer.state}, ${customer.zipcode}, ${customer.country}
														</article>
												</div>
										</div>
								</div>
						</article>
						</main>
			
					</div>
				</div>
			</section>

 
      <!-- include footer file -->
      <jsp:include page="../layout/footer.jsp"></jsp:include>

      <!-- =============== SCROLL UP =============== -->
      <a class="scroll-up" href="#">
        <i class="bx bx-up-arrow-alt"></i>
      </a>

      <!-- =============== MAIN JS ===============-->
			<script  src="../js/notification.js"></script>
      <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
	  <script src="${pageContext.request.contextPath}/js/cart.js"></script>
 

</body>
</html>