<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<header class="header" id="header">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-4 col-6">
            <div class="logo"><a href="${pageContext.request.contextPath}">Evergreen</a></div>
          </div>
          <div class="header-content col-lg-8 col-md-8 col-6">
            <div class="header-search d-flex align-items-center">
              <input type="text" class='form-control search-input'>
              <button type="button" class="btn btn-primary search-btn me-1 ms-1">Submit</button>
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
    </header>