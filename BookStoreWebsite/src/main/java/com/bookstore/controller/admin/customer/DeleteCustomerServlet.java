package com.bookstore.controller.admin.customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bookstore.entity.Customer;
import com.bookstore.service.CustomerService;

 
@WebServlet("/admin/delete_customer")
public class DeleteCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CustomerService customerService ; 
 
    public DeleteCustomerServlet() {
        super();
        customerService = new CustomerService() ; 
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    Integer id  = Integer.valueOf(request.getParameter("id"));
	    System.out.println("id ==> " + id);
	    Customer customer  = customerService.getCustomerById(id);
	    if(customer==null) {
	    	request.setAttribute("massage", "This customer deleted by anther admin");
	    }else {
	    	customerService.delete(id);
	    	 System.out.println("customer deleted ==>");
	    	request.setAttribute("massage", "customer deleted succssfully");
	    }
	    
	    RequestDispatcher dispatcher =request.getRequestDispatcher("list_customer");
	    dispatcher.forward(request, response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
	}

}
