------------------------Assignment-2-------------------------------------------------------------------------------------
------------------------Retail Sales & Customer Analytics----------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------


------------------------CREATING TABLES-------------------------------

CREATE TABLE Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL,
  city VARCHAR(60),
  state VARCHAR(60),
  signup_date DATE
);
CREATE TABLE Products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(120) NOT NULL,
  category VARCHAR(60),
  unit_price DECIMAL(10,2),
  stock_quantity INT
);
CREATE TABLE Employees (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(100) NOT NULL,
  department VARCHAR(60),
  branch_city VARCHAR(60),
  monthly_salary DECIMAL(10,2)
);
CREATE TABLE Orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  employee_id INT,
  order_status VARCHAR(30),
  payment_method VARCHAR(30),
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
CREATE TABLE Order_Items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  unit_price_at_sale DECIMAL(10,2),
  discount_rate DECIMAL(4,2),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE Returns (
  return_id INT PRIMARY KEY,
  order_id INT,
  return_date DATE,
  return_reason VARCHAR(120),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


---------------------------------Inserting tables------------------------------------------

INSERT INTO Customers (customer_id, customer_name, email, city, state, signup_date) VALUES
(1001, 'Aarav Sharma', 'aarav.sharma@example.com', 'Lucknow', 'Uttar Pradesh', '2024-01-15'),
(1002, 'Diya Verma', 'diya.verma@example.com', 'Kanpur', 'Uttar Pradesh', '2024-02-10'),
(1003, 'Kabir Singh', 'kabir.singh@example.com', 'Delhi', 'Delhi', '2023-11-22'),
(1004, 'Meera Patel', 'meera.patel@example.com', 'Jaipur', 'Rajasthan', '2024-03-05'),
(1005, 'Ishaan Gupta', 'ishaan.gupta@example.com', 'Lucknow', 'Uttar Pradesh', '2023-08-19'),
(1006, 'Ananya Rao', 'ananya.rao@example.com', 'Bhopal', 'Madhya Pradesh', '2024-04-12'),
(1007, 'Reyansh Khan', 'reyansh.khan@example.com', 'Delhi', 'Delhi', '2024-05-01'),
(1008, 'Saanvi Joshi', 'saanvi.joshi@example.com', 'Pune', 'Maharashtra', '2023-12-09'),
(1009, 'Vivaan Mishra', 'vivaan.mishra@example.com', 'Lucknow', 'Uttar Pradesh', '2024-06-17'),
(1010, 'Aditi Das', 'aditi.das@example.com', 'Kolkata', 'West Bengal', '2024-07-02'),
(1011, 'Arjun Mehta', 'arjun.mehta@example.com', 'Jaipur', 'Rajasthan', '2023-09-14'),
(1012, 'Myra Nair', 'myra.nair@example.com', 'Mumbai', 'Maharashtra', '2024-08-21');

INSERT INTO Products (product_id, product_name, category, unit_price, stock_quantity) VALUES
(201, 'Wireless Mouse', 'Accessories', 799.0, 80),
(202, 'Mechanical Keyboard', 'Accessories', 2499.0, 35),
(203, 'USB-C Hub', 'Accessories', 1899.0, 42),
(204, '27-inch Monitor', 'Displays', 14999.0, 18),
(205, 'Laptop Stand', 'Accessories', 1299.0, 55),
(206, 'Webcam HD', 'Peripherals', 3299.0, 24),
(207, 'Noise-Cancelling Headphones', 'Audio', 5999.0, 20),
(208, 'Bluetooth Speaker', 'Audio', 2199.0, 30),
(209, 'External SSD 1TB', 'Storage', 7499.0, 16),
(210, 'Ergonomic Chair', 'Furniture', 11999.0, 12);

INSERT INTO Employees (employee_id, employee_name, department, branch_city, monthly_salary) VALUES
(301, 'Nisha Kapoor', 'Sales', 'Lucknow', 52000),
(302, 'Rahul Bansal', 'Sales', 'Delhi', 58000),
(303, 'Pooja Iyer', 'Support', 'Lucknow', 44000),
(304, 'Karan Malhotra', 'Operations', 'Jaipur', 49000),
(305, 'Sneha Kulkarni', 'Sales', 'Pune', 61000);

INSERT INTO Orders (order_id, customer_id, order_date, employee_id, order_status, payment_method) VALUES
(5001, 1001, '2024-09-02', 301, 'Delivered', 'UPI'),
(5002, 1002, '2024-09-05', 302, 'Delivered', 'Card'),
(5003, 1003, '2024-09-07', 302, 'Returned', 'Card'),
(5004, 1001, '2024-09-15', 301, 'Delivered', 'UPI'),
(5005, 1004, '2024-10-01', 304, 'Delivered', 'Cash'),
(5006, 1005, '2024-10-04', 301, 'Delivered', 'Card'),
(5007, 1006, '2024-10-11', 303, 'Cancelled', 'UPI'),
(5008, 1007, '2024-10-18', 302, 'Delivered', 'Card'),
(5009, 1008, '2024-11-02', 305, 'Delivered', 'Wallet'),
(5010, 1009, '2024-11-10', 301, 'Returned', 'UPI'),
(5011, 1010, '2024-11-15', 304, 'Delivered', 'Card'),
(5012, 1011, '2024-12-01', 304, 'Delivered', 'Cash'),
(5013, 1012, '2024-12-09', 305, 'Delivered', 'Wallet'),
(5014, 1003, '2025-01-05', 302, 'Delivered', 'Card'),
(5015, 1002, '2025-01-12', 302, 'Delivered', 'UPI'),
(5016, 1005, '2025-01-20', 301, 'Delivered', 'Card'),
(5017, 1006, '2025-02-02', 303, 'Delivered', 'UPI'),
(5018, 1007, '2025-02-14', 302, 'Returned', 'Card'),
(5019, 1008, '2025-03-01', 305, 'Delivered', 'Wallet'),
(5020, 1009, '2025-03-15', 301, 'Delivered', 'UPI'),
(5021, 1010, '2025-04-03', 304, 'Cancelled', 'Cash'),
(5022, 1011, '2025-04-22', 304, 'Delivered', 'Card'),
(5023, 1012, '2025-05-07', 305, 'Delivered', 'Wallet'),
(5024, 1004, '2025-05-19', 304, 'Delivered', 'UPI');

INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, unit_price_at_sale, discount_rate) VALUES
(1.0, 5001.0, 201.0, 2.0, 799.0, 0.05),
(2.0, 5001.0, 203.0, 1.0, 1899.0, 0.0),
(3.0, 5002.0, 202.0, 1.0, 2499.0, 0.1),
(4.0, 5002.0, 205.0, 2.0, 1299.0, 0.0),
(5.0, 5003.0, 207.0, 1.0, 5999.0, 0.0),
(6.0, 5004.0, 204.0, 1.0, 14999.0, 0.08),
(7.0, 5004.0, 201.0, 1.0, 799.0, 0.0),
(8.0, 5005.0, 210.0, 1.0, 11999.0, 0.05),
(9.0, 5006.0, 209.0, 1.0, 7499.0, 0.1),
(10.0, 5006.0, 203.0, 2.0, 1899.0, 0.0),
(11.0, 5007.0, 206.0, 1.0, 3299.0, 0.0),
(12.0, 5008.0, 207.0, 1.0, 5999.0, 0.15),
(13.0, 5008.0, 208.0, 2.0, 2199.0, 0.0),
(14.0, 5009.0, 202.0, 1.0, 2499.0, 0.05),
(15.0, 5009.0, 206.0, 1.0, 3299.0, 0.0),
(16.0, 5010.0, 204.0, 1.0, 14999.0, 0.0),
(17.0, 5011.0, 208.0, 3.0, 2199.0, 0.1),
(18.0, 5012.0, 210.0, 1.0, 11999.0, 0.0),
(19.0, 5013.0, 209.0, 2.0, 7499.0, 0.05),
(20.0, 5014.0, 202.0, 2.0, 2499.0, 0.0),
(21.0, 5014.0, 203.0, 1.0, 1899.0, 0.05),
(22.0, 5015.0, 205.0, 1.0, 1299.0, 0.0),
(23.0, 5015.0, 201.0, 3.0, 799.0, 0.1),
(24.0, 5016.0, 204.0, 1.0, 14999.0, 0.05),
(25.0, 5017.0, 206.0, 2.0, 3299.0, 0.0),
(26.0, 5017.0, 208.0, 1.0, 2199.0, 0.0),
(27.0, 5018.0, 207.0, 1.0, 5999.0, 0.0),
(28.0, 5019.0, 209.0, 1.0, 7499.0, 0.1),
(29.0, 5020.0, 203.0, 2.0, 1899.0, 0.0),
(30.0, 5020.0, 201.0, 1.0, 799.0, 0.0),
(31.0, 5021.0, 210.0, 1.0, 11999.0, 0.0),
(32.0, 5022.0, 202.0, 1.0, 2499.0, 0.0),
(33.0, 5022.0, 205.0, 1.0, 1299.0, 0.0),
(34.0, 5023.0, 209.0, 1.0, 7499.0, 0.0),
(35.0, 5024.0, 204.0, 1.0, 14999.0, 0.1),
(36.0, 5024.0, 205.0, 2.0, 1299.0, 0.0);

