package com.bookstore.dao;

import java.util.List;

import com.bookstore.entity.User;

public class  UserDAO extends JpaDAO<User> implements GenericDAO<User> {

	public UserDAO() {
		super();
	}

	@Override
	public User create(User user) {
		return  super.create(user);
	}

	@Override
	public User update(User user) { 
		return super.update(user);
	}

	@Override
	public User get(Integer id) {		 
		return super.get(User.class, id) ;
	} 

	@Override
	public void delete(Integer id) {
		  super.delete(User.class , id);
	}

	@Override
	public List<User> listAll() {
		 
		return super.listAll("from User");
		
	}
	
	

	@Override
	public long count() {
		return super.count("select count(*) from User");
	}

 
	public List<User> findByEmail(String email) {
	 List<User> user = super.findBy("User", "email", email);
	 	return user ; 
	}
	
	
	 

}
