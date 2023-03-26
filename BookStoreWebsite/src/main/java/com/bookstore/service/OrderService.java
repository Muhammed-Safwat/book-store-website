package com.bookstore.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.frontend.shopingcart.ShopingCart;
import com.bookstore.dao.BookDAO;
import com.bookstore.dao.BookOrderDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;
import com.paypal.api.payments.Payment;

public class OrderService {
	private BookOrderDAO bookOrderDAO ;
	private HttpServletRequest request;
    private HttpServletResponse response;
    
    
	public OrderService(HttpServletRequest request, HttpServletResponse response) {
		bookOrderDAO = new BookOrderDAO();
		this.request=request;
		this.response=response;
	}
	
	public void orderList() throws ServletException, IOException {	
		List<BookOrder> list = bookOrderDAO.listAll();
		request.setAttribute("orders", list);		
		request.getRequestDispatcher("order_list.jsp").include(request, response);
	}
	
	// helper 
	public void setOrderDetail() {
		String sId = request.getParameter("id");
		if(sId != null) {
			Integer id  = Integer.valueOf(sId);
			BookOrder order = bookOrderDAO.get(id);
			request.setAttribute("order", order);
		}
	}
	
	public void getOrderDetail() throws ServletException, IOException  {
		String sId = request.getParameter("id");
		if(sId != null) {
			Integer id  = Integer.valueOf(sId);
			BookOrder order = bookOrderDAO.get(id);
			request.setAttribute("order", order);
		}
		request.getRequestDispatcher("order_detail.jsp").include(request, response);
	}
	
	public void viewOrderDetail() throws ServletException, IOException  {
			Customer customer  = (Customer) request.getSession().getAttribute("customer");
			String sId = request.getParameter("id");
			if(sId != null) {
				List<BookOrder> order = bookOrderDAO.getOrderWithCustomerId(sId , String.valueOf(customer.getCustomerId()));
				request.setAttribute("order", order.get(0));
			}
			request.getRequestDispatcher("../frontend/order_detail.jsp").include(request, response);
	}
	
	public void ShowCheckOut() throws ServletException, IOException {
		request.getRequestDispatcher("../frontend/ceckout.jsp").include(request, response);
	}

	public void placeOrder() throws ServletException, IOException {
		String paymentMethod = request.getParameter("payment-method");
		BookOrder order = readOrderInfo();
		if(paymentMethod.equals("paypal")) {
			PaymentServices paymentServices = new PaymentServices(request, response);
			request.getSession().setAttribute("order4Paypal", order);
			paymentServices.authorizePayment(order);
		}else {
			placeCOD(order);
		}
		
	}
	
	public void placeOrderPaypal(Payment payment) {
		BookOrder order =(BookOrder) request.getAttribute("order4Paypal");
	}
	
