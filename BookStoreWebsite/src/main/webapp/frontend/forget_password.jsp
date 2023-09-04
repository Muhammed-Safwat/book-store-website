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
                        <div class="card shadow-lg mb-5">
                            <div class="card-body p-5">
                                <h1 class="fs-4 card-title fw-bold mb-4 main-color">Forgot Password</h1>
                                <form method="POST" class="needs-validation" novalidate="" autocomplete="off">
                                    <div class="mb-3">
                                        <label class="mb-2 text-muted" for="email">E-Mail Address</label>
                                        <input id="email" type="email" class="form-control" name="email" value="" required autofocus>
                                        <div class="invalid-feedback">
                                            Email is invalid
                                        </div>
                                    </div>
    
                                    <div class="d-flex align-items-center">
                                        <button type="submit" class="btn ms-auto bg-main text-white">
                                            Send Link	
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer py-3 border-0">
                                <div class="text-center">
                                    Remember your password? <a href="login-customer" class="main-color text-dark">Login</a>
                                </div>
                            </div>
                        </div>
                        <div class="text-center pt-5 text-muted">
                            Copyright &copy; 2017-2021 &mdash; Your Company 
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="${pageContext.request.contextPath}/js/cart.js"></script>
        <script src="js/login.js"></script>
    </body>
    </html>
    