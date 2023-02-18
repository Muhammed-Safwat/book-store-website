package com.bookstore.controller.customer;

import java.io.IOException;
import java.util.List;

import javax.naming.Context;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.bookstore.entity.Customer;
import com.bookstore.service.CustomerService;

 
@WebServlet("/login-customer")
public class LoginCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CustomerService customerService ;  
    private String url = null ; 
    public LoginCustomerServlet() {
        customerService = new CustomerService();
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getAttribute("message") == null) {
			request.setAttribute("message", "");
		}
		if(request.getAttribute("url")!=null)
		 url =   request.getAttribute("url").toString();
	    
		 RequestDispatcher dispatcher = request.getRequestDispatcher("frontend/login.jsp");
		 dispatcher.forward(request, response);		 
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     String email , password; 
	     email = request.getParameter("email");
	     password = request.getParameter("password");
	     System.out.println(email +"====="+password);
	  
	     List<Customer> customerLogin = customerService.CheckLogin(email, password);
	    
	    System.out.println(customerLogin);
	    if(customerLogin.size()==0) {
	    	request.setAttribute("message", "Wrong email and password");
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("frontend/login.jsp");
		    dispatcher.forward(request, response);	
		    
	    }else {
	    	    request.getSession(false).setAttribute("customer", customerLogin.get(0));
	    	    
	    	    
	    	    if(url == null)
	    	    	response.sendRedirect(request.getContextPath());
	    	    else 
	    	    	response.sendRedirect(url);
	    }
		 
	}

}
