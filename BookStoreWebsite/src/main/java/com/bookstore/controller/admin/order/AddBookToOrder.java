package com.bookstore.controller.admin.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.OrderService;
 
@WebServlet("/admin/add_book_To_order")
public class AddBookToOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderService order = new OrderService(request, response);
		order.addBookToOrder();
		order.editOrder();
	}

}
