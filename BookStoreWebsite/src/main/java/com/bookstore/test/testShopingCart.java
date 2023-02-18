package com.bookstore.test;

import java.util.Map;

import com.bookstore.controller.frontend.shopingcart.ShopingCart;
import com.bookstore.entity.Book;

public class testShopingCart {
	
	 public static void main(String[] args) {
		 ShopingCart cart = new ShopingCart(); 
			
		 	Book b1 = new Book();
			Book b2 = new Book();
			Book b3 = new Book();
			Book b4 = new Book();
			
			// add book 
			cart.addItem(b1);
			cart.addItem(b1);
			cart.addItem(b1);
			cart.addItem(b2);
			cart.addItem(b3);
			cart.addItem(b4);
			
			for (Map.Entry<Book, Integer> entry : cart.getItems().entrySet()) {
	            System.out.println("Key : " + entry.getKey() + " Value : " + entry.getValue());
	        }
			
			// remove item 
			System.err.println("remove item");
			 
			for (Map.Entry<Book, Integer> entry : cart.getItems().entrySet()) {
	            System.out.println("Key : " + entry.getKey() + " Value : " + entry.getValue());
	        }
			
			// getTotal queantity 
			System.err.println("getTotal Quentity");
			System.out.println("Total Quentity == "+cart.getTotalQuantity());
			
			/// get TotalAmount 
			System.err.println("Get ToTal Amount");
			b1.setPrice(10);b2.setPrice(10);b3.setPrice(10); 
			System.out.println("Total Amount == "+cart.GetTotalAmount());
			
			
			// clear cart 
			System.err.println("====clear=====");
			cart.clear();
			System.out.println(cart.getItems().size());
	}
}
