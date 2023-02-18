package com.bookstore.controller.admin.review;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.service.ReviewService;

@WebServlet("/admin/delete_review")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewService reviewService;
    public DeleteReviewServlet() {

    }
    
    @Override
    public void init() throws ServletException {
    	 reviewService = new ReviewService();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String idParameter= request.getParameter("id");
		if(idParameter==null) {
			request.setAttribute("message", "Could not find review with ID ");
		}else {
			Integer id  = Integer.valueOf(idParameter);
			reviewService.delete(id);
			request.setAttribute("message", "Review with id = "+id+" Deleted succssfuly");
		}
		request.getRequestDispatcher("list_review").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