INSERT INTO Returns (return_id, order_id, return_date, return_reason) VALUES
(9001, 5003, '2024-09-20', 'Damaged item'),
(9002, 5010, '2024-11-17', 'Changed mind'),
(9003, 5018, '2025-02-20', 'Product not as expected');

--------------------------------------Reading tables-----------------------------------------
Select * From customers;
Select * From products;
Select * From employees;
Select * From orders;
Select * From order_items; 
Select * From returns;


------------------Queries to Perform -----------------------------------------------------


--Q1. Basic filtering and sorting.
--List delivered orders placed between 1 October 2024 and 31 March 2025,showing order_id,
---order_date, customer_id, and payment_method. Sort by order_date descending. 

Select customer_id, order_id, order_date, payment_method
From orders
Where order_status = 'Delivered'
And order_date Between '2024-10-01' And '2025-03-31'
Order By order_date Desc;


--Q2. Multi-table JOIN.
--Display each delivered order with customer_name, order_id, order_date, employee_name, and order_status. 
--Include only orders with matching customer and employee records. 

Select c.customer_name, o.order_id, o.order_date, o.order_status, e.employee_name
From orders o
Inner Join customers c On 
o.customer_id= c.customer_id
Inner Join employees e On 
o.employee_id=e.employee_id
Where o.order_status = 'Delivered'
Order By o.order_date;


