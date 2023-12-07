------------------------------------------------------------------------------------------------------------
---- --------------------Motor cycle sales data Analysis project-------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
 --------------- -file extracted as a csv file and loaded into this SQL Management System Appli--

--------------- Find the total sales for each payments --------

SELECT payment,
       round (sum(total),2) as total_sales
FROM sales_data
GROUP BY payment
ORDER BY total_sales ;
-----------------------What is the average unit price for each product?

SELECT product_line,
     round (avg(unit_price),2) AS avg_unit_price
FROM sales_data
GROUP BY product_line;


---- ---------- Calculate the product with the highest sales total  

SELECT product_line AS products,
	round(sum(total), 2) as sales_total 
FROM Sales_data
GROUP BY product_line
ORDER BY sales_total DESC;

-----Calculate total sales by product category 

SELECT product_line as products,
	   Round(sum(total),2)  as total_sales 
FROM Sales_data
GROUP BY products
ORDER BY total_sales;

---- ---Show the distinct retail warehouse we have in our dataset

select  distinct warehouse,client_type
from sales_data
WHERE Client_type = 'retail';

---  Rank product line order by quantity

SELECT product_line, 
	sum(quantity) AS total_quantity
FROM sales_data
GROUP BY product_line
ORDER BY total_quantity DESC;


---- ------Show the highest sales by Client type------------------------------------------- 
	
SELECT DISTINCT client_type, sum(unit_price* quantity) as total_price_sold
FROM sales_data
GROUP BY client_type
ORDER BY total_price_sold desc;

---- Show the date that has the highest sale -------------------

SELECT DISTINCT date, client_type, unit_price, product_line,
quantity, round((unit_price* quantity),2) as total_price
FROM sales_data
GROUP BY date
ORDER BY total_price desc
LIMIT  2;


---------------- -----------THE END ------------------------------------------
