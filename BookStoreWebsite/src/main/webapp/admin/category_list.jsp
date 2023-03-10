<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
		
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- =============== BOXICONS ===============-->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
   <!-- ================== BOOTSTRAP ============== -->
   <link href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css" rel="stylesheet"
       type="text/css">
   <!-- ================== Font Awesome ============== -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome/css/all.min.css">
   <!-- =============== CSS ===============-->
   <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
   <link href="${pageContext.request.contextPath}/css/user_list.css" rel="stylesheet" type="text/css">
    <title>Category List</title>
</head>

<body>
	<!-- include helper -->
	<jsp:include page="../helper/header.jsp"></jsp:include>
	
	<!--  -->
	<jsp:include page="../helper/sub-header.jsp"></jsp:include>
	<div class='container'>
	<h1 class="text-center">Category list </h1>

      <h1 class="text-center">
         <%=request.getAttribute("message")%>
     </h1>

	<h4 class="text-center mb-5">
		<a href='create_category'>Create new Category</a>
	</h4>

    <div class="data-container">
        <table class="table table-bordered">
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
                                <a href="" class='edit-button'>Edit</a>
                                <a href="" class='delete-button'>Delete</a>
                            </form>   
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="event-panel delete-user none">
        <div class="box">
            <h3>Do you want to delete id = <span class="id"></span></h3>
            <div class="btns row">
                <button class="ok-btn btn btn-outline-primary col-6">OK</button>
                <button class="cencel-btn btn btn-outline-primary col-6">Cencle</button>
            </div>
        </div>
    </div>
    <div class="overlay none">

    </div>
</div>
    <!-- include footer -->
    <jsp:include page="../helper/footer.jsp"></jsp:include>
 	<script type='module' src="../js/category_list.js"></script>
    <!-- =============== MAIN JS ===============-->
    <script src="../css/bootstrap/js/bootstrap.min.js"></script>
   
</body>

</html>