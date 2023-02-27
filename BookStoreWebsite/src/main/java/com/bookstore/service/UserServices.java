package com.bookstore.service;

import java.util.List;

import com.bookstore.dao.UserDAO;
import com.bookstore.entity.User;

public class UserServices {
	private UserDAO userDAO = null;
	
	public UserServices(){
		userDAO = new UserDAO();
	}
	
	public List<User> listUser() {
		return userDAO.listAll();
	}
	
	public void createUser(String name ,String email ,String password) {
		User user = new User(name , email , password);
		userDAO.create(user);
	}
	
	public List<User> findByEmail(String email) {
		return userDAO.findByEmail(email);
	}
	
	public User getById(Integer id) {
		return userDAO.get(id);
	}
	
	public User UpdateUser(User user) {
		return userDAO.update(user);
	}
	
	public void delete(Integer id) {
	   userDAO.delete(id);
	}
	
	public  User  checkLogin(String email , String password) {
	    List<User> users = userDAO.findByEmail(email);
	    
	    if(users.size()==0) return null ;
	    
	    System.out.println(users.get(0).getPassword());
	   
	    	return users.get(0) ;
	    
	}

	public long count() {
		return userDAO.count();
	}
}
