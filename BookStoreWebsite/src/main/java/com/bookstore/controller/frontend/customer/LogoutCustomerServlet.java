package com.bookstore.controller.frontend.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
@WebServlet("/logout")
public class LogoutCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LogoutCustomerServlet() {
        super();
        
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.getSession().removeAttribute("customer");
		    HttpSession session = request.getSession();
		    
		    // Invalidate the session (clear all data)
		    session.invalidate();
		    
		    // Redirect to the desired page after clearing the session
		    response.sendRedirect(request.getContextPath());
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		doGet(request, response);
	}

}
