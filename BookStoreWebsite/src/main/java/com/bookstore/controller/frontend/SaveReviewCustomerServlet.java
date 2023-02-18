package com.bookstore.controller.frontend;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;
import com.bookstore.service.BookService;
import com.bookstore.service.ReviewService;

@WebServlet("/profile/save_review")
public class SaveReviewCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaveReviewCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CreateReview(request , response);
		
	}
	
	 public void CreateReview(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		   String rating = request.getParameter("rating"); 
		   int reviewRating = 	Integer.valueOf(rating);
		   
			String id = request.getParameter("id");
			Integer bookId = Integer.valueOf(id);
			BookService bookService = new BookService();
			Book book = bookService.get(bookId);
			
			String headline = request.getParameter("headline");
			
			String comment = request.getParameter("comment");
			
			String date = GetCurrentDate();
			
			Customer customer = (Customer) request.getSession().getAttribute("customer");
			
			
		 Review review = new Review(book,customer,reviewRating,headline,comment,date);
		 ReviewService reviewService =new ReviewService(); 
		 reviewService.createReview(review);
		 request.getRequestDispatcher("/view_book?id="+bookId).forward(request, response);
	} 
	
	protected String GetCurrentDate() {
	     Date date = new Date() ;
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:m:ss");
	    return formatter.format(date);
	}

}
