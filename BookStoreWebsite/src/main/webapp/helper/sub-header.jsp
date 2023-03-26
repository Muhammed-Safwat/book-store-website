<!--div class="sub-header"> 
      <div class="container">
        <div class="welcome text-center">
        welcome <span class="admin"><%=request.getServletContext().getAttribute("admin")%></span>
        <br> 
        <span class="admin"> ${admin.getFirstName()} </span>
        <a class='logout' href='${pageContext.request.contextPath}/admin/logout'>Logout</a>
        </div>
        <ul class="links d-flex">
          <li> <a href="${pageContext.request.contextPath}/admin/list_user">Users </a></li>
          <li> <a href="${pageContext.request.contextPath}/admin/list_category">Categories</a></li>
          <li> <a href="${pageContext.request.contextPath}/admin/list_book">Books </a></li>
          <li> <a href="${pageContext.request.contextPath}/admin/list_customer">Customers </a></li>
          <li> <a href="${pageContext.request.contextPath}/admin/list_review">Reviews</a></li>
          <li> <a href="${pageContext.request.contextPath}/admin/list_order">Orders</a></li>
        </ul>
      </div>
    </-div
    <div class="admin-dashboard "> 
      <div class="container"> 
        <h1>Adminstraion Dashboard</h1>
      </div>
    </div>
    <div class="quick-action border-bottom"> 
      <div class="container"> 
        <h1>Quick Actions: </h1>
        <ul class="quick-action-links"> 
          <li> <a href="${pageContext.request.contextPath}/admin/create_book">New Book </a></li>
          <li> <a href="${pageContext.request.contextPath}/admin/create-user">New User </a></li>
          <li> <a href="${pageContext.request.contextPath}/admin/create_category">New Category </a></li>
          <li> <a href="${pageContext.request.contextPath}/admin/create_customer">New Customer </a></li>
        </ul>
      </div>
    </div>-->