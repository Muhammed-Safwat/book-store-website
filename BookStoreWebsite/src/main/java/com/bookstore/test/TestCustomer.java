package com.bookstore.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.bookstore.dao.CustomerDAO;
import com.bookstore.entity.Customer;
import com.bookstore.service.CustomerService;

public class TestCustomer {
	public static void main(String[] args) {
		Customer customer  = new Customer(); 
	/* customer.setAddress("adress2");
		customer.setEmail("email2");
		customer.setCity("city2");
		customer.setFullName("first name2");
	    customer.setCountry("country2");
		customer.setPhone("phone2");
		customer.setZipcode("09232");
		customer.setPassword("1232112");
		customer.setRegisterDate("2022-12-28");*/
//		 
//		CustomerService customerDAO = new CustomerService();
//		List<Customer> list = customerDAO.findByEmail("email");
//		//System.out.println(customer.toString());
//		// customer= customerDAO.create(customer);
//		// customerDAO.delete(12) ;
//		
//		 //List<Customer> list = customerDAO.listCustomer();
//		for(Customer i : list) System.out.println(i.toString());
		 
	}
	
	public static  String GetCurrentDate() {
	     Date date = new Date() ;
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:m:ss");
	    return formatter.format(date);
	}
}