----Q3. Aggregation and HAVING.
----For each product category, calculate total units sold and net revenue from delivered orders. 
----Show only categories with net revenue greater than ₹10,000; sort by net revenue descending. 

Select p.category,
Sum (oi.quantity) As Total_Unit_Sold,
Round(Sum(oi.Quantity * oi.unit_price_at_sale * (1 - Discount_Rate))::Numeric,2) As Net_Revenue
From Orders o
Inner Join order_items oi On 
o.order_id=oi.order_id
Inner Join products p On
oi. product_id= p.product_id
Where o.order_status = 'Delivered'
Group By p.category
Having Sum(oi.quantity * oi.unit_price_at_sale * (1 - Discount_Rate)) > 10000
Order By Net_Revenue Desc;
-----Net Revenue = Quantity × Unit Price at Sale × (1 − Discount Rate). 
---Only delivered orders are considered.


---Q4. Customers with repeat purchases.
---Find customers who have placed at least two delivered orders. 
---Show customer_id, customer_name, number of delivered orders, and total net spend. 

Select c.customer_id, c.customer_name,
count (Distinct o.order_id) As Delivered_orders,
Round(Sum(oi.quantity * oi.unit_price_at_sale * (1-oi.discount_rate)),2) As total_net_spend
From customers c
Inner Join orders o on 
c.customer_id=o.customer_id
Inner Join order_items oi on 
o.order_id = oi.order_id
Where o.order_status = 'Delivered'
Group By c.customer_id, c.customer_name
Having Count(Distinct o.order_id) >=2
Order By total_net_spend Desc;
---Total Net Spend = Σ [Quantity × Unit Price at Sale × (1 − Discount Rate)].
---customers must have at least two delivered orders.



