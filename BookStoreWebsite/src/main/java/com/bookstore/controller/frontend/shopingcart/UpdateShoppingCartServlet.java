package com.bookstore.controller.frontend.shopingcart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Book;
import com.bookstore.service.BookService;

@WebServlet("/update-cart")
public class UpdateShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public UpdateShoppingCartServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.valueOf(request.getParameter("id"));
		Integer quantity = Integer.valueOf(request.getParameter("quantity"));
		ShopingCart cart = (ShopingCart) request.getSession().getAttribute("cart");
		 
		 cart.updateCart(id, quantity);
		 cart.showShoppingCart() ;
		 
		request.getSession().setAttribute("cart",cart);
		response.sendRedirect(request.getContextPath()+"/view_cart");
	}

}
