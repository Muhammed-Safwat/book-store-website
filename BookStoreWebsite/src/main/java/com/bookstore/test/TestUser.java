package com.bookstore.test;

import java.util.List;

import com.bookstore.entity.User;
import com.bookstore.service.UserServices;

public class TestUser {
	
	 public static void main(String[] args) {
		 
		 
		 UserServices services  = new UserServices() ; 
	   List<User> users = services.listUser();
		 for( User i:users ) {
			 System.out.println(i.getFirstName());
		 }
	} 
}
