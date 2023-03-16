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
       
    
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReviewService reviewService =new ReviewService(request, response);
		reviewService.saveReview();	 
	}
	
 


}
