Select * from Books;
Select * from Orders;
Select * from Customers;

--1) Retrieve all books in the "Fiction" genre:
Select * from Books
where Genre='Fiction';

-- 2) Find books published after the year 1950:
Select * from Books
where Published_Year>1950;

-- 3) List all customers from the Canada:
Select * from Customers
where country = 'Canada';

-- 4) Show orders placed in November 2023:
Select * from Orders 
where Order_date >= '2023-11-01'
and Order_date < '2023-12-01';

-- 5) Retrieve the total stock of books available:
Select sum(stock) as Total_Stock from Books;

-- 6) Find the details of the most expensive book:
Select  top 1 * from Books
order by Price desc;

-- 7) Show all customers who ordered more than 1 quantity of a book:
Select c.name, c.email, o.order_date from 
Customers as c join
Orders as o on
c.Customer_id = o.customer_id
where o.quantity >1;
 Or
Select * from Orders
where Quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:
Select * from Orders 
where Total_Amount>20;

-- 9) List all genres available in the Books table:
Select distinct(Genre) from Books;

-- 10) Find the book with the lowest stock:
Select min(stock) from Books;
or
Select Top 1 * from Books order by Stock Asc;

-- 11) Calculate the total revenue generated from all orders:
Select sum( Total_Amount) as Total_Revenue from Orders;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
 Select b.Genre, Sum(o.Quantity) as total_book_Sold from 
Books as b
join
Orders as o
on
b.Book_ID= o.Book_ID
Group by b.Genre;

-- 2) Find the average price of books in the "Fantasy" genre:
Select AVG(Price) from Books
where Genre='Fantasy';

-- 3) List customers who have placed at least 2 orders:
Select o.Customer_ID,c.Name ,COUNT(o.order_ID) as Order_Count From 
Orders as o 
join
Customers as c
on
o.Customer_ID = c.Customer_ID
Group by o.Customer_ID,c.Name
Having COUNT(o.Order_ID)>=2;

-- 4) Find the most frequently ordered book:
Select top 1 o.Book_ID,b.Title,count(o.Order_ID) as Order_Count 
from 
Orders as o join
Books as b on
o.Book_ID = b.Book_ID
group by o.Book_ID,b.Title
Order by Order_Count desc;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
Select top 3 * from Books
where Genre= 'Fantasy'
order by price desc;


-- 6) Retrieve the total quantity of books sold by each author:
Select b.Author, Sum(o.Quantity) as Total_Quantity from Books as b
join
Orders as o
on
b.Book_ID= o.Book_ID
group by b.Author;

-- 7) List the cities where customers who spent over $30 are located:
Select Distinct(c.city), o.Total_Amount 
from 
Customers as c
join
Orders as o 
on 
c.Customer_ID= o.Customer_ID
where o.Total_Amount>30;

-- 8) Find the customer who spent the most on orders:
SELECT Top 1 c.customer_id, c.name, SUM(o.total_amount) AS Total_Spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY c.customer_id, c.name
ORDER BY Total_spent Desc;

--9) Calculate the stock remaining after fulfilling all orders:
Select b.Book_ID, b.Stock, Coalesce(sum(Quantity),0) as Quantity_Use, (b.Stock-Coalesce(sum(Quantity),0)) as Remaining_Quantity
from Books as b
Left join 
Orders as o on
b.Book_ID = o.Book_ID
group by b.Book_ID,
b.Stock;
