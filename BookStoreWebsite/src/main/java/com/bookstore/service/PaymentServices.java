package com.bookstore.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

public class PaymentServices {
	
	// live:
		private static final String CLIENT_ID = "AYyvdakaZnuzu1QYQA3w7CbwOcABW13Bh8YBZD7Kq6dz_juwpSk7sPkRB8VWiTlUD9ITUzkmsYuSS-z5";
		private static final String CLIENT_SECRET = "EFsHteOJowYuKVNobC2B38KE7sUuDqDJc1JcrcL11p_CBqGqV8nFM1a8G9M4cbEMtcbHBDlkKIEDEuJu";
	private String mode = "live";
	
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	
	public PaymentServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
	}
	
	public void authorizePayment(BookOrder order) throws ServletException, IOException {
	    
		Payer payer = getPayerInformation(order);
		RedirectUrls redirectUrls = getRedirectUrls();		
			
		List<Transaction> transactions = getTransactionInformation(order);
		
		Payment requestPayment = new Payment();
		requestPayment.setPayer(payer)
					  .setRedirectUrls(redirectUrls)
					  .setIntent("authorize")
					  .setTransactions(transactions);
		
		System.out.println("====== REQUEST PAYMENT: ======");
		System.out.println(requestPayment);		
		
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, mode);
		
		try {
			Payment authorizedPayment = requestPayment.create(apiContext);
			System.out.println("====== AUTHORIZED PAYMENT: ======");
			System.out.println(authorizedPayment);
			
			String approvalURL = getApprovalURL(authorizedPayment);
			
			response.sendRedirect(approvalURL);
			
		} catch (PayPalRESTException e) {
			e.printStackTrace();
			throw new ServletException("Error in authorizing payment.");
		}
		
	}
	
	private String getApprovalURL(Payment authorizedPayment) {
		 String approvalURL = null ;
		 List<Links> links = authorizedPayment.getLinks();
		 
		 for(Links link : links) {
			 if(link.getRel().equalsIgnoreCase("approval_url")) {
				 approvalURL = link.getHref();
			 }
		 }
		return approvalURL;
	}

	private List<Transaction>  getTransactionInformation(BookOrder order) {
		Transaction transaction =new Transaction();
		transaction.setDescription("Books order on Evergreen Books");
		Amount amount = getAmountDetails(order);
		
		ItemList itemList = new ItemList();
		ShippingAddress shippingAddress = getRecipientInformation(order);
		itemList.setShippingAddress(shippingAddress);
		
		List<Item> paypalItems = new ArrayList<>();
	 
		 for(OrderDetail orderDetail : order.getOrderDetails()) {
			
			Book book  = orderDetail.getBook();
			
			Integer quantity = orderDetail.getQuantity();
			
			Item payItem = new Item();
			payItem.setCurrency("USD")
				.setName(book.getTitle())
				.setQuantity(String.valueOf(quantity))
				.setPrice(String.format("%.2f" ,book.getPrice()));
			paypalItems.add(payItem);
		}
		 
		itemList.setItems(paypalItems);
		transaction.setAmount(amount);
		
		List<Transaction> listTransactions = new ArrayList<>();
		
		listTransactions.add(transaction);
		
		return listTransactions;
	}
	
	private ShippingAddress getRecipientInformation(BookOrder order) {
		ShippingAddress shippingAddress = new ShippingAddress();
		
		shippingAddress.setRecipientName(order.getCustomer().getFullName())
						.setPhone(order.getPhone())
						.setLine1(order.getAddressLine1())
						.setLine2(order.getAddressLine2())
						.setCity(order.getCity())
						.setState(order.getState())
						.setCountryCode(order.getCountry())
						.setPostalCode(order.getZipcode());
		return shippingAddress;
	}
	
	
	public Payer getPayerInformation(BookOrder order) {
		Payer payer = new Payer() ;
		payer.setPaymentMethod("paypal");
		
		
		Customer customer = order.getCustomer();
		
		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName(customer.getFirstName());
		
		payerInfo.setLastName(customer.getLastName());
		
		payerInfo.setEmail(customer.getEmail());
		
		payer.setPayerInfo(payerInfo);
		
		return payer;
	}
	
	public RedirectUrls getRedirectUrls() {
		String requestURL = request.getRequestURL().toString();
		String requestURI = request.getRequestURI()   ;
		String baseURL = requestURI.replace(requestURI , "").concat(request.getContextPath());
		
		RedirectUrls redirectUrls = new RedirectUrls();
		String cancelUrl = baseURL.concat("/view_cart");
		String returnUrl = baseURL.concat("/review_payment");
		
		System.out.println("Return URL : " + returnUrl);
		System.out.println("Cencel URL : " + cancelUrl);
		
		redirectUrls.setCancelUrl(cancelUrl);
		redirectUrls.setReturnUrl(returnUrl);
		
		return redirectUrls;
	}
	
	public Amount getAmountDetails(BookOrder order) {
		Details  details = new Details();
		
		details.setShipping(String.format("%.2f" ,order.getShippingFee()));
		details.setTax(String.format("%.2f" ,order.getTax()));
		details.setSubtotal(String.format("%.2f" ,order.getSubtotal()));
		
		Amount amount = new Amount();
		
		amount.setCurrency("USD");
		amount.setDetails(details);
		amount.setTotal(String.format("%.2f" ,order.getTotal()));
		
		return amount;
	}
	public void reviewPayment() throws ServletException {
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");
		
		if (paymentId == null || payerId == null) {
			throw new ServletException("Error in displaying payment review");
		}
		
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, mode);
		
		try {
			Payment payment = Payment.get(apiContext, paymentId);
			
			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
			
			request.setAttribute("payer", payerInfo);
			request.setAttribute("recipient", shippingAddress);
			request.setAttribute("transaction", transaction);
			
			String reviewPage = "frontend/review_payment.jsp?paymentId=" + paymentId + "&PayerID=" + payerId;
			request.getRequestDispatcher(reviewPage).forward(request, response);
			
		} catch (PayPalRESTException | IOException e) {
			e.printStackTrace();
			throw new ServletException("Error in getting payment details from PayPal.");
		}
	}

	public Payment executePayment() throws PayPalRESTException {
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");
		
		PaymentExecution paymentExecution = new PaymentExecution();
		paymentExecution.setPayerId(payerId);
		
		Payment payment = new Payment().setId(paymentId);
		
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, mode);
		
		return payment.execute(apiContext, paymentExecution);
		
	}
}
