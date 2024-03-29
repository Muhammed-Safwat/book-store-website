# Book Store Website Requirement

A website for selling books online in which users can log in or register and (add, update) personal information, view the available books and add reviews, select books along with their quantity add them to a shopping cart, and buy them, Users can order books and track their orders and update them, Users can also get payment receipts after successful payment. The project can also be used by the administrator, who can add new books, remove books, increase and decrease the number of books, change the price of the books, maintain the selling history of books, and manage Orders, Administrators, and Users.
**In the backend**, the company needs to maintain a group of people who put book’s information on the website and manages customer’s information along with their orders.
Tim Beck - the company’s newly appointed Chief Technology Officer (CTO) provides the requirement details for the website as below:
<hr> 
<video controls>
    <source src="imgs/0419.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

## Requirements for Website’s Front End:-

* Customer can browse the online book store by category (e.g. Health, Success, Business, Programming, etc) or they can search books by providing a specific keyword e.g. ‘success habits’. The customer can view basic information about a book like title, author, description, ISBN number, publish date and price (in USD). In addition, he or she can read reviews of other customers as well as average rating of a book, which can be ranged from 0 to 5 stars.
  
* The website must provide a small image for each book, which is typically the front cover of the book. The customer can write a review for a book but he or she needs to login first. Then he or she needs to specify rating (from 0 to 5 stars) along with a short headline and more details in the comment. A customer can made only one review for a particular book. If the customer already made a review, the website will show that review if he or she tries to make a review again. Note that the customer can’t edit the review they already made.

* Before logging in, the customer must register an account by providing their personal information like full name, e-mail address, password, phone number, and the information required for shipping such as address, city, zip code and country. Then he or she can login by providing email and password.

* The website lists all categories in the top menu, which allows the customer to browse books in a specific domain. On the home page, the customer can see the most recently published books (based on the publish date, not by the date on which the book is put onto the website). Then he can see the best-selling books (based on the number of orders have been made through the website), and the most favored books (based on their rating and number of reviews).
  
* When reading the details of a book, the customer can add the book to his shopping cart by hitting the button ‘Add to Cart’. Then she can see her shopping cart listing all the books that have been added. Note that adding a book multiple times to the shopping cart will increase the quantity (number of copies). The shopping cart page allows the customer to edit the quantity, remove books and even empty the cart.
  
* The information in shopping cart is maintained during the customer’s session, which means that she can continue navigating the site before placing an order. The website also provides a menu that allows the customer to see her shopping cart quickly and for convenience, she doesn’t have to login first to use the shopping cart.
To place an order after adding books into shopping carts, the customer needs to review all books in the cart (she can modify quantity or remove some books) before hitting ‘Check Out’. The checkout process requires the customer to login. If not, she is redirected to the login page, and the site proceeds to the check out page upon successful login.

* On the Check Out page, the customer can review the books she wants to order again, and confirm the shipping information. By default, the shipping information is filled with customer’s registered information (name, phone, address, city, zip code and country). The customer can update this information if needed. And this beginning stage, the website accepts only payment by COD (Cash on Delivery). 

* The customer clicks “Place Order” button to submit the order to the company’s staff, and then she can check the order status via “My Orders” menu. The default status of an order is ‘Processing’ and only the company’s staff can update the order status.
  
* On the My Orders page, the customer can see all orders she made through the website. The most recent orders are shown first and she can click to see the details of each order. At this time, the customer can’t edit their orders once they are submitted.
  
* The website also allows the customer to view their registered information (profile details) and edit it. Note that the customer cannot change their registered e-mail address, and their password won’t be changed if left blank in the edit form.
  
* Also note that when the customer logs out, the information in their shopping cart is cleared.
At any time, the customer can search the books they want by typing a keyword in the search box at the top of the site. The search result shows books that have either title or description contain the specified keyword. The customer can add the book to cart directly in the search result.

## Requirements for Website’s Back End:-

In the back end, the company hires a group of employees that are responsible to manage information for the website (they are called admin). CTO Tim Beck states the requirements for the backend as follows:

* Generally the backend allows an admin to manage information about categories, books, customers, reviews and orders with fundamental operations like view items (listing and detail); create, update, and delete an item. But he or she cannot create new review or new order. In addition, an admin can create account for another admin user and of course, manage those users.
* The admin can manage all categories that are used to classify the books on the website. The only information needed for a category is the category name. He cannot delete a category if it contains books. He can delete only empty one.
* For putting a book onto the website, the admin can upload an image file that is used as the book’s thumbnail. When editing a book, he can choose to update the thumbnail or not. And if not, the old image is kept. Note that the admin cannot remove a book if there are reviews and orders on it.
For managing customers, customer’s email is unique. He can change a customer’s email, but not to another customer’s email. And a customer cannot be deleted if he or she already made reviews or purchased books from the site.
* For managing reviews, the admin cannot create a new one. Only customer can write a review. The admin can edit the headline and comment, but not rating, book or customer. Of course he can delete any review if it is inappropriate or violates company’s policy.
* For managing orders, the admin can update shipping information and status of an order (there will be more options for payment method in future, but there’s only one “Cash on Delivery” option at this stage). In addition, the admin can manage the books picked by the customer. He can update quantity, remove or even add other books to the order.
* admin can create another admin user with information like email, full name and password.  Then the new user can use his email and password to login to the backend for managing information.
  
* An admin can also edit information and delete other admin users if needed.

## Use Case Diagrams 

<img src='imgs/GeneralUseCase.png'>

## WHAT EMPLOYEES(Admin) CAN DO:

* Manage admin users
* Manage categories
* Manage books
* Manage customers
* Manage reviews (but cannot write reviews)
* Manage orders (but cannot create orders)
* View statistical information

## USE CASE DIAGRAMS FOR BACKEND

####  Category Management Use Cases

<img src='imgs/manageCategirues.png'>

#### Book Management Use Cases

<img src='imgs/manageBooks.png'>

#### Customer Management Use Cases

<img src='imgs/manageCustomers.png'>

#### Review Management Use Cases

<img src='imgs/manageReviews.png'>

#### Order Management Use Cases

<img src='imgs/manageOrder.png'>



## WHAT CUSTOMERS CAN DO

* View new books, best-selling books, and most favored books on the home page
* Search for books
* View books listed by category
* View book’s details and reviews
* Write reviews for books
* Order books
* Check their order status and shopping history
* They must register to write review and purchase books
  
####  LIST BOOKS USE CASES

<img src='imgs/listBook.png'>

####  VIEW BOOK’S DETAILS USE CASE

<img src='imgs/viewBookDetails.png'>

####  SHOPPING CART USE CASES

<img src='imgs/shoppingCart.png'>

####  PLACE ORDER USE CASES

<img src='imgs/placeOrder.png'>

####  MANAGE PROFILE USE CASE

<img src='imgs/manageProfile.png'>


## What Data Needs to be Managed?

* Customer information
* Category information
* Book information
* Customer’s Review information
* Order information
* Admin User information

### Database digram 

<img src='imgs/Database.png'>


## System Architecture

<img src='imgs/Architecture.png'>

## APPLICATION ARCHITECTURE

<img src='imgs/appArchitecture.png'>

## Class Diagram  

<img src='imgs/classDigram.png'>

## Activity Diagram 

<img src='imgs/ActivityDigram.png'>

##  Sequence Digram

<img src='imgs/SequenceDigram.png'>
