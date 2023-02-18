package com.bookstore.controller.admin;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
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


	public AdminLoginFilter() {
        super();
    }

	public void destroy() {
	}

 
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
 
		
		
		HttpServletRequest httpreRequest  =(HttpServletRequest) request;
		HttpSession session = httpreRequest.getSession(false);
		
		boolean loginRequest  =  httpreRequest.getRequestURI().equals(httpreRequest.getContextPath()+"/admin/homepage");
		boolean loggedIn = ( session != null ) &&( session.getAttribute("admin")!=null) ;
		
		System.out.println(loginRequest );
		System.out.println(loggedIn);
		
		if(loggedIn) {
			 chain.doFilter(request, response); 
			 System.out.println(1);
		}else {
         System.out.println(loggedIn);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/login");
			dispatcher.forward(request, response);
			System.out.println(3);
		}
		
		System.out.println(loggedIn);
		
	}

 
	public void init(FilterConfig fConfig) throws ServletException {
	
	}

}
