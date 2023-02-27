package com.bookstore.controller.frontend.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.OrderService;

@WebServlet("/profile/checkout")
public class CheckoutShopingCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private OrderService orderService;
  
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		orderService = new OrderService(request, response);
		orderService.ShowCheckOut();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