---Q5. LEFT JOIN and zero activity.
---List all customers and the number of delivered orders each has placed,
---including customers with zero delivered orders. 

Select c.customer_id, c.customer_name,
Count(o.order_id) As total_orders
From customers c
Left Join orders o on 
c.customer_id = o.customer_id
And o.order_status ='Delivered'
Group By  c.customer_id, c.customer_name
Order By total_orders;


--Q6. Subquery. 
--Find products whose unit_price is greater than the average unit_price of all products. 
--Display product name, category, unit price, and the overall average price. 

Select product_name, category, unit_price,
(Select Round (Avg (unit_price),2) From products) As average_price
From products
Where unit_price > (Select Round (Avg (unit_price),2) From products);


--Q7. NOT EXISTS.
--Find customers who have never placed a delivered order. 
--Return their customer_id, customer_name, and city. 

Select customer_id, customer_name, city
From customers
Where Not Exists
(select * From orders
Where order_status = 'Delivered');


--Q8. Date functions.
--Group delivered orders by year and month, showing the number of orders and net revenue for each month.
--Sort chronologically. 

Select
Extract(year from o.order_date) as years,
Extract(month from o.order_date) as months,
Count(Distinct o.order_id) as number_of_orders,
Round(Sum (oi.quantity * oi.unit_price_at_sale *(1- oi.Discount_rate)),2) as Net_Revenue
From orders o 
Join order_items oi on 
o.order_id = oi.order_id
Where o.order_status = 'Delivered'
Group By Extract(year from o.order_date),
Extract(month from o.order_date) 
Order By years  Asc, months Asc; 
---Net Revenue = Σ [Quantity × Unit Price at Sale × (1 − Discount Rate)]. 



--Q9. CASE expression. 
--Classify each product as 'Low Stock' when stock_quantity < 20, 
--'Moderate Stock' when stock_quantity is between 20 and 40 inclusive, and 'High Stock' when stock_quantity > 40.
--Display product_name, stock_quantity, and stock label. 

Select product_name, stock_quantity,
Case When stock_quantity < 20 Then 'Low Stock'
When stock_quantity Between 20 And 40 Then 'Moderate Stock'
Else 'High Stock' 
End As Stock_Label
From products
Order By Stock_quantity Desc;


--Q10. Conditional aggregation.
--For each employee, calculate delivered, returned, and cancelled order counts using conditional aggregation. 
--Include employees with no orders. 

Select e.employee_id, e.employee_name,
Count(Case When o.order_status = 'Delivered' Then 1 End) As Delivered_Order,
Count(Case When o.order_status = 'Returned' Then 1 End) As Returned_order,
Count(Case When o.order_status ='Cancelled' Then 1 End) As Cancelled_order
From employees e
Left Join orders o on 
e.employee_id = o.employee_id
Group By e.employee_id, e.employee_name
Order By employee_id;


--Q11. Window function – ranking .
--Rank products within each category by net revenue from delivered orders, highest first. 
--Show category, product_name, net revenue, and rank.
--Products with no delivered sales should still be eligible to appear with zero revenue. 

