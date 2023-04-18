package com.bookstore.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookstore.controller.frontend.shopingcart.WishList;
import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import com.bookstore.entity.Review;

@MultipartConfig(
		  fileSizeThreshold = 1024 * 15, // 10 kB
		  maxFileSize = 1024 * 400,      // 300 kB
		  maxRequestSize = 1024 * 1024 * 2    // 1 MB
	)
public class BookService {	
	private BookDAO bookDAO  = null ; 
	private HttpServletRequest request;
    private HttpServletResponse response;
    private CategoryDAO categoryDAO;
    
	public BookService(HttpServletRequest request ,  HttpServletResponse response) {
		this.bookDAO = new BookDAO(); 
		categoryDAO = new CategoryDAO();
		this.request  = request ; 
		this.response = response;
	}
	
	public void BookList() throws ServletException, IOException{
		request.setAttribute("books", bookDAO.listAll());
		RequestDispatcher("books_list.jsp", request , response);
	}
	
	public void deleteBook() throws ServletException, IOException {
		 Integer id = Integer.valueOf(request.getParameter("id"));
		 System.out.println("id ==> "+id);
		 Book book = get(id);
		 
		 if(book == null){
			 request.setAttribute("message", "Book deleted");
		 }else {
			 bookDAO.delete(id);
			 request.setAttribute("message", "Book "+id+" deleted successfully ");
		 }	
		 BookList();
	}
	
	public void showBookForm() {
		 SetCategoryListToRequest(request);
		 request.setAttribute("massage", "");
	     // change page 
		 RequestDispatcher("book_form.jsp", request , response);
	}
	
	public void addBook(HttpServletRequest request, HttpServletResponse response , byte[] image) throws ServletException, IOException {
		if(isExist(request.getParameter("title"))) {
			request.setAttribute("message", "This Book is alrady exsist");
			RequestDispatcher("book_form.jsp",request, response); 
		}else{
			createBook(request , response, image);
			BookList();
		}
	}
	
	private void createBook(HttpServletRequest request, HttpServletResponse response ,byte[] image) {
		Book book = new Book();
		book.setImage(image);
		selectData(book , request ,response);
		bookDAO.create(book);
	}
	
	public void editBook() throws ServletException, IOException {
		 Integer id = Integer.valueOf(request.getParameter("id"));
		 Book book = get(id);
		 if(book == null) {
			 request.setAttribute("message", "This Book Deleted from anathor admin");
			 BookList();
		 }else {
			 SetCategoryListToRequest(request);	
			 request.setAttribute("book", book);
		     // change page 
			 RequestDispatcher("book_edit.jsp" , request, response); 
		 }
	}
	
	public void updateBook() throws ServletException, IOException {
		
		String title = request.getParameter("title");
		Integer id = Integer.valueOf(request.getParameter("id"));
		List<Book> books = findByTitle(title);
		if(books.size() > 0 && books.get(0).getBookId() != id) {
			 request.setAttribute("message", "Book "+title+" is alrady exsist");
			 request.setAttribute("id", id);
			 editBook();
		}else {
			 Book book = get(id);
			 selectData(book , request ,response);
			 bookDAO.update(book);	
			 request.setAttribute("message", "Book "+book.getTitle()+" Updated succsufuly");
			 BookList();
		}
	}
	
	public Book get(Integer id ) {
		return bookDAO.get(id);
	}
	
	public List<Book>  findByTitle(String title) {
		return bookDAO.findByTitle(title);
	}
	
	public List<Book> newList(){
		return bookDAO.newList();
	}

	public long count() {
		return bookDAO.count();
	} 
	
	
	public List<Book> findByKeyWord(String key){
		return  bookDAO.findBookByKeyWord(key);
	}

	public List<Book> mostFav(int max) {
		 
		return bookDAO.mostFav(max);
	}

	public List<Book> bestSealing(int max) {
		 
		return bookDAO.bestSealing(max);
	}

	// book helper method 
	
	
	protected String GetCurrentDate() {
	     Date date = new Date() ;
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:m:ss");
	    return formatter.format(date);
	}
	
	protected  Category GetCategoy(HttpServletRequest request) {
		 Integer  id =Integer.valueOf(request.getParameter("category")) ;
		 Category category = categoryDAO.get(id);
		 System.out.println(category.getCategoryId());
		return category; 
	}
	
