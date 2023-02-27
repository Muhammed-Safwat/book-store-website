package com.bookstore.controller.customer;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
@WebFilter("/profile/*")
public class CustomerLoginFilter extends HttpFilter implements Filter {
 
	private static final long serialVersionUID = 1L;


	public CustomerLoginFilter() {
        super();
    }


	public void destroy() {
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		 
			 System.out.println("<====> customer fillter");
			 HttpServletRequest httpRequest = (HttpServletRequest) request ;
			 HttpSession session = httpRequest.getSession(false);
			  
		 
			 boolean loggedIn = session ==null || session.getAttribute("customer") == null ; 
			 
			 if(loggedIn) {
				 System.out.println(" دخل اهوووووووووووووووو");
				 if(request.getAttribute("url")==null){
					 httpRequest.setAttribute("url", httpRequest.getRequestURL());
					 System.out.println("ssssssssssssssss      " 
							 +httpRequest.getRequestURL());
				 }
				 httpRequest.getRequestDispatcher("/login-customer").forward(request, response);
			 }else {
				 System.out.println("مش دخل اهووووووووووووو");
				 chain.doFilter(request, response);
			 }
		 

	}


	public void init(FilterConfig fConfig) throws ServletException {
		 
	}

}
