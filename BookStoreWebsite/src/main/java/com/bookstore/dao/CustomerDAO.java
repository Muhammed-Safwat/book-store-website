package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.Customer;

public class CustomerDAO extends JpaDAO<Customer> implements GenericDAO<Customer>{

	@Override
	public Customer create(Customer customer) {
		 
		return super.create(customer);
	}

	@Override
	public Customer update(Customer customer) {
		 
		return super.update(customer);
	}

	@Override
	public Customer get(Integer id) {
		 
		return super.get(Customer.class, id);
	}

	@Override
	public void delete(Integer id) {
		 super.delete(Customer.class, id);
	}
   

	@Override
	public List<Customer> listAll() {
		 
		return super.listAll("from Customer");
	}

	@Override
	public long count() {
		 
		return super.count("select count(*) from Customer");
	}
   
	
	

}
