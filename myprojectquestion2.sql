------------------------------------------------------------------------------------------------------------
---- --------------------Motor cycle sales data Analysis project-------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
 --------------- -file extracted as a csv file and loaded into this SQL Management System Appli--

--------------- Find the total sales for each payments --------

SELECT payment,
       round (sum(total),2) as total_sales
FROM sales_data
group by payment
order by total_sales ;
-----------------------What is the average unit price for each product?

SELECT product_line,
     round (avg(unit_price),2) as avg_unit_price
from sales_data
group by product_line;


---- ---------- Calculate the product with the highest sales total  

select product_line as products,
	round(sum(total), 2) as sales_total 
FROM Sales_data
group by product_line
order by sales_total desc;

-----Calculate total sales by product category 

select product_line as products,
	   Round(sum(total),2)  as total_sales 
FROM Sales_data
group by products
order by total_sales;

---- ---Show the distinct retail warehouse we have in our dataset

select  distinct warehouse,client_type
from sales_data
WHERE Client_type = 'retail';

---  Rank product line order by quantity

SELECT product_line, 
	sum(quantity) as total_quantity
FROM sales_data
group by product_line
order by total_quantity desc;


---- ------Show the highest sales by Client type------------------------------------------- 
	
SELECT DISTINCT client_type, sum(unit_price* quantity) as total_price_sold
FROM sales_data
GROUP BY client_type
ORDER BY total_price_sold desc;

---- Show the date that has the highest sale -------------------

SELECT DISTINCT date, client_type, unit_price, product_line,
quantity, round((unit_price* quantity),2) as total_price
from sales_data
group by date
order by total_price desc
limit  2;


---------------- -----------THE END ------------------------------------------
