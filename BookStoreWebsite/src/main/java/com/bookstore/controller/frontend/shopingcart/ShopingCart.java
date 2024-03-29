package com.bookstore.controller.frontend.shopingcart;

import java.util.HashMap;
import java.util.Map;

import com.bookstore.entity.Book;

public class ShopingCart {
	private Map<Book, Integer> cart  = new HashMap<>();
	
	public int totalItems() {
		return cart.size();
	}
	
	public void addItem(Book book) {
		addItem(book , 1);
	}
	
	public void addItem(Book book , Integer quantity) {
		boolean a = false ;
		if(cart.size()>0) {
			for(Map.Entry<Book, Integer> entry : cart.entrySet()) {
				if(entry.getKey().getBookId() == book.getBookId()){
					a=true ;
					Integer q = cart.get(entry.getKey()) + quantity;
					cart.put(entry.getKey(), q);
					break; 
				}
			} 
		}
		
		if(!a) {
			cart.put(book, quantity);
		}
		 
	}
	
	public void removeItem(Integer id) {	 
		Book book = findBookInCart(id); 
		cart.remove(book);
	}
	
	public Map<Book , Integer> getItems(){
		return this.cart;
	}
	
	public int getTotalQuantity() {
		int total = 0 ; 
		for(Map.Entry<Book, Integer> entry : cart.entrySet()) {
			total += entry.getValue();
		} 
		return total ;
	}
	
	public double GetTotalAmount() {
		double total = 0.0f; 
		for(Map.Entry<Book, Integer> entry : cart.entrySet()) {
			int quentity = entry.getValue();
			total +=(quentity * entry.getKey().getPrice());
		} 
		return total ;	
	}
	
	public double getTax() {
		double total = 0.0f; 
		for(Map.Entry<Book, Integer> entry : cart.entrySet()) {
			int quentity = entry.getValue();
			total +=(quentity * 1.0);
		} 
		return total ;
	}
	
	public double getShippingFee() {
		double total = GetTotalAmount(); 
		 
		return total * .1 ;
	}
	
	 
	
	public void clear() {
		cart.clear();
	}
	
	public void showShoppingCart() {
		 
	}
	
	public void updateCart(Integer id , int q) {
		Book book = findBookInCart(id); 
		cart.put(book, q);
	}
	
	public Book findBookInCart(Integer id) {
		for(Map.Entry<Book, Integer> entry : cart.entrySet()) {
			if(entry.getKey().getBookId()==id){
				return entry.getKey();
			}
		} 
		return null;
	}
}
