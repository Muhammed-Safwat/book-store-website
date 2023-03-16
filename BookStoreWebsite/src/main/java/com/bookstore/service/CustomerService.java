package com.bookstore.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bookstore.dao.CustomerDAO;
import com.bookstore.entity.Customer;

public class CustomerService {
	private CustomerDAO customerDAO ; 
	private HttpServletRequest request ;
	private HttpServletResponse response;
	
	public CustomerService(HttpServletRequest request ,HttpServletResponse response){
		this.request = request;
		this.response = response;
		customerDAO = new CustomerDAO();
	}
	
	public void listCustomer() throws ServletException, IOException {	
		request.setAttribute("customers", customerDAO.listAll());
		RequestDispatcher dispatcher =  request.getRequestDispatcher("customer_list.jsp");
		dispatcher.forward(request, response);
	}
	
	public void showCustomerForm() throws ServletException, IOException {
		RequestDispatcher dispatcher =request.getRequestDispatcher("customer_form.jsp");
	    dispatcher.forward(request, response);
	}
	
	public void createCustomer() throws ServletException, IOException {		
		Customer customer  =  getDataFromRequest(request , response);
		if(customer != null ) {
			customerDAO.create(customer);			  
			  request.setAttribute("message", "Customer added succssfully");
			  listCustomer();
		}else {
			  request.setAttribute("message", "this Account Alrady exsist!");
			  showCustomerForm();
		}		
	}
	
	public void RegisterCustomer() throws IOException, ServletException{
		Customer customer  =  getDataFromRequest(request , response);
		 RequestDispatcher dispatcher ; 
		 if(customer != null ) {
			     customerDAO.create(customer);
				request.getSession().setAttribute("customer" ,customer );
			    response.sendRedirect("profile/view-profile");
			 
		}else {
			  request.setAttribute("message", "this Account Alrady exsist!");
			  dispatcher =request.getRequestDispatcher("frontend/customer_form.jsp");
			  dispatcher.include(request, response);
		}
	}
	
	
	public Customer getCustomerById(Integer id) {
		return customerDAO.get(id);
	}
	
	public List<Customer> findByEmail(String email) {	 
		return  customerDAO.findBy("Customer", "email", email); 
	}
	
	public void UpdateCustomer() throws ServletException, IOException {

		Integer id  = Integer.valueOf(request.getParameter("id"));
		String email = request.getParameter("email");
		Customer customer  = null;
		 if(CheckEmail(email ,id)) {
			request.setAttribute("message", "this Account Alrady exsist!");
			showEditFrom();
		} else {
			customer = getCustomerById(id);
			customer.setAddressLine1(request.getParameter("addressLine1"));
			customer.setAddressLine2(request.getParameter("addressLine2"));
			customer.setCity(request.getParameter("city"));
			customer.setState(request.getParameter("state"));
			customer.setCountry(request.getParameter("country"));
			customer.setEmail(email);
			customer.setFirstName(request.getParameter("firstName"));
			customer.setLastName(request.getParameter("lastName"));	 
			customer.setPhone(request.getParameter("phone"));		  
			customer.setZipcode(request.getParameter("zip-code"));
			customerDAO.update(customer);
			request.setAttribute("message", "Customer Updated Sucssfully!");
			listCustomer();
		}
		
		
	}
	
	private boolean CheckEmail(String email , int id) {	 
		 List<Customer> list = findByEmail(email);	 
		 return (list.size() > 0 && list.get(0).getCustomerId() != id)  ;
	}
	
	public void deleteCustomer() throws ServletException, IOException {
		
		Integer id  = Integer.valueOf(request.getParameter("id"));
	    Customer customer  = getCustomerById(id);
	    
	    if(customer == null) {
	    	request.setAttribute("message", "This customer deleted by anther admin");
	    }else {
	    	 customerDAO.delete(id);
	    	 System.out.println("customer deleted ==> ");
	    	 request.setAttribute("message", "customer deleted succssfully");
	    }   
	    listCustomer();
	}
	
	
	public List<Customer> CheckLogin(String email , String password) {
        List<Customer> customer = findByEmail(email);
        if(customer.size()>0 && password.compareTo(customer.get(0).getPassword())==0) {
			return customer; 
		} 	
		return customer; 
	}
	
	private Customer getDataFromRequest(HttpServletRequest request, HttpServletResponse response) {
		 
		 Customer customer = null ;
		 String email = request.getParameter("email");
		 List<Customer> list = findByEmail(email);
		
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

	private  String GetCurrentDate() {
	     Date date = new Date() ;
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:m:ss");
	    return formatter.format(date);
	}

	public void showEditFrom() throws ServletException, IOException {
		    Integer id  = Integer.valueOf(request.getParameter("id"));
		    System.out.println("id ==> " + id);
		     Customer customer  = getCustomerById(id); 
		    if(customer==null) {
		    	request.setAttribute("massage", "This customer deleted by anther admin");
		    	 listCustomer();
		    }else {
		    	request.setAttribute("customer", customer);
		    	request.setAttribute("massage", "");
		    	RequestDispatcher dispatcher =  request.getRequestDispatcher("edit_customer.jsp");
				dispatcher.forward(request, response);
		    }
		
	}
	
	private Customer getDataFromRequest(HttpServletRequest request , Customer customer) { 
		 customer.setAddressLine1(request.getParameter("addressLine1"));
		 customer.setAddressLine2(request.getParameter("addressLine2"));
		 customer.setCity(request.getParameter("city"));
		 customer.setState(request.getParameter("state"));
		 customer.setCountry(request.getParameter("country"));
	     customer.setEmail(request.getParameter("email"));
		 customer.setFirstName(request.getParameter("firstName"));
		 customer.setLastName(request.getParameter("lastName"));	 
		 customer.setPhone(request.getParameter("phone"));		  
		 customer.setZipcode(request.getParameter("zip-code"));
		return customer ; 
	}
 
	public  void updateCustomerInfo() throws IOException, ServletException {
		 Customer customer = (Customer) request.getSession().getAttribute("customer");
		 String email = request.getParameter("email");
		 List<Customer> list = findByEmail(email);
		 
		 if(list.size() > 0 
				 && list.get(0).getCustomerId() != customer.getCustomerId()) {
			     request.setAttribute("message", "This Email Alrady exsist!");
			     request.getRequestDispatcher("../frontend/edit_customer_profile.jsp").forward(request, response);
 		 }else {
 			  customer = getDataFromRequest(request ,customer);
			  customerDAO.update(customer);
			  request.setAttribute("message", "Customer Updated sucssfully");
			  response.sendRedirect("view-profile");
		 }
	}
	
	 
}