	public BookOrder readOrderInfo() {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phone = request.getParameter("phone");
		String addressLine1 = request.getParameter("addressLine1");
		String addressLine2 = request.getParameter("addressLine2");
		String paymentMethod = request.getParameter("payment-method");
		
	 
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("country");
	    String date = GetCurrentDate() ;
	    Customer customer = (Customer) request.getSession().getAttribute("customer");
	    
	    Set<OrderDetail> orderDetails = new HashSet<OrderDetail>();
	     
	    
	     
	    BookOrder newOrder = new BookOrder(
	    		customer
	    		,date
	    		,0.0
	    		,"Processing"
	    		,addressLine1
	    		,addressLine2
	    		,paymentMethod
	    		,firstName
	    		,lastName
	    		,phone
	    		,country
	    		,state
	    		,city
	    		,zipcode
	    		,0.0
	    		,0.0
	    		,0.0);
	    
	    // add orderDetails to order 
	    double total = 0 ;
	    
	    ShopingCart cart = (ShopingCart) request.getSession().getAttribute("cart");
	    for(Map.Entry<Book, Integer> entry : cart.getItems().entrySet()) {
	    	double subtotal = entry.getKey().getPrice()*entry.getValue();
	    	OrderDetail orderDetail = new OrderDetail(newOrder,
	    											  entry.getKey(),
										    		  entry.getValue(),
										    		  subtotal);
	    	total+=subtotal;
	    	orderDetails.add(orderDetail);
	    	newOrder.setSubtotal(total);
 		}
	    
	    newOrder.setShippingFee(cart.GetTotalAmount()*.1);
	    newOrder.setTax(cart.getTotalQuantity()*1.0);
	    total+=newOrder.getTax()+newOrder.getShippingFee();
	    
	    newOrder.setTotal(total);    
	    newOrder.setOrderDetails(orderDetails);
	    
	    return newOrder;
	}
	public void placeCOD(BookOrder  newOrder) throws IOException, ServletException {	
	    bookOrderDAO.create(newOrder);
	    
	    // clear shopping cart 
	    ShopingCart cart = (ShopingCart) request.getSession().getAttribute("cart");
	    cart.clear();  
	    request.getSession().setAttribute("cart" , cart);
	    request.setAttribute("order", newOrder);
	    // redirect 
	    request.getRequestDispatcher("../frontend/complete_order.jsp").forward(request, response);
	    // response.sendRedirect(request.getContextPath()+"/profile/order_history");
	}
	
	protected String GetCurrentDate() {
	     Date date = new Date() ;
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:m:ss");
	    return formatter.format(date);
	}
	
	public void viewHistory() throws ServletException, IOException {
		Customer customer  = (Customer) request.getSession().getAttribute("customer");
		List<BookOrder> orders = bookOrderDAO.GetOrdersByCustomerId(customer.getCustomerId());
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("../frontend/order_history.jsp").include(request, response);
	}
	
	public void editOrder() throws ServletException, IOException {
		   String sid = request.getParameter("id");
		   Integer id;
		   if(sid==null) {
			   id = (Integer) request.getAttribute("orderId");
		   }else {
			   id = Integer.valueOf(sid);
		   }
		  BookOrder order =  bookOrderDAO.get(id);
		  request.setAttribute("order", order);
		  ListBook();
		  request.getRequestDispatcher("edit_order.jsp").include(request, response);
	}
	
	
	// list book for addBook featuature
	public void ListBook() {
		 BookDAO bookDAO = new BookDAO();
		 List<Book> list = bookDAO.listAll();
		 request.setAttribute("bookList", list);
	}
	 
	public void updateOrder() throws IOException, ServletException {
		
		Integer orderId = Integer.valueOf(request.getParameter("orderId")) ;
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phone = request.getParameter("phone");
		String addressLine1 = request.getParameter("addressLine1");
		String addressLine2 = request.getParameter("addressLine2");
		String paymentMethod = request.getParameter("payment-method");
		String orderStatus = request.getParameter("order-status");
		
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipcode = request.getParameter("zipcode");
		String country = request.getParameter("country");
		
		//Double tax  =Double.valueOf(Integer.valueOf(request.getParameter("tax"))) ;
		//Double shippingFee  = Double.valueOf(Integer.valueOf(request.getParameter("shippingFee")));
		
	    BookOrder bookOrder = bookOrderDAO.get(orderId);
	    bookOrder.setFirstName(firstName);
	    bookOrder.setLastName(lastName);
	    bookOrder.setPhone(phone);
	    bookOrder.setAddressLine1(addressLine1);
	    bookOrder.setAddressLine2(addressLine2);
		bookOrder.setPaymentMethod(paymentMethod);
		bookOrder.setStatus(orderStatus);
		bookOrder.setCity(city);
		bookOrder.setState(state);
		bookOrder.setZipcode(zipcode);
		bookOrder.setCountry(country);
		/*bookOrder.setShippingFee(shippingFee);
		bookOrder.setTax(tax);
		
		*/
		bookOrderDAO.update(bookOrder);
		request.setAttribute("order", bookOrder); 
		request.setAttribute("message", "Book Order Updated Succssfully");
		request.getRequestDispatcher("order_detail").forward(request, response);
		//response.sendRedirect(request.getContextPath()+"/admin/order_detail"); 
	}

