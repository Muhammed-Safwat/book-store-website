package com.bookstore.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.frontend.shopingcart.ShopingCart;
import com.bookstore.entity.Book;

public class ShoppingCartService {
	private HttpServletRequest request ; 
	private HttpServletResponse response ;
	
	public ShoppingCartService(HttpServletRequest request,HttpServletResponse response) {
		 this.request = request ;
		 this.response = response;
	}
	
	public void addToShippingCart() throws ServletException, IOException {
		 Integer id = Integer.valueOf(request.getParameter("id"));
		 Integer quantity = Integer.valueOf(request.getParameter("quantity"));
		 BookService bookService =  new BookService(request, response);
		 Book book  = bookService.get(id);  
		 request.setAttribute("book", book);
		 request.setAttribute("total", book.getPrice()*quantity);
		 if(request.getSession()!=null) {
			ShopingCart cart = (ShopingCart)  request.getSession().getAttribute("cart");
			cart.addItem(book, quantity);
			cart.showShoppingCart();
		 }
		 request.getRequestDispatcher("frontend/added_to_cart.jsp").include(request, response);
	}
	
	public void deleteShippingCart() throws IOException {
		Integer id = Integer.valueOf(request.getParameter("id"));
		ShopingCart cart = (ShopingCart) request.getSession().getAttribute("cart");
		cart.removeItem(id);
		request.getSession().setAttribute("cart",cart);
		response.sendRedirect(request.getContextPath()+"/view_cart");
	}
	
	public void showViewCart() throws ServletException, IOException {
		ShopingCart cart  =	(ShopingCart) request.getSession().getAttribute("cart");
		request.setAttribute("cart", cart);
		request.getRequestDispatcher("frontend/shoping_cart.jsp").include(request, response);
	}

	public void updateCart() throws IOException {
		Integer id = Integer.valueOf(request.getParameter("id"));
		Integer quantity = Integer.valueOf(request.getParameter("quantity"));
		ShopingCart cart = (ShopingCart) request.getSession().getAttribute("cart");
		 
		 cart.updateCart(id, quantity);
		 cart.showShoppingCart() ;
		 
		request.getSession().setAttribute("cart",cart);
		response.sendRedirect(request.getContextPath()+"/view_cart");	
	}
}
