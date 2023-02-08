package com.bookstore.controller.admin.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Customer;
import com.bookstore.service.CustomerService;
 
@WebServlet("/admin/list_customer")
public class ListCustomerService extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CustomerService customerService ;    
    
    public ListCustomerService() {
        super();
        customerService= new CustomerService() ;
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Customer> list = 	customerService.listCustomer();
		request.setAttribute("customers", list);
		RequestDispatcher dispatcher =  request.getRequestDispatcher("customer_list.jsp");
		dispatcher.forward(request, response);
		for(Customer c  :list ) System.out.println(c.toString());
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		doGet(request, response);
	}

}
