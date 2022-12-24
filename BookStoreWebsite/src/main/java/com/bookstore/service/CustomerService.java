package com.bookstore.service;

import com.bookstore.dao.CustomerDAO;

public class CustomerService {
	private CustomerDAO customerDAO ; 
	
	CustomerService(){
		customerDAO = new CustomerDAO();
	}
	
	 
}
