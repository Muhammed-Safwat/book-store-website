package com.bookstore.controller.admin.customer;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Customer;
import com.bookstore.service.CustomerService;
 
@WebServlet("/admin/edit_customer")
public class EditCustomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerService customerService ; 
	Integer id ;
	private Customer customer ;
	
    public EditCustomeServlet() {
        super();
        customerService = new CustomerService();
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      id  = Integer.valueOf(request.getParameter("id"));
	    System.out.println("id ==> " + id);
	     this.customer  = customerService.getCustomerById(id);
	    RequestDispatcher dispatcher ;
	    if(customer==null) {
	    	request.setAttribute("massage", "This customer deleted by anther admin");
	    	 dispatcher =request.getRequestDispatcher("list_customer");
	    }else {
	    	request.setAttribute("customer", customer);
	    	request.setAttribute("massage", "");
	    	dispatcher =request.getRequestDispatcher("edit_customer.jsp");
	    }
	    
	     
	    dispatcher.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getDataFromRequest(request , response);
		customerService.UpdateCustomer(this.customer);
		RequestDispatcher dispatcher =request.getRequestDispatcher("list_customer");
	    dispatcher.forward(request, response);
	}
	
	
		private Customer getDataFromRequest(HttpServletRequest request, HttpServletResponse response) {
			 
			 String email = request.getParameter("email");
			 List<Customer> list =  customerService.findByEmail(email);
			
			 if(list.size() > 0 && list.get(0).getCustomerId() != this.id) {
				request.setAttribute("message", "this Account Alrady exsist!");
			} else {
			 customer.setAddress(request.getParameter("address"));
			 customer.setCity(request.getParameter("city"));
			 customer.setCountry(request.getParameter("country"));
		     customer.setEmail(email);
			 customer.setFullName(request.getParameter("name"));
			 customer.setPassword(request.getParameter("password"));
			 customer.setPhone(request.getParameter("phone"));
			 
			 customer.setZipcode(request.getParameter("zip-code"));
			 
			}
		
			return customer ; 
		}

}
