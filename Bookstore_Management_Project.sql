-- Books Table
DROP TABLE IF EXISTS Books CASCADE;

CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);


-- Customers Table
DROP TABLE IF EXISTS Customers CASCADE;

CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);


-- Orders Table
DROP TABLE IF EXISTS Orders CASCADE;

CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);


SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

SELECT COUNT(*) FROM Books;

SELECT * FROM Books LIMIT 5;

SELECT COUNT(*) FROM Orders;

SELECT * FROM Orders LIMIT 5;

SELECT COUNT(*) FROM Customers;

SELECT * FROM Customers LIMIT 5;

-- SELECT COUNT AS TOTAL BOOKS
SELECT COUNT(*) AS total_books
FROM Books;

-- Question 1 - Retrievie all book in the "fiction" genre
SELECT * FROM Books
WHERE Genre ='Fiction';

-- Question 2 - 
-- 2) Find books published after the year 1950:
SELECT * FROM Books 
WHERE Published_year>1950;

-- 3) List all customers from the Canada:
SELECT * FROM Customers 
WHERE country='Canada';

-- 4) Show orders placed in November 2023:

SELECT * FROM Orders 
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:

SELECT SUM(stock) AS Total_Stock
From Books;

-- Question 6 — Most Expensive Book
SELECT *
FROM Books
WHERE Price = (
    SELECT MAX(Price)
    FROM Books
);

--Question 7 — Multiple Quantity Orders
SELECT *
FROM Orders
WHERE Quantity > 1;

--Question 8 — Orders above $20
SELECT *
FROM Orders
WHERE Total_Amount > 20;

--Question 9 — Available Genres
SELECT DISTINCT Genre
FROM Books;

--Question 10 — Lowest Stock Book
SELECT *
FROM Books
WHERE Stock = (
    SELECT MIN(Stock)
    FROM Books
);
--Question 11 — Total Revenue
SELECT SUM(Total_Amount) AS total_revenue
FROM Orders;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

SELECT * FROM ORDERS;

SELECT b.Genre, SUM(o.Quantity) AS Total_Books_sold
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.Genre;



---Advanced Question 2 — Fantasy Genre ka Average Price
SELECT AVG(Price) AS Average_Price
FROM Books
WHERE Genre = 'Fantasy';

---Advanced Question 3 — At Least 2 Orders Wale Customers
SELECT 
    o.Customer_ID,
    c.Name,
    COUNT(o.Order_ID) AS Order_Count
FROM Orders o
JOIN Customers c 
    ON o.Customer_ID = c.Customer_ID
GROUP BY o.Customer_ID, c.Name
HAVING COUNT(o.Order_ID) >= 2;

---Advanced Question 4 — Most Frequently Ordered Book
SELECT 
    o.Book_ID,
    b.Title,
    COUNT(o.Order_ID) AS Order_Count
FROM Orders o
JOIN Books b 
    ON o.Book_ID = b.Book_ID
GROUP BY o.Book_ID, b.Title
ORDER BY Order_Count DESC
LIMIT 1;

--Advanced Question 5 — Top 3 Most Expensive Fantasy Books
SELECT *
FROM Books
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;

--Advanced Question 6 — Total Quantity of Books Sold by Each Author
SELECT 
    b.Author,
    SUM(o.Quantity) AS Total_Books_Sold
FROM Orders o
JOIN Books b 
    ON o.Book_ID = b.Book_ID
GROUP BY b.Author;

---Advanced Question 7 — $30 se zyada spend karne wale customers ke cities
SELECT DISTINCT 
    c.City,
    o.Total_Amount
FROM Orders o
JOIN Customers c 
    ON o.Customer_ID = c.Customer_ID
WHERE o.Total_Amount > 30;

---Advanced Question 8 — Sabse Zyada Spend Karne Wala Customer
SELECT 
    c.Customer_ID,
    c.Name,
    SUM(o.Total_Amount) AS Total_Spent
FROM Orders o
JOIN Customers c 
    ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Name
ORDER BY Total_Spent DESC
LIMIT 1;

---Advanced Question 9 — Remaining Stock
SELECT 
    b.Book_ID,
    b.Title,
    b.Stock,
    COALESCE(SUM(o.Quantity), 0) AS Order_Quantity,
    b.Stock - COALESCE(SUM(o.Quantity), 0) AS Remaining_Quantity
FROM Books b
LEFT JOIN Orders o 
    ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID, b.Title, b.Stock
ORDER BY b.Book_ID;

