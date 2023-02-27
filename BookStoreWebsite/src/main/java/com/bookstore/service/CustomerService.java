package com.bookstore.service;

import java.util.List;
import com.bookstore.dao.CustomerDAO;
import com.bookstore.entity.Customer;

public class CustomerService {
	private CustomerDAO customerDAO ; 
	
	public CustomerService(){
		customerDAO = new CustomerDAO();
	}
	
	public List<Customer> listCustomer() {
		return customerDAO.listAll();
	}
	
	public void createCustomer(Customer customer) {
		customerDAO.create(customer);
	}
	
	
	public Customer getCustomerById(Integer id) {
		return customerDAO.get(id);
	}
	
	public List<Customer> findByEmail(String email) {	 
		return  customerDAO.findBy("Customer", "email", email); 
	}
	
	public Customer UpdateCustomer(Customer customer) {
		return customerDAO.update(customer);
	}
	
	public void delete(Integer id) {
		customerDAO.delete(id);
	}
	
	
	public List<Customer> CheckLogin(String email , String password) {
        List<Customer> customer = findByEmail(email);
        if(customer.size()>0 && password.compareTo(customer.get(0).getPassword())==0) {
			return customer; 
		} 	
		return customer; 
	}
 
	
	 
}
