package com.bookstore.controller.frontend.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.OrderService;


@WebServlet("/profile/place_order")
public class PlaceOrderServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private OrderService orderService ;  
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		orderService = new OrderService(request, response);
		orderService.placeOrder();
	}

}
