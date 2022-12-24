package com.bookstore.test;

import java.util.List;

import com.bookstore.dao.CustomerDAO;
import com.bookstore.entity.Customer;

public class TestCustomer {
	public static void main(String[] args) {
		Customer customer  = new Customer(); 
	 customer.setAddress("adress2");
		customer.setEmail("email2");
		customer.setCity("city2");
		customer.setFullName("first name2");
	    customer.setCountry("country2");
		customer.setPhone("phone2");
		customer.setZipcode("09232");
		customer.setPassword("1232112");
		customer.setRegisterDate("2022-12-28");
		 
		CustomerDAO customerDAO = new CustomerDAO();
		
		
		// customer= customerDAO.create(customer);
		 customerDAO.delete(12) ;
		
		List<Customer> list = customerDAO.listAll();
		for(Customer i : list) System.out.println(i.toString());
	}
}
