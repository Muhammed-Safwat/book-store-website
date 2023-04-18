package com.bookstore.service;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.BookOrderDAO;
import com.bookstore.dao.CustomerDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.dao.UserDAO;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Review;
import com.bookstore.entity.User;

public class UserServices {
	private UserDAO userDAO = null;
	private BookOrderDAO bookOrderDAO = null;
	private ReviewDAO reviewDAO;
	private CustomerDAO customerDAO = null;
	private BookDAO bookDAO ;
	private HttpServletRequest request ; 
	private HttpServletResponse response;
	
	public UserServices(HttpServletRequest request, HttpServletResponse response){
		userDAO = new UserDAO();
        reviewDAO = new ReviewDAO();
        bookOrderDAO = new BookOrderDAO();
        customerDAO = new CustomerDAO();
        bookDAO = new BookDAO();
		this.request = request ; 
		this.response = response;
	}
	
	public void listUser() throws ServletException, IOException {
		 request.setAttribute("users", userDAO.listAll());
		 RequestDispatcher dispatcher = request.getRequestDispatcher("user_list.jsp");           
		 dispatcher.forward(request, response); 
	}
	
	public void createUser() throws ServletException, IOException {
		String  name = request.getParameter("name");
		String  email = request.getParameter("email");
		String  password =  request.getParameter("password");

		if(findByEmail(email).size() > 0 ) {  
			 request.setAttribute("message" , "Email alrady exsist");
			 request.setAttribute("name",  name);
			 request.setAttribute("email",  email);
			 RequestDispatcher requestDispatcher  =  request.getRequestDispatcher("user_form.jsp"); 
			 requestDispatcher.include(request, response);
		}else {
			User user = new User(name , email , password);
			userDAO.create(user);
			request.getRequestURL().toString().replace("create-user", "list_user");
			request.setAttribute("message" , name+"created successfully");
			listUser(); 
		}	 
	}
	
	
	public void UpdateUser() throws ServletException, IOException {
		String  name = request.getParameter("name");
		String  email = request.getParameter("email");
		Integer id = Integer.valueOf(request.getParameter("id"));   
	 
		 User user =  getById(id);
		 List<User> us = findByEmail(email);
		 
		if(user!=null && us.size()> 0   &&  us.get(0).getUserId() != id ) {
			 request.setAttribute("message" , "Email "+email+" alrady exsist"); 
			 request.setAttribute("user",user);
			 RequestDispatcher requestDispatcher  =  request.getRequestDispatcher("edit_user.jsp"); 
			 requestDispatcher.forward(request, response);
		}else {
				user.setEmail(email);				 
				user.setFullName(name);
				userDAO.update(user);
			  request.setAttribute("message" , name+" updated sucssfully");
			  request.setAttribute("user" , user);
			  listUser();
		}
			
	}
	
	public void delete() throws ServletException, IOException {
		Integer id  = Integer.valueOf(request.getParameter("id"));
		User  user = getById(id);
		if(id==1){
			request.setAttribute("message","The default admin user account cannot be deleted");
		}else if(user != null && id != 1) {
			request.setAttribute("message",user.getFirstName()+" deleted");
			userDAO.delete(id); 
		}else {
			request.setAttribute("message","Could not find user");
		}
		listUser(); 				
	}
	
	public User checkLogin(String email , String password) {
	    List<User> users = userDAO.findByEmail(email);
	    
	    if(users.size()==0) return null ;
	    
	    System.out.println(users.get(0).getPassword());
	   
	    	return users.get(0) ;
	}	
	
	public void adminLogin() throws ServletException, IOException {
		 String email = request.getParameter("email");
		 String password = request.getParameter("password");
		 String url = null; 
		 
		 User  user = checkLogin(email , password);
		 
		 if(user == null || !(user != null && user.getPassword().equals(password))) {
			
			 request.setAttribute("message", "Invalid email and passward");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			
		 }else {
		     request.getSession(false).setAttribute("admin", user);
		     request.getSession().setAttribute("useremail", email);
		  
		    if(request.getSession().getAttribute("admin_url")!=null)
				 url =   request.getSession().getAttribute("admin_url").toString();
			 
		   if(url == null || url.endsWith("login"))
  	    	    response.sendRedirect(request.getContextPath()+"/admin/");
  	        else {
  	        	response.sendRedirect(url);
  	        }	
		}
	}
	
	public void setAttributes(HttpServletRequest request) {
		 request.setAttribute("totalOrders", bookOrderDAO.count());
		 request.setAttribute("totalReviews",reviewDAO.count()  );
		 request.setAttribute("totalCustomers",customerDAO.count());
		 request.setAttribute("totalBooks", bookDAO.count());
		 request.setAttribute("totalUsers",count());
		 System.out.println(bookOrderDAO.count());
		 System.out.println(customerDAO.count());
		 System.out.println(reviewDAO.count());
		 System.out.println(bookDAO.count());
	}
	
	public void LoadAdminHomePage() throws ServletException, IOException {
		List<BookOrder> orders =  bookOrderDAO.listAll(4);
		List<Review> reviews =  reviewDAO.listReviewWithBook(4); 
		
		 request.setAttribute("orders", orders);
		 request.setAttribute("reviews", reviews);
		 
		 setAttributes(request);
		 
		 RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		 dispatcher.forward(request, response);
	}

	public void showEditUserForm() throws ServletException, IOException {
		 Integer id = Integer.valueOf(request.getParameter("id"));  
		 User user = getById(id);		 
		 request.setAttribute("user",user);
		 
		RequestDispatcher requestDispatcher  =  request.getRequestDispatcher("edit_user.jsp"); 
		requestDispatcher.forward(request, response);
		
	}

	public List<User> findByEmail(String email) {
		return userDAO.findByEmail(email);
	}
	
	public User getById(Integer id) {
		return userDAO.get(id);
	}
	
	public long count() {
		return userDAO.count();
	}
}
