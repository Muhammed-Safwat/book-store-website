<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<header>
<div class="header-top header-top-border">
      <div class="container">
          <div class="row align-items-center justify-content-between">
              <div class="col">
                  <div class="header-links">
                    <div class="header-logo">
                        <a class="main-color" href="${pageContext.request.contextPath}/admin/">
                           Book Store Administration
                            <i class="main-color fa-solid fa-book-open"></i>
                        </a>
                    </div>
                  </div>
              </div>
              <div class="col order-2 order-xs-2 order-lg-12">
                  <div class="header-account-links">
                      <a href="">
                          <i class=" main-color fa-solid fa-circle-question"></i>
                          <span>Help</span>
                      </a>
                          <a href="${pageContext.request.contextPath}/admin/logout"> 
                            <i class=" main-color fa-solid fa-right-to-bracket"></i>
                            <span>LOGOUT</span>
                         </a>
                        <a class="d-flex userProfile-Link">
                            <img src="${pageContext.request.contextPath}/images/avatar.jpg"
                                class="d-inline rounded-circle" width="32" height="32" alt="avater">
                            <span class="d-lg-none d-sm-inline">My Profile</span>
                        </a>
                  </div>
              </div>
          </div>
      </div>
</div>

 
 
 