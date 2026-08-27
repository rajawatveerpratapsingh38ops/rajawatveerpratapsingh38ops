# Online Bookstore SQL Project

## Project Overview

This project is an Online Bookstore database project developed using PostgreSQL.

The project manages books, customers, and orders and demonstrates SQL queries for retrieving and analyzing bookstore data.

## Database

- PostgreSQL

## Tables

### 1. Books

Stores information about books.

Columns:
- Book_ID
- Title
- Author
- Genre
- Published_Year
- Price
- Stock

### 2. Customers

Stores customer information.

Columns:
- Customer_ID
- Name
- Email
- Phone
- City
- Country

### 3. Orders

Stores customer book orders.

Columns:
- Order_ID
- Customer_ID
- Book_ID
- Order_Date
- Quantity
- Total_Amount

## SQL Concepts Used

- SELECT
- WHERE
- DISTINCT
- ORDER BY
- LIMIT
- SUM()
- AVG()
- COUNT()
- GROUP BY
- HAVING
- JOIN
- LEFT JOIN
- Subqueries
- COALESCE()

## Project Questions

### Basic SQL

The project contains 11 basic SQL queries covering books, customers, orders, stock, genres, and revenue.

### Advanced SQL

The project contains 9 advanced SQL queries covering:

1. Total books sold by genre
2. Average price of Fantasy books
3. Customers with at least 2 orders
4. Most frequently ordered book
5. Top 3 most expensive Fantasy books
6. Total books sold by each author
7. Cities of customers spending over $30
8. Customer who spent the most
9. Remaining stock after fulfilling orders

## Files

- `Bookstore_Management_Project.sql` — Complete PostgreSQL project SQL file

## Author

Veer Pratap Singh
