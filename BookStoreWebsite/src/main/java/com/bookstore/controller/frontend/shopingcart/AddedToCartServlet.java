package com.bookstore.controller.frontend.shopingcart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.ShoppingCartService;

@WebServlet("/add_to_cart")
public class AddedToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ShoppingCartService cartService = new ShoppingCartService(request, response);
		cartService.addToShippingCart();
	}      
 
}
