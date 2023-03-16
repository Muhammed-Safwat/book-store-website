package com.bookstore.dao;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Category;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;
import com.bookstore.entity.Review;
import com.bookstore.entity.User;

public class JpaDAO<E>{
	SessionFactory factory = null  ;
	Session session =  null ;
	Transaction transaction = null;
	public void StartFactory(){
		this.factory = new Configuration()
				 .configure("hibernate.cfg.xml")
				 .addAnnotatedClass(User.class)
				 .addAnnotatedClass(Category.class)
				 .addAnnotatedClass(Customer.class)
				 .addAnnotatedClass(Book.class)
				 .addAnnotatedClass(Review.class)
				 .addAnnotatedClass(OrderDetail.class)
				 .addAnnotatedClass(BookOrder.class)
				 .buildSessionFactory();		
	}
	 
	public E create(E entity) {
		StartFactory();
		session = factory.getCurrentSession();
		session.beginTransaction();
		session.save(entity);
		session.getTransaction().commit();
		//this.factory.close();
		return entity;
	}
	
	public E update(E entity) {
		StartFactory();
		session = factory.getCurrentSession();
		session.beginTransaction();
		session.update(entity);
		session.getTransaction().commit();
		//this.factory.close();
		return entity;
	}
	
	public E get(Class<E> type , Integer id )
	{
		StartFactory();
		session = factory.getCurrentSession();
		session.beginTransaction();
	    E obj = session.get(type, id);
		session.getTransaction().commit();
		//session.close();
		//this.factory.close();
		return obj ;
	}

	public void delete(Class<E> type , Integer id ) {
		StartFactory();
		session = factory.getCurrentSession();
		session.beginTransaction();
	    session.delete(session.get(type , id ));
		session.getTransaction().commit();
		///this.factory.close();
	}
	
	public void deleteObject(Class<E> type , E obj ) {
		StartFactory();
		session = factory.getCurrentSession();
		session.beginTransaction();
	    session.delete(obj);
		session.getTransaction().commit();
		//this.factory.close();
	}
	
	public List<E> listAll(String quere) {
		StartFactory();
		List<E> list  = new LinkedList<E>();
		session = factory.getCurrentSession();
		transaction = session.beginTransaction();
		list =  (List<E>) session.createQuery(quere).getResultList();
		session.getTransaction().commit();
		//this.factory.close();
		return list ; 
	}
	
	public List<E> listAll(String quere , int max) {
		StartFactory();
		List<E> list  = new LinkedList<E>();
		session = factory.getCurrentSession();
		transaction = session.beginTransaction();
		list =  (List<E>) session.createQuery(quere).setMaxResults(max).getResultList();
		session.getTransaction().commit();
		//this.factory.close();
		return list ; 
	}
	
	public List<Object[]> listAllForMostFav(String quere , int max) {
		StartFactory();
		List<Object[]> list  = new LinkedList<Object[]>();
		session = factory.getCurrentSession();
		transaction = session.beginTransaction();
		list =  (List<Object[]>) session.createQuery(quere).setMaxResults(max).getResultList();
		session.getTransaction().commit();
		//this.factory.close();
		return list ; 
	}
	
	public long count(String quere) {
		StartFactory();
		session = factory.getCurrentSession();
		session.beginTransaction();
		long num = (Long) session.createQuery(quere).uniqueResult();
		session.getTransaction().commit();
		//this.factory.close();
		return num ; 
	}
	
	public List<E> findBy(String className , String attribute , String value) {
		StartFactory();
		session = factory.getCurrentSession();
		session.beginTransaction();
		List<E> list = session.createQuery("select u from "+className+" u where u."+attribute+" = '"+value+"'").getResultList();		 
		session.getTransaction().commit();
		//this.factory.close();
		return list; 
	}
	
	public List<E> decOrderList(String className , String  attr){
		StartFactory();
		session = factory.getCurrentSession();
		session.beginTransaction();
		List<E> list = session.createQuery("select u from "+className+" u order by u."+attr+" desc").setMaxResults(3).getResultList()	 ;
		session.getTransaction().commit();
		//this.factory.close();
		return list; 
	}
	
	public List<E> findByKeword(String className , String attr , String keyword){
		StartFactory();
		session = factory.getCurrentSession();
		session.beginTransaction();
		List<E> list = session.createQuery("select b from "+className+" b where b."+attr+" like '%"+keyword+"%'").getResultList()	 ;
		session.getTransaction().commit();
		//this.factory.close();
		return list;
	}
	
	public List<E> findByTowKewords(String className , String attr1 , String keyword1 , String attr2 , String keyword2){
		StartFactory();
		session = factory.getCurrentSession();
		session.beginTransaction();
		List<E> list = session.createQuery("select b from "+className+" b where b."+attr1+" like '%"+keyword1+"%' and b."+attr2+" like '%"+keyword2+"%'").getResultList()	 ;
		session.getTransaction().commit();
		//this.factory.close();
		return list;
	}
	
	public void updateValue(String className , String attribute , String value, String IdAttr , String idValue) {
		StartFactory();
		session = factory.getCurrentSession();
		session.beginTransaction();
		 
		Query q = session.createQuery("update "+className+" set "+attribute+"="+value+" where "+IdAttr+"="+idValue+"");	 ;
		q.executeUpdate();
		session.getTransaction().commit();
		//this.factory.close();
	} 
	 
	public Session LazyLodding() {
		StartFactory();
	    Session session = factory.openSession();
	   
        return session;
	}


}
