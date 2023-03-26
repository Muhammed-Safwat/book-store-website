<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<header>
<div class="header-top header-top-border">
      <div class="container">
          <div class="row align-items-center justify-content-between">
              <div class="col">
                  <div class="header-links">
                      <a href="">
                        <i class="fa-solid fa-truck main-color"></i>
                          <span>Track your order</span>
                      </a>
                      <a href="">
                          <i class="main-color fa-solid fa-location-dot"></i>
                          <span>Locate Store</span>
                      </a>
                  </div>
              </div>
              <div class="col order-2 order-xs-2 order-lg-12">
                  <div class="header-account-links">
                      <a href="">
                          <i class=" main-color fa-solid fa-circle-question"></i>
                          <span>Help</span>
                      </a>
                      <c:if test="${customer == null}">
                          <a href="${pageContext.request.contextPath}/login-customer">
                              <i class="main-color fa-solid fa-right-to-bracket"></i>
                              <span>LOGIN</span>
                          </a>
                      </c:if>
                      <c:if test="${customer != null}"> 
                          <a href="${pageContext.request.contextPath}/logout"> 
                            <i class=" main-color fa-solid fa-right-to-bracket"></i>
                            <span>LOGOUT</span>
                         </a>
                        <a href="${pageContext.request.contextPath}/profile/view-profile" class="d-flex userProfile-Link">
                            <img src="${pageContext.request.contextPath}/images/avatar.jpg"
                                class="d-inline rounded-circle" width="32" height="32" alt="avater">
                            <span class="d-lg-none d-sm-inline">My Profile</span>
                        </a>
                    </c:if>
                  </div>
              </div>
          </div>
      </div>
</div>

<div class="header-bottom header-bottom-one header-sticky">
      <div class="container">
          <div class="row align-items-center justify-content-between">

              <div class="col-lg-2 col-sm-8 col-8">
                  <div class="header-logo">
                      <a class="main-color" href="${pageContext.request.contextPath}">
                         Book Store
                          <i class="main-color fa-solid fa-book-open"></i>
                      </a>
                  </div>
              </div>
              <div class="col-lg-4 col-sm-3 col-4 order-lg-last">
                  <div class="header-shop-links float-end">
                    <a href="" class="header-wishlist">
                        <i class="fa-solid fa-bell main-color"></i>
                        <span class="number">4</span>
                    </a>
                      <a href="${pageContext.request.contextPath}/view_cart" class="header-wishlist">
                          <i class="fa-solid fa-heart text-danger main-color"></i>
                          <span class="number">4</span>
                      </a>
                      <a href="${pageContext.request.contextPath}/view_cart" class="header-cart">
                           
                          <i class="main-color fa-solid fa-cart-shopping"></i>
                          <span class="number">12</span>
                      </a>
                  </div>
              </div>

              <div class="col-lg-6 order-12 order-xs-12 order-lg-2">
                  <div>
                      <form action="search" method="post">
                          <div class="input-group">
                              <input type="search" name="key" class="form-control" style="width:55%" placeholder="Search" required>
                              <div class="dropdown ">
                                <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                  Category
                                </a>
                                <ul class="dropdown-menu categoryList">
                                  <c:forEach var="category" items="${categories}">
                                    <li><a class="dropdown-item" href="view_category?id=${category.categoryId}">${category.name}</a></li>
                                  </c:forEach>
                                </ul>
                              </div>
                              <button type="submit" class="bg-main btn btn-warning">
                                  <i class="text-white fa fa-search"></i>
                              </button>
                          </div>
                      </form>
                  </div>
              </div>
              <div class="mobile-menu order-12 d-block d-lg-none col"></div>
          </div>
      </div>
  </div>
</header>

 


<!-- header class="header" id="header">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-4 col-6">
            <div class="logo"><a href="${pageContext.request.contextPath}">Evergreen</a></div>
          </div>
          <div class="header-content col-lg-8 col-md-8 col-6">
            <div class="header-search ">
              <form action="search" method="post">
              	<div class="d-flex align-items-center"> 
	                <input type="text" name="key" class='form-control search-input'>
	                <button type="submit" class="btn btn-primary search-btn me-1 ms-1">Submit</button>
                </div>
              </form>
            </div>
            <ul class="links d-flex align-items-center justify-content-end">
             <c:if test="${customer != null}">
                <li><a href="${pageContext.request.contextPath}/profile/view-profile">${customer.firstName}</a></li>
	              <li><a href="${pageContext.request.contextPath}/profile/order_history">My Order</a></li>
	              <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
	              <li><a href="${pageContext.request.contextPath}/view_cart">Cart</a></li>
             </c:if>
             <c:if test="${customer == null}">
                  <li><a href="${pageContext.request.contextPath}/login-customer">Sign In</a></li>
	              <li><a href="${pageContext.request.contextPath}/register_new_customer">Register</a></li>
	              <li><a href="${pageContext.request.contextPath}/view_cart">Cart</a></li>
             </c:if>
               
            </ul>
          </div>
        </div>
      </div>
    </header -->