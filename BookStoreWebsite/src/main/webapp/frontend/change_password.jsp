<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
    <title>Login</title>
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
						<div class="card-body p-5 pb-3">
							<h1 class="fs-5 card-title fw-bold mb-4 main-color">Change Passward</h1>
              <form method="POST" class="needs-validation" novalidate="" autocomplete="off">
								
                <div class="mb-3">
									<label class="mb-2 text-muted" for="password">Old Passward</label>
									<input id="password" type="password" class="form-control" name="password" value="" required autofocus>
									<div class="invalid-feedback">
										Password is required	
									</div>
								</div>
                <div class="mb-3">
									<label class="mb-2 text-muted" for="password">New Password</label>
									<input id="password" type="password" class="form-control" name="password" value="" required autofocus>
									<div class="invalid-feedback">
										Password is required	
									</div>
								</div>

								<div class="mb-3">
									<label class="mb-2 text-muted" for="password-confirm">Confirm Password</label>
									<input id="password-confirm" type="password" class="form-control" name="password_confirm" required>
								    <div class="invalid-feedback">
										Please confirm your new password
							    	</div>
								</div>

								<div class="d-flex align-items-center">
									<div class="form-check">
										<input type="checkbox" name="logout_devices" id="logout" class="form-check-input">
										<label for="logout" class="form-check-label">Logout all devices</label>
									</div>
                </div>
                <div class="d-flex align-items-center my-3 justify-content-center">  
									<button type="submit" class="btn text-white bg-main">
										Reset Password	
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="text-center mt-4 mb-2 text-muted">
						Copyright &copy; 2022-2023 &mdash; Book Store
					</div>
				</div>
			</div>
		</div>
	</section>

 
</body>
</html>