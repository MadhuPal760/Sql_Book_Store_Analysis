Select * from Books;
Select * from Orders;
Select * from Customers;

1. Select * from Books where Genre='Fiction';

2. Select * from Books where Published_Year>1950;

3. Select * from Customers where country = 'Canada';

4. Select * from Orders where Order_date >= '2023-11-01' and Order_date < '2023-12-01';

5.Select sum(stock) from Books;

6.Select MAX(price) from Books;
or 
select  top 1 * from Books
order by Price desc;

7. Select c.name, c.email, o.order_date from 
Customers as c join
Orders as o on
c.Customer_id = o.customer_id
where o.quantity >1;
 Or
Select * from Orders
where Quantity>1;

8. Select * from Orders where Total_Amount>20;

9. Select distinct(Genre) from Books;

10.Select min(stock) from Books;
or
Select Top 1 * from Books order by Stock Asc;


11. Retrive the total books 
Select sum( Total_Amount) as Total_Revenue from Orders;


12. Select b.Genre, Sum(o.Quantity) as total_book_Sold from 
Books as b
join
Orders as o
on
b.Book_ID= o.Book_ID
Group by b.Genre;

13. Select AVG(Price) from Books where Genre='Fantasy';

14.
Select o.Customer_ID,c.name, COUNT(o.order_Id) from
Orders as o
join
Customers as c
on 
o.Customer_ID=c.Customer_ID
group by o.Customer_ID
having Count(o.Order_ID)>= 2;

15.
Select o.Customer_ID,c.Name ,COUNT(o.order_ID) as Order_Count From 
Orders as o 
join
Customers as c
on
o.Customer_ID = c.Customer_ID
Group by o.Customer_ID,c.Name
Having COUNT(o.Order_ID)>=2;


16.Select top 1 o.Book_ID,b.Title,count(o.Order_ID) as Order_Count 
from 
Orders as o join
Books as b on
o.Book_ID = b.Book_ID
group by o.Book_ID,b.Title
Order by Order_Count desc;


17. Select top 3 * from Books
where Genre= 'Fantasy'
order by price desc;


18. Select b.Author, Sum(o.Quantity) as Total_Quantity from Books as b
join
Orders as o
on
b.Book_ID= o.Book_ID
group by b.Author;

19. Select Distinct(c.city), o.Total_Amount 
from 
Customers as c
join
Orders as o 
on 
c.Customer_ID= o.Customer_ID
where o.Total_Amount>30;

20. Select b.Book_ID, b.Stock, Coalesce(sum(Quantity),0) as Quantity_Use, (b.Stock-Coalesce(sum(Quantity),0)) as Remaining_Quantity
from Books as b
Left join 
Orders as o on
b.Book_ID = o.Book_ID
group by b.Book_ID,
b.Stock;