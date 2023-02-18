package com.bookstore.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bookstore.controller.frontend.shopingcart.ShopingCart;
import com.bookstore.entity.Category;
import com.bookstore.service.CategoryServices;

@WebFilter("/*")
public class MainFilter extends HttpFilter implements Filter {
       
 
    public MainFilter() {
        super();
  
    }

	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		

		HttpServletRequest httpreRequest  =(HttpServletRequest) request;
		HttpSession session = httpreRequest.getSession(true);
		 
		ServletContext context = request.getServletContext();
		 if(context.getAttribute("categories")==null) {
			    CategoryServices categoryServices  = new CategoryServices();
				List<Category>  categoryList = categoryServices.list();
				context.setAttribute("categories", categoryList);
		 }
	 
		 if(session.getAttribute("cart")==null) {
			 System.out.println("===========> shoppingcart created");
			 session.setAttribute("cart", new ShopingCart());	 
		 } 
			 
		
		 System.out.println("main filter ==>");
		 chain.doFilter(request, response); 
	}


	public void init(FilterConfig Config) throws ServletException {
		 
	}

}
