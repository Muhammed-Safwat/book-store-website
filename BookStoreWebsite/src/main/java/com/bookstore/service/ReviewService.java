package com.bookstore.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

public class ReviewService {
	private ReviewDAO reviewDAO; 
	private HttpServletRequest request;
    private HttpServletResponse response;
   
   
	public ReviewService(HttpServletRequest request ,  HttpServletResponse response) {
		reviewDAO = new ReviewDAO();
		this.request  = request ; 
		this.response = response;
	}
		

	
	public void listReviews() throws ServletException, IOException {
		 request.setAttribute("reviews", reviewDAO.listReviewWithBook());
		request.getRequestDispatcher("../admin/review_list.jsp").forward(request, response) ;
	}
	
	public void saveReview() throws ServletException, IOException {
		   String rating = request.getParameter("rating"); 
		   int reviewRating = 	Integer.valueOf(rating);
		   
			String id = request.getParameter("id");
			Integer bookId = Integer.valueOf(id);
			BookDAO dao = new BookDAO();
			Book book = dao.get(bookId);
			String headline = request.getParameter("headline");
			String comment = request.getParameter("comment");
			String date = GetCurrentDate();
			Customer customer = (Customer) request.getSession().getAttribute("customer");
			
			
			 Review review = new Review(book,customer,reviewRating,headline,comment,date);
			 reviewDAO.create(review);
		     request.setAttribute("book", book);
		     request.setAttribute("message" , "Reivew added successfully");
		     ReviewService reviewService = new ReviewService(request, response);
		     List<Review> reviewList = reviewService.findByBookId(id);
		     request.setAttribute("reviewList", reviewList);
			/* RequestDispatcher dispatcher = request.getRequestDispatcher("../frontend/book_detail_page.jsp");
			 dispatcher.forward(request, response); */
		     response.sendRedirect(request.getContextPath()+"/view_book?id="+book.getBookId());
	}
	
	
	 
	public void showEditFrom() throws ServletException, IOException {
		Integer id = Integer.valueOf(request.getParameter("id"));
	    Review review = reviewDAO.getReviewLazy(id) ;
		System.out.println("review  = " + review.toString());
		request.setAttribute("review", review);
		request.getRequestDispatcher("edit_review.jsp").include(request, response);;
	}
	
	public void UpdateReview() throws ServletException, IOException {
		String headline =  request.getParameter("headline");
		String comment =  request.getParameter("comment");
		Integer id = Integer.valueOf(request.getParameter("id"));
		Review review = reviewDAO.get(id); 
		review.setComment(comment); 
		review.setHeadline(headline);
		 reviewDAO.update(review);
		request.setAttribute("message", "Review updated successfully");
		listReviews();	
	}
	
	public List<Review> findByBookId(String id){
		return reviewDAO.findByBookId(id);
	}
	
	public void delete() throws ServletException, IOException {
		 
		String idParameter= request.getParameter("id");
		if(idParameter==null) {
			request.setAttribute("message", "Could not find this review");
		}else {
			Integer id  = Integer.valueOf(idParameter);
			reviewDAO.delete(id);
			request.setAttribute("message", "Review deleted successfully");
		}
		 listReviews();
	}
	
	public List<Review> listAll(int max){
		return reviewDAO.listAll(max);
	}
	
	public void makeReview() throws ServletException, IOException {
		BookDAO  bookDAO =new BookDAO();
		String stringId = 	request.getParameter("id");
		Integer id = Integer.valueOf(stringId);
		
		Book book = bookDAO.getBookWithCategory(id);
		 
		request.setAttribute("book", book);
		
		request.getRequestDispatcher("../frontend/make_review.jsp").include(request, response);
	}
	 
	
	protected String GetCurrentDate() {
	     Date date = new Date() ;
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:m:ss");
	    return formatter.format(date);
	}
}
