<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
  <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- ================== BOOTSTRAP ============== -->
      <link href="../css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
      <!-- ================== Font Awesome ============== -->
      <link rel="stylesheet" href="../css/fontawesome/css/all.min.css">
      <!-- =============== CSS ===============-->
      <link href="../css/style.css" rel="stylesheet" type="text/css">
      <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet" type="text/css">
      <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet" type="text/css">
      <title>Edit Book</title>
    </head>

    <body>

      <!-- include header file -->
      <jsp:include page="../helper/header_admin.jsp"></jsp:include>

      <!-- core page  -->
      <h1 class="text-center mb-4 mt-4 main-color">Edit Book</h1>
     
    <c:if test="${not empty requestScope.message}">
      <div class=" error-message hidden d-flex align-items-center gap-2">
        <i class="err fa-solid fa-circle-exclamation"></i>
        ${requestScope.message}
      </div>
    </c:if> 
    <div class=" edit-book create-book pt-5 pb-5">
       <div class="container">
          <form action="update_book"   method='post' enctype="multipart/form-data" 
               class="create-user-form row">
                <input type="hidden" name='id' value="${book.bookId}">
            <div class="input-row col-6 mb-3">
              <label for="category">Category</label>
              <select name="category" id="category" class="form-select">
                
             <c:forEach var="ct" items="${categoryList}">
                <c:if test="${ct.name eq  book.getCategory().getName()}">
               		 <option selected value="${ct.categoryId}">${ct.name}</option>
                </c:if>
                <c:if test="${ct.name ne  book.getCategory().getName()}">
               		 <option  value="${ct.categoryId}">${ct.name}</option>
                </c:if>
             </c:forEach>
              </select>
            </div>

            <div class="input-row col-6 mb-3">
              <label for="title">Title</label>
              <input type="text" id="title" name="title" class="form-control"
               required value="${book.getTitle()}">
               
            </div>

            <div class="input-row col-6 mb-3">
              <label for="author">Author</label>
              <input type="text" id="author" name="author" class="form-control"
               required value="${book.getAuthor()}">
            </div>

            <div class="input-row col-6 mb-3">
              <label for="ispn">ISBN</label>
              <input type="text" id="ispn" name="ispn" class="form-control" 
              required value="${book.getIsbn()}" >
            </div>

            <div class="input-row col-6 mb-3">
              <label for="publish-date">Publish Date</label>
              <input type="date" id="publish-date" name="publish-date" 
              class="form-control" required value="${book.getPublishDate()}">
            </div>
            
            <div class="input-row col-6 mb-3">
              <label for="price">price</label>
              <input type="number" id="price" name="price" class="form-control" required
               value="${book.getPrice()}">
            </div>
           
            <div class="input-row row col-12 mb-3">
              <div class="load-image col-6">
                <label for="image">image</label>
                <input type="file" id="image" name="image" class="form-control"
                 accept="image/*" >
              </div>
              <div class="review-image col-6">
					<img src="data:image/png;base64,${book.getBase64Image()}" >
              </div>
            </div>
            
            <div class="input-row col-6 mb-3"> 
              <label for="description">Description</label>
              <textarea type="description" id="description" name="description" 
              class="form-control" required>"${book.description}</textarea>
            </div>
              
           
            <div class="form_button col-12 m-auto row d-flex justify-content-center gap-3 ">
              <button type="submit" class="btn col-2 bg-main  text-white  mt-3 mb-3">Update</button>
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
    <script  src="../js/notification.js"></script>
    <script src="../js/book_form.js"></script>
  </body>

  </html>