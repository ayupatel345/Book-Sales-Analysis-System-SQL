Create table BOOK (
Book_ID	SERIAL PRIMARY KEY,
Title VARCHAR(100),
Author VARCHAR(100),
Genre VARCHAR(50),
Published_Year INT,
Price NUMERIC(10, 2),
Stock INT);

CREATE TABLE Customer(
Customer_ID	SERIAL PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
Phone VARCHAR(15),
City VARCHAR(50),
Country VARCHAR(150));

CREATE TABLE Orders(
Order_ID SERIAL PRIMARY KEY,
Customer_ID	INT REFERENCES Customer(Customer_ID),
Book_ID	INT REFERENCES Book(Book_ID),
Order_Date DATE,
Quantity INT,
Total_Amount NUMERIC (10, 2)
);

SELECT * FROM Book;
SELECT * FROM Customer;
SELECT * FROM Orders;


--1) Find the book with "Fiction" Genre:

SELECT Title, Genre FROM Book
WHERE GENRE = 'Fiction';

-- 2) Find books published after 1950:

SELECT Title, published_year FROM Book
WHERE published_year>'1950'
ORDER BY published_year ASC;

-- 3) List all customer from Canada:

SELECT * FROM Customer
WHERE Country='Canada';

--4) Show orders placed in November 2023:

SELECT * FROM Orders
WHERE Order_date BETWEEN '2023-11-01' AND '2023-11-30';

--5) Retrieve the total stock of books available:

SELECT SUM(Stock) AS Total_Stock From Book;

--6) Find the detail of most expensive book:

SELECT * FROM Book
ORDER BY Price DESC
LIMIT 1;

--7) Show all the customers who ordered more than 1 quantity of book:

SELECT * FROM ORDERS
WHERE Quantity>1;

--8) Retrieve all orders where the total amount exceeds $20:

SELECT * FROM ORDERS
WHERE total_amount>20;

--9) List all the genres available in the books:

SELECT Genre from Book
GROUP BY Genre;

--10) Find the book with the lowest stock:

SELECT * FROM BOOK
ORDER BY Stock;

--11) Calculate the total revenue generated from all orders:

SELECT SUM(total_Amount) FROM Orders;

--Advanced Questions:

--1) Retrieve the total number of book sold for each genre:

SELECT b.genre, SUM(o.quantity) FROM orders o  
JOIN book b ON o.Book_id = b.book_id
GROUP BY b.genre;


--2) Find the average price of book in the "Fantasy" genre:

SELECT AVG(price) FROM Book
WHERE genre = 'Fantasy';

--3) List Customers who have placed atleast 2 orders:

SELECT Customer_id, Count(order_id) from orders
GROUP BY Customer_id
HAVING COUNT (Order_id) >=2;

--4) Find the most frequently ordered book:

SELECT book_id, COUNT(Order_id) FROM Orders
GROUP BY book_id
ORDER BY ;

--5) Show the top 3 most expensive books of "Fantasy" genre: 

SELECT * FROM BOOK
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;

--6) Retrieve the total quantity of books sold by each author:

SELECT b.Author, SUM(o.Quantity) AS Total_Quantity 
FROM Book b
JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.Author;

--7 List the cities where customer who spent over $30 are located:

SELECT DISTINCT c.City, o.total_amount 
FROM Customer C
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.total_amount >= 30

--8) Find the customer who spent most on order:

SELECT c.name, SUM(o.total_amount) AS Amount_Spent
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY Amount_Spent DESC
LIMIT 1;

--9) Find Top Revenue Generating Book:

SELECT SUM(o.total_amount) AS Total_sales, b.title 
FROM Orders o
JOIN Book b ON o.book_id = b.book_id
GROUP BY B.title
ORDER BY Total_sales DESC;

--10) Best selling books:

SELECT SUM(o.total_amount) AS Total_sales, b.title 
FROM Orders o
JOIN Book b ON o.book_id = b.book_id
GROUP BY B.title
ORDER BY Total_sales DESC
LIMIT 1;

--11) Find top customers by revenue:

SELECT c.name, SUM(o.total_amount) AS total_revenue
FROM customer c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_revenue DESC
LIMIT 5;

--12) Find the repeated customers:

SELECT customer_id, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;