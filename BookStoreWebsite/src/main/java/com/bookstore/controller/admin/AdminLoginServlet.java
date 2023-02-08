package com.bookstore.controller.admin;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		 System.out.println(user);
		 
		if(user != null &&   user.getPassword()==password ) {
			 request.setAttribute("massage", "invalid email and passward");
			 RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/login");
			 dispatcher.forward(request, response);
		}else {
			
		    request.setAttribute("massage", "");
		 
		    
		    ServletContext context = request.getServletContext();
		     
		     context.setAttribute("admin", user.getFirstName());
		     System.out.println(user.getFirstName());
			 System.out.println( request.getServletContext().getAttribute("admin"));
		   /* 
		    
			    Cookie cookie =new Cookie("name",user.getFirstName());
			    response.addCookie(cookie);
			    response.
			    System.out.println(request.getAttribute("admin"));
		    
		    */
		    
 		    request.getSession().setAttribute("useremail", email);
		    response.sendRedirect("homepage");
		    
		}
	}
}
