package com.bookstore.controller.customer;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Customer;
import com.bookstore.service.CustomerService;
 
@WebServlet("/profile/edit-customer-profile")
public class EditCustomerProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private  CustomerService customerService ; 
	private  Customer customer ; 
	 
	
    public EditCustomerProfile() {
         customerService = new CustomerService();
         
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     
		 request.getRequestDispatcher("../frontend/edit-customer-profile.jsp").forward(request, response);
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println(this.getClass()+ "==> method doPost() ===> update customer profile");
		 this.customer = (Customer) request.getSession().getAttribute("customer");
		 System.out.println(this.customer.toString());
		 updateCustomer(request);
		 request.getRequestDispatcher("../frontend/edit-customer-profile.jsp").forward(request, response);
	}
	
	private void updateCustomer(HttpServletRequest request) {
		 String email = request.getParameter("email");
		 List<Customer> list =  customerService.findByEmail(email);
		 
		 if(list.size() > 0 
				 && list.get(0).getCustomerId() != this.customer.getCustomerId()) {
			     request.setAttribute("message", "This Email Alrady exsist!");
 		 }else {
			 this.customer = getDataFromRequest(request);
			 customerService.UpdateCustomer(this.customer);
			 request.setAttribute("message", "Customer Updated sucssfully");
		 }
	}
	
	private Customer getDataFromRequest(HttpServletRequest request) { 
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

}
