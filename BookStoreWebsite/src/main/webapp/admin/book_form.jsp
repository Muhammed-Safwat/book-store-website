<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">

      <!-- =============== BOXICONS ===============-->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

      <!-- ================== BOOTSTRAP ============== -->
      <link href="../css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

      <!-- ================== Font Awesome ============== -->
      <link rel="stylesheet" href="../css/fontawesome/css/all.min.css">

      <!-- =============== CSS ===============-->
      <link href="../css/style.css" rel="stylesheet" type="text/css">
      <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
      <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
      <title>Create New Book</title>
    </head>

    <body>
      <!-- include header file -->
      <jsp:include page="../helper/header_admin.jsp"></jsp:include>

      <!-- core page  -->
      <c:if test="${not empty requestScope.message}">
	    <h1 class="text-center">
	        ${requestScope.message}
	    </h1>
	</c:if>
	
      <div class="create-book pt-2 pb-5">
        <div class="container">
        <h1 class="text-center mb-5 mt-5 main-color">Add new Book <i class="ms-2 fa-solid fa-book"></i></h1>
          <form action="create_book" method='post' enctype="multipart/form-data" class="create-user-form row">
            <div class="input-row col-6 mb-3">
              <label for="category">Category</label>
              <select name="category" id="category" class="form-select">
                <option selected>Select Category</option>
                <c:forEach var="ct" items="${categoryList}">
                  <option value="${ct.categoryId}">${ct.name}</option>
                </c:forEach>
              </select>

            </div>

            <div class="input-row col-6 mb-3">
              <label for="title">Title</label>
              <input type="text" id="title" name="title" class="form-control" required>
            </div>

            <div class="input-row col-6 mb-3">
              <label for="author">Author</label>
              <input type="text" id="author" name="author" class="form-control" required>
            </div>

            <div class="input-row col-6 mb-3">
              <label for="ispn">ISBN</label>
              <input type="text" id="ispn" name="ispn" class="form-control" required>
            </div>

            <div class="input-row col-6 mb-3">
              <label for="publish-date">Publish Date</label>
              <input type="date" id="publish-date" name="publish-date" class="form-control" required>
            </div>
            <div class="input-row col-6 mb-3">
              <label for="price">price</label>
              <input type="number" id="price" name="price" class="form-control" required>
            </div>


            <div class="input-row row col-12 mb-3">
              <div class="load-image col-6">
                <label for="image">image</label>
                <input type="file" id="image" name="image" class="form-control" accept="image/*" required>
              </div>
              <div class="review-image col-6">

              </div>
            </div>



            <div class="input-row col-6 mb-3">
              <label for="discription">Discription</label>
              <textarea type="discription" id="discription" name="discription" class="form-control" required></textarea>
            </div>

            <div class="form_button col-12 m-auto row d-flex justify-content-center gap-3 ">
              <button type="submit" class="btn col-2 bg-main  text-white  mt-3 mb-3">Add</button>
              <button class="btn col-2 bg-main text-white mt-3 mb-3"><a href="list_book" class='text-white'>Cencle</a> </button>
            </div>

          </form>
        </div>
      </div>
      <!-- include footer file -->
      <jsp:include page="../helper/footer.jsp"></jsp:include>

      <!-- =============== SCROLL UP =============== -->
      <a class="scroll-up" href="#">
        <i class="bx bx-up-arrow-alt"></i>
      </a>

      <!-- =============== MAIN JS ===============-->
      <script src="../css/bootstrap/js/bootstrap.min.js"></script>
      <script src="../js/book_form.js"></script>
    </body>

    </html>