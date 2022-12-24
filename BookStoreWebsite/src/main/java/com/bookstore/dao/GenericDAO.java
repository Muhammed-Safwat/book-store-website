package com.bookstore.dao;

import java.util.List;

public interface GenericDAO<E>{
	
	public E create(E t);
	
	public E update(E t);
	
	public E get(Integer id);
	
	public void delete(Integer id);
	
	public List<E> listAll();
	
	public long count();
	
}
