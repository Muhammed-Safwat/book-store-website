package com.bookstore.controller.admin;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/admin/*")
public class AdminLoginFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;
 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
																				throws IOException, ServletException {
		HttpServletRequest httpRequest  =(HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(true);
		
        if(session.getAttribute("admin_url") == null){
        	session.setAttribute("admin_url", httpRequest.getRequestURL());
		 }
        
        
		String loginURI = httpRequest.getContextPath() + "/admin/login";
		boolean loginRequest = httpRequest.getRequestURI().equals(loginURI);
		
		// check if loggedIn
		boolean loggedIn = ( session != null ) && ( session.getAttribute("admin")!= null) ;
		
		if(loggedIn || loginRequest) {
			 chain.doFilter(request, response); 
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}	
		
	}

	 @Override
	public void destroy() {
		super.destroy();
	}

}
