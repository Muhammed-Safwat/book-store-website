<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
		
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- ================== BOOTSTRAP ============== -->
   <link href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet"
       type="text/css">
   <!-- ================== Font Awesome ============== -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome/css/all.min.css">
   <!-- =============== CSS ===============-->
   <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/css/user_list.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
    <title>Category Mangmet</title>
</head>

<body>
	<!-- include header file -->
      <jsp:include page="../helper/header_admin.jsp"></jsp:include>
      <c:if test="${not empty requestScope.message}">
        <div class="error-message hidden d-flex align-items-center gap-2">
          <i class="done fa-solid fa-circle-check"></i>
          
          ${requestScope.message}
        </div>
	    </c:if>
	 
    <div class="container">
        <div class="delete-user delete  event-panel none">
            <div class="box">
                <h3 class="text-white">Do you want to delete id = <span class="id">12</span></h3>
                <div class="btns row">
                    <button class="ok-btn btn main-color bg-white col-3">OK</button>
                    <button class="cencel-btn btn main-color bg-white col-3">Cencle</button>
                </div>
            </div>
        </div>
        <div class="overlay none">
        </div>
        <div class="container my-5">
            <div class="card p-4">
                <div class="h2 card-header bg-main text-white justify-content-between border-bottom d-flex">
                    
                    <h5 class='text-start text-white ms-3'>
                        Category list
                    </h5>
                    <h5 class='text-end ms-3 '>
                        <a class='text-white text-decoration-underline' href='create_category'>Add new Category<i class="ms-2 fa-solid fa-layer-group"></i></a>
                    </h5>
                </div>
                <div class="card-body">
                    <div class="data-container">
            
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Index</th>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="categorie" items="${categories}" varStatus="status">
                                    <tr>
                                        <td>${status.index+1}</td>
                                        <td class="categorie-id">${categorie.categoryId}</td>
                                        <td>${categorie.name}</td>
                                        <td>
                                            <form>
                                                <input type="hidden" name='id' value="${categorie.categoryId}">
                                                <a class='main-color edit-button' href="">Edit</a>
                                            |
                                                <a class='main-color delete-button' href="">Delete</a>
                                            </form>   
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="pages d-flex mb-2 gap-2 align-items-center justify-content-center  mt-2">
                                <a href="page=1" class="btn bg-main text-white mr-1">1</a>
                                <a href="page=1" class="btn bg-main text-white mr-1">2</a>
                                <a href="page=1" class="btn bg-main text-white mr-1">3</a>
                                <a href="page=1" class="btn bg-main text-white mr-1">4</a>
                            </div>  
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- include footer -->
    <jsp:include page="../helper/footer.jsp"></jsp:include>
    <!-- =============== MAIN JS ===============--><script  src="../js/notification.js"></script>
 	<script type='module' src="../js/category_list.js"></script>
 	 
   
</body>

</html>