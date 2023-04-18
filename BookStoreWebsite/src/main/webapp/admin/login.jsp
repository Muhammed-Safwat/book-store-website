
		<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ================== BOOTSTRAP ============== -->
    <link href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- ================== Font Awesome ============== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome/css/all.min.css">
    <!-- =============== CSS ===============-->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
		<title>Login | Adminstration</title>
  </head>
<body>
 
	

  <section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-sm-center h-100">
				<div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">
					<div class="text-center my-5">
            <a class="main-color display-4" href="${pageContext.request.contextPath}">
              Book Store
               <i class="main-color fa-solid fa-book-open"></i>
           </a>
					</div>
					<div class="card shadow-lg">
						<div class="card-body p-5">
							<h1 class="fs-5 card-title fw-bold mb-4 main-color">Login</h1>
							<form class="needs-validation" action="${pageContext.request.contextPath}/admin/login" method="post">
								<div class="mb-3">
									<label class="mb-2 text-muted" for="email">E-Mail Address</label>
									<input id="email" type="email" class="form-control" name="email" value="" required autofocus>
									<div class="error">
										${requestScope.message}
									</div>
								</div>

								<div class="mb-3">
									<div class="mb-2 w-100">
										<label class="text-muted " for="password">Password</label>
									</div>
									<input id="password" type="password" class="form-control" name="password" required>
								</div>
                <div class="row justify-content-center mt-3">
                  <button type="submit" class="btn ms-auto text-white bg-main">
										Login
									</button>
                </div>
							</form>
						</div>
					</div>
					<div class="text-center mt-5 text-muted">
						Copyright &copy; 2022-2023 &mdash; Book Store
					</div>
				</div>
			</div>
		</div>
	</section>

	<script  src="../js/notification.js"></script>
</body>
</html>