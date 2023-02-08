<div class="sub-header"> 
      <div class="container">
        <div class="welcome text-center">
        welcome <span class="admin"><%=request.getServletContext().getAttribute("admin")%></span>
        <a class='logout' href=''>Logout</a>
        </div>
        <ul class="links d-flex">
          <li> <a href="${pageContext.request.contextPath}/admin/list_user">Users </a></li>
          <li> <a href="${pageContext.request.contextPath}/admin/list_category">Categories</a></li>
          <li> <a href="${pageContext.request.contextPath}/admin/list_book">Books </a></li>
          <li> <a href="${pageContext.request.contextPath}/admin/list_customer">Customers </a></li>
          <li> <a href="${pageContext.request.contextPath}/admin/list_review">Reviews</a></li>
          <li> <a href="#">Orders</a></li>
        </ul>
      </div>
    </div>
    <div class="admin-dashboard"> 
      <div class="container"> 
        <h1>Adminstraion Dashboard</h1>
      </div>
    </div>
    <div class="quick-action"> 
      <div class="container"> 
        <h1>Quick Actions: </h1>
        <ul class="quick-action-links"> 
          <li> <a href="/">New Book </a></li>
          <li> <a href="/BookStoreWebsite/admin/user_form.jsp">New User </a></li>
          <li> <a href="/BookStoreWebsite/admin/category_form.jsp">New Category </a></li>
          <li> <a href="#">New Customer </a></li>
        </ul>
      </div>
    </div>