	public void addBookToOrder()  throws ServletException, IOException {
		
		 Integer id = Integer.valueOf(request.getParameter("id")) ;
		 BookOrder newOrder =  bookOrderDAO.get(id);
		 
		 
		 String bookTilte = request.getParameter("book-title");
		 Integer quantity = Integer.valueOf(request.getParameter("quantity")) ;
		 
		 BookDAO bookDAO = new BookDAO();
		 Book book =  bookDAO.findByTitle(bookTilte).get(0);
		 
		 double total = book.getPrice() * quantity;
		 
		 OrderDetail orderDetail = new OrderDetail(newOrder,
				  book,
				  quantity,
	    		  total);
		 
		 newOrder.getOrderDetails().add(orderDetail);
		/* int q = newOrder.getNumberOfCopies()+quantity;
		 newOrder.setShippingFee((newOrder.getTotal()+total)*.1);
		 newOrder.setTax(q * 1.0);
		 total += newOrder.getTax() + newOrder.getShippingFee();*/
		    
		 //newOrder.setTotal(total); 
		 newOrder.setTotal();
		 
		 bookOrderDAO.update(newOrder);
		 System.out.println("Runnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
		 
		request.setAttribute("orderId", id);
	}

	public void removeBook() throws IOException {
		 Integer orderId = Integer.valueOf(request.getParameter("orderId")) ;
		 BookOrder newOrder =  bookOrderDAO.get(orderId);
		 Integer bookId = Integer.valueOf(request.getParameter("bookId"));
		 
		 for(OrderDetail detaile : newOrder.getOrderDetails()) {
			 
			 System.err.println("DDDDDDDDDDDD  "+detaile.toString());
			 
		 }
		 
		 for(OrderDetail detaile : newOrder.getOrderDetails()) {
			 if(detaile.getBook().getBookId() == bookId) {
				 System.out.println("DDDDDDDDDDDD  "+bookId);
				 newOrder.getOrderDetails().remove(detaile);
				 break;
			 }
		 }
		 
		 for(OrderDetail detaile : newOrder.getOrderDetails()) {
			 
				 System.out.println("DDDDDDDDDDDD  "+detaile.toString());
				 
		 }
		 
		 
		 newOrder.setTotal();
		 
		 bookOrderDAO.update(newOrder);
		 
		 response.sendRedirect(request.getContextPath()+"/admin/edit_order?id="+orderId);
	}
	
	public void UpdateBookInOrder() throws IOException {
		 Integer orderId = Integer.valueOf(request.getParameter("orderId")) ;
		 BookOrder newOrder =  bookOrderDAO.get(orderId);
		 Integer bookId = Integer.valueOf(request.getParameter("bookId"));
		 Integer quantity = Integer.valueOf(request.getParameter("quantity"));
		// double total = 0 ;
		 for(OrderDetail detaile : newOrder.getOrderDetails()) {
			 if(detaile.getBook().getBookId() == bookId) {
				 System.out.println("DDDDDDDDDDDD  "+quantity);
				 detaile.setQuantity(quantity);
				 detaile.setSubtotal();
				 //total = detaile.getBook().getPrice() * detaile.getBook().getPrice(); 
				 break;
			 }
		 }
		  
		 /*int q = newOrder.getNumberOfCopies() + quantity;
		 newOrder.setShippingFee((newOrder.getTotal() + total)*.1);
		 newOrder.setTax(q * 1.0);*/
		 
		 newOrder.setTotal(); 

		 bookOrderDAO.update(newOrder);
		 response.sendRedirect(request.getContextPath()+"/admin/edit_order?id="+orderId);
	}

	public void delete() throws IOException, ServletException {
		Integer id = Integer.valueOf(request.getParameter("id"));
		bookOrderDAO.delete(id);
		request.setAttribute("message", "Order deleted Sucssfully");
		orderList();
	}
	
	
}
