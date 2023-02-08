package com.bookstore.controller.admin.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Review;
import com.bookstore.service.ReviewService;

@WebServlet("/admin/list_review")
public class ListReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ReviewService reviewService;
    
    public ListReviewServlet() {
    	reviewService = new ReviewService();  
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Review> reviews = reviewService.listReviews();
		System.out.println(reviews);
		request.setAttribute("reviews", reviews);
		request.getRequestDispatcher("review_list.jsp").forward(request, response) ;
		
	}

 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
