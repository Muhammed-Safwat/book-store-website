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
import com.bookstore.controller.frontend.shopingcart.WishList;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;
import com.bookstore.service.CategoryServices;

@WebFilter("/*")
public class MainFilter extends HttpFilter implements Filter {
       
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7911008093368479078L;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		if(request.getParameter("massage") == null)
			request.setAttribute("massage", "");
		
		
		HttpServletRequest httpreRequest  =(HttpServletRequest) request;
		HttpSession session = httpreRequest.getSession(true);
		 
		ServletContext context = request.getServletContext();
		 if(context.getAttribute("categories")==null) {
			    CategoryDAO categoryDAO  = new CategoryDAO();
				List<Category>  categoryList = categoryDAO.listAll();
				context.setAttribute("categories", categoryList);
		 }
	 
		 if(session.getAttribute("cart")==null) {
			 session.setAttribute("cart", new ShopingCart());	 
		 } 
			 
		 
		 if(session.getAttribute("wishlist")==null) {
			 WishList wishlist  = new WishList();
			 session.setAttribute("wishlist", wishlist);
	     } 
		 
		 chain.doFilter(request, response); 
	}


 

}
