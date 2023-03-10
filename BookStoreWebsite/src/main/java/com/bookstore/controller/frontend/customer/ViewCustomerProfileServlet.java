package com.bookstore.controller.frontend.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Customer;
import com.bookstore.service.CustomerService;

@WebServlet("/profile/view-profile")
public class ViewCustomerProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CustomerService customerService;
    
    public ViewCustomerProfileServlet() {
        super();
        customerService = new CustomerService();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 Customer customer  = (Customer) request.getSession().getAttribute("customer");
		 System.out.println(getClass()+"cusotmer ====> "+customer.toString());
		 request.getRequestDispatcher("../frontend/veiw_profile.jsp").forward(request, response); 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
