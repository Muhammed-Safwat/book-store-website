package com.bookstore.controller.admin;

import java.io.IOException;
import java.net.http.HttpRequest;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;

import com.bookstore.entity.User;
import com.bookstore.service.UserServices;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private UserServices  userServices = null ;
	
    public AdminLoginServlet() {
        super();
        userServices = new  UserServices() ;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	if(request.getParameter("massage")==null || request.getParameter("massage")=="" )
    			request.setAttribute("massage", "");
    	
		 RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		 dispatcher.forward(request, response);
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String email = request.getParameter("email");
		 String password = request.getParameter("password");
		
		 User  user = userServices.checkLogin(email , password);
		 System.err.println( user != null && user.getPassword()!=(password));
		 
		 if(user == null || !(user != null && user.getPassword().equals(password))) {
			 request.setAttribute("massage", "invalid email and passward");
			 System.err.println("false ==============>");
			 // response.sendRedirect(request.getContextPath()+"/admin/login");	 
			 
			request.getRequestDispatcher("login.jsp").forward(request, response);;
			 
		 }else {
			 System.err.println("true ==============>");
		     request.setAttribute("massage", "");    
		     request.getSession(false).setAttribute("admin", user);
		   
 		    request.getSession().setAttribute("useremail", email);
		    response.sendRedirect("homepage");
		    
		}
	}
}