Select p.category, p.product_name, 
Coalesce (Sum (oi.quantity * oi.unit_price_at_sale * (1 - oi.discount_rate)),2) As net_revenue,
Rank() Over(Partition By p.category 
Order By Coalesce (Sum (oi.quantity * oi.unit_price_at_sale * (1 - oi.discount_rate)),2) Desc)
As product_rank
from products p
Left Join order_items oi on 
p.product_id= oi.product_id
Left Join orders o on 
oi.order_id = o.order_id
And o.order_status = 'Delivered'
Where oi.order_id is Null 
or o.order_id is Not Null
Group By p.category, p.product_name
Order By net_revenue Desc;


--Q12. Running total. 
--For each month, calculate delivered-order net revenue and 
--a cumulative running total of revenue across months in chronological order.

Select To_char (o.Order_Date, 'YYYY-MM') As Years_Months,
Round(Sum (oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)),2) As Monthly,
Round(Sum(Sum(oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)))
Over(Order By To_char (o.Order_Date, 'YYYY-MM')
Rows Between Unbounded Preceding And Current Row),2) As Running_Total
From Orders o
Join Order_Items oi
On o.Order_ID = oi.Order_ID
Where o.Order_Status = 'Delivered'
Group By To_char(o.Order_Date, 'YYYY-MM')
order by Years_Months Asc;



--Q13. Return analysis.
--List each returned order with customer name, return date, return reason,
--and the total pre-discount value of its order items. 

Select o.order_id, c.customer_name, r.return_date, r.return_reason,
sum (oi.quantity * oi.unit_price_at_sale) as Pre_discount
From returns r
Inner Join orders o on
r.order_id= o.order_id
Inner Join customers c on 
o.customer_id = c.customer_id
Inner Join order_items oi on 
o.order_id=oi.order_id
Group by  c.customer_name, r.return_date, r.return_reason, o.order_id
Order By r.return_date Desc;


--Q14. CTE .
--Using a CTE, calculate net revenue per customer from delivered orders, 
---then return customers whose net revenue is above the average customer net revenue. 
----State whether the average is calculated across all customers or only customers with delivered purchases. 

With Customer_Revenue As (
Select c.Customer_ID, c.Customer_Name,
Sum(oi.Quantity * oi.Unit_Price_at_Sale *(1 - oi.Discount_Rate)) As Net_Revenue
From Customers c
Inner Join Orders o On
c.Customer_ID = o.Customer_ID
Inner Join Order_Items oi On
o.Order_ID = oi.Order_ID 
Where o.Order_Status = 'Delivered'
Group By c.Customer_ID, c.Customer_Name)
Select Customer_ID, Customer_Name,
ROUND(Net_Revenue, 2) as Net_Revenue
From Customer_Revenue
Where Net_Revenue > (Select Avg(Net_Revenue)From Customer_Revenue)
Order By Net_Revenue Desc;


--Q15. Business insight query.
--Identify the top three customers by delivered net spend. 
---Show customer name, number of delivered orders, net spend, and
--each customer's percentage contribution to total delivered net revenue. 


Select customer_name, delivered_orders, net_spend,
ROUND(100.0 * net_spend / sum(net_spend) over (),2) as revenue_contribution_percent
From (Select C.customer_id, C.customer_name,
Count(Distinct O.order_id) as delivered_orders,
Sum(OI.quantity * OI.unit_price_at_sale * (1 - OI.discount_rate) ) As net_spend
From Customers C
Join Orders o on 
C.customer_id = O.customer_id
Join Order_Items OI on
O.order_id = OI.order_id
Where O.order_status = 'Delivered'
Group By C.customer_id, C.customer_name) AS CustomerSpend
Order By net_spend Desc
Limit 3;


------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------Thank you--------------------------------------------------------------------