# 📊 SQL Project: Book Sales Analysis System

## 📌 Overview
This project focuses on analyzing book sales data using SQL.  
It involves designing a relational database and performing business-driven analysis on customers, orders, and products.

---

## 🗂 Database Structure

The project consists of three main tables:

- **Customers** → Stores customer details  
- **Orders** → Contains transaction data  
- **Books** → Stores product/book information  

Relationships:
- Orders are linked to Customers via `customer_id`
- Orders are linked to Books via `book_id`

---

## 🛠 Tools & Technologies
- SQL (PostgreSQL)
- Excel (for dataset)

---

## 📊 Key Analysis Performed

### 🔹 1. Top Customers by Revenue
Identified customers contributing the highest revenue.

### 🔹 2. Best-Selling Books
Analyzed books with the highest quantity sold.

### 🔹 3. Revenue by Book
Calculated total revenue generated per book.

### 🔹 4. Customer Insights
Analyzed order frequency and spending behavior.

---

## 📁 Project Files

- `SQL Project.sql` → Database creation and queries  
- `Customers.csv` → Customer dataset  
- `Orders.csv` → Order transactions  
- `Books.csv` → Product dataset  

---

## 🚀 How to Use

1. Create tables using SQL script  
2. Import CSV data into respective tables  
3. Run analysis queries  

---

## 💡 Key Insights

- A small group of customers contributes a large portion of revenue  
- Certain books consistently perform better in sales  
- Repeat customers play a crucial role in revenue generation  

---

## 🎯 Learning Outcomes

- Understanding relational database design  
- Writing complex SQL queries using JOIN, GROUP BY, HAVING  
- Performing business-oriented data analysis  

## 📷 Project Output

### 🔹 Top Customers by Revenue
![Top Customers](screenshots/top_customers.png)

### 🔹 Best-Selling Books
![Best Selling Books](screenshots/best_selling_books.png)

