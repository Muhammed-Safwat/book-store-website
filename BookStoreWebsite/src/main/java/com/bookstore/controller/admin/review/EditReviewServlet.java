package com.bookstore.controller.admin.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Review;
import com.bookstore.service.ReviewService;

 
@WebServlet("/admin/edit_review")
public class EditReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewService reviewService;
	private Review review ; 
	
    public EditReviewServlet() {
    	reviewService = new ReviewService();
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.valueOf(request.getParameter("id"));
	    review = reviewService.getReviewById(id);
		System.out.println("review  = " + review.toString());
		request.setAttribute("review", review);
		request.getRequestDispatcher("edit_review.jsp").include(request, response);;
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String headline =  request.getParameter("headline");
		String comment =  request.getParameter("comment");
		System.out.println(headline + "===========" + comment);
		review.setComment(comment); 
		review.setHeadline(headline);
		reviewService.UpdateReview(review);
		request.setAttribute("message", "updated succsussfully");
		request.getRequestDispatcher("list_review").forward(request, response);
	}

}