	protected void SetCategoryListToRequest(HttpServletRequest req){
		List<Category> categoryList = categoryDAO.listAll();
		req.setAttribute("categoryList", categoryList);
	}
	
	protected byte[] GetImage(HttpServletRequest request, HttpServletResponse response) {
		byte[] image  =null; 
		try {
			Part part = request.getPart("image");
			if(part !=null && part.getSize()>0) {
				
				 long size = part.getSize();
				 image = new byte[(int)size];
				 
				 InputStream inputStream = part.getInputStream();
				 inputStream.read(image) ;
				  
				 inputStream.close();
			}
		} catch (IOException | ServletException e) {	 
			e.printStackTrace();
		}  
		return image ;
	}
	
	protected boolean isExist(String title) {
		// slect books
		List<Book> list =  findByTitle(title);
		
		if(list.size()==0) {
			return false ;
		}
		return true ;
	}
	
	protected Book SetBookData(Book book , String title , String author , String description ,String isbn,String lastUpdateTime ,String publishDate,Category category,double price ) {
		book.setTitle(title);
		book.setAuthor(author);
		book.setCategory(category);
		book.setDescription(description);
		book.setIsbn(isbn);
		book.setLastUpdateTime(lastUpdateTime);
		book.setPublishDate(publishDate);
		book.setPrice(price);
		return book ;
	}
	
	protected Book selectData(Book book ,HttpServletRequest request, HttpServletResponse response)  {
		// declare attribute 
		String title , author , description, isbn ,publishDate ="" , lastUpdateTime="";	   
		double price;
		Category category = null  ; 
		// get data 
		 
		price = Double.valueOf(request.getParameter("price"));
		System.out.println(request.getParameter("price"));
		title = request.getParameter("title");
		author = request.getParameter("author");
		description = request.getParameter("description");
		isbn = request.getParameter("isbn");
		lastUpdateTime = GetCurrentDate();
		publishDate = request.getParameter("publish-date");
		//price =  request.getParameter("price") 

		category = GetCategoy(request);

	   return this.SetBookData(book , title , author , description ,  isbn, lastUpdateTime , publishDate, category, price);
		 
	}
	

	protected void RequestDispatcher(String page , HttpServletRequest request, HttpServletResponse response ) {
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}  		 
	}
	
	public void viewBookDetails() throws ServletException, IOException {
		  	ReviewService  reviewService =  new ReviewService(request, response);
		  	String stringId  = request.getParameter("id");
			 Integer id = Integer.valueOf(stringId);
			 List<Review> reviewList = reviewService.findByBookId(stringId);
			 Book book = get(id);
			
			 if(book==null) {
				 request.setAttribute("message", "Sorry, the book isn't available");
				 HomePageService homePageService = new HomePageService(request, response);
				 homePageService.loadHomePage();
			 }else {
				 Category category = categoryDAO.CategoryLazy(book.getCategory().getCategoryId()); 
					
				  
				 
				Set<Book> sourceSet = category.getBooks();

				Set<Book> books = new HashSet<Book>();

				int counter = 0;
				for (Book b : sourceSet) {
				    if (counter < 6) {
				        books.add(b); 
				        counter++; 
				    } else {
				        break; 
				    }
				}
					     		 
				
				    System.out.println("reviewList ==>"+reviewList);
	 				request.setAttribute("book", book);
					request.setAttribute("reviewList", reviewList);
					request.setAttribute("books", books);
					WishList wishlist = (WishList) request.getSession().getAttribute("wishlist");
					boolean isExsit = wishlist.isExsit(id);
					request.setAttribute("isFav", isExsit);
					RequestDispatcher dispatcher = request.getRequestDispatcher("frontend/book_detail_page.jsp");
					dispatcher.forward(request, response); 
			 }
	}
	
	public void searchBook() throws ServletException, IOException {
		  String keyword = request.getParameter("key");
		  List<Book> books = findByKeyWord(keyword);
		 System.out.println(books.size());System.out.println(books.size());
		 System.out.println(keyword);
		  request.setAttribute("books", books);
		  request.setAttribute("key", keyword);
		  
		  
		     String page = "/frontend/search_result.jsp" ; 
			 RequestDispatcher dispatcher  = request.getRequestDispatcher(page);
			 dispatcher.forward(request, response);
	}

}
