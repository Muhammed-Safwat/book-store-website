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

 
@WebServlet("/admin/create_customer")
public class CreatedCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CustomerService customerService ;  
    
    public CreatedCustomerServlet() {
        super();
        customerService = new CustomerService();
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher =request.getRequestDispatcher("customer_form.jsp");
	    dispatcher.forward(request, response);
	}

 
	private Customer getDataFromRequest(HttpServletRequest request, HttpServletResponse response) {
		 
		 Customer customer = null ;
		 String email = request.getParameter("email");
		 List<Customer> list =  customerService.findByEmail(email);
		
		 if(list.size() == 0) {
			 customer = new Customer(); 
			 customer.setAddressLine1(request.getParameter("addressLine1"));
			 customer.setAddressLine2(request.getParameter("addressLine2"));
			 customer.setCity(request.getParameter("city"));
			 customer.setState(request.getParameter("state"));
			 customer.setCountry(request.getParameter("country"));
		     customer.setEmail(email);
			 customer.setFirstName(request.getParameter("firstName"));
			 customer.setLastName(request.getParameter("lastName"));
			 customer.setPassword(request.getParameter("password"));
			 customer.setPhone(request.getParameter("phone"));
			 customer.setRegisterDate(GetCurrentDate());
			 customer.setZipcode(request.getParameter("zip-code"));
			 
		}
	
		return customer ; 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer  =  getDataFromRequest(request , response);
		RequestDispatcher dispatcher ; 
		if(customer != null ) {
			  customerService.createCustomer(customer);
			  dispatcher =request.getRequestDispatcher("list_customer");
			  request.setAttribute("message", "Customer added succssfully");
		}else {
			 request.setAttribute("message", "this Account Alrady exsist!");
			  dispatcher =request.getRequestDispatcher("customer_form.jsp");
		}
	   	  dispatcher.include(request, response);
	}
	
	private  String GetCurrentDate() {
	     Date date = new Date() ;
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:m:ss");
	    return formatter.format(date);
	}

}
