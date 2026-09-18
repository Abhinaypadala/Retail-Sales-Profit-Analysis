CREATE DATABASE retail_db;
USE retail_db;
SHOW TABLES;
  
 DESCRIBE orders;
 
 SELECT COUNT(*) AS total_rows
FROM orders;

SELECT
    COUNT(*) AS total_rows,
    COUNT(`Order ID`) AS order_id,
    COUNT(`Order Date`) AS order_date,
    COUNT(`Customer ID`) AS customer_id,
    COUNT(`Customer Name`) AS customer_name,
    COUNT(`Sales`) AS sales,
    COUNT(`Profit`) AS profit
FROM orders;

SELECT `Order ID`, COUNT(*) AS order_count
FROM orders
GROUP BY `Order ID`
HAVING COUNT(*) > 1;


SELECT
    Category,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY Category;

SELECT  `Product Name`,sum(sales) as total_sales
from orders 
group by  `Product Name`
order by total_sales DESC;

SELECT  Region,sum(sales) as total_sales
from orders 
group by  Region
order by total_sales DESC;

select `Customer Segment`,sum(sales) as total_sales,
sum(profit) as total_profit
from orders 
group by`Customer Segment`
order by total_sales DESC,total_profit DESC;

SELECT 
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS order_year,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY order_year
ORDER BY order_year;

SELECT 
    month(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS order_month,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY order_month
ORDER BY order_month DESC;

SELECT Category,sum(sales) as total_sales,
sum(profit) as total_profit
FROM  orders
group by Category
ORDER by total_sales DESC ,total_profit DESC;

SELECT DISTINCT Category
FROM orders;
  
SELECT `Product Name`,sum(sales)as total_sales,
sum(profit)as total_profit
FROM orders
GROUP BY `Product Name`
ORDER BY total_sales DESC, total_profit DESC;

SELECT 
    Category,
    AVG(Discount) AS avg_discount,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY Category
ORDER BY avg_discount DESC;

SELECT 
    `Product Name`,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY `Product Name`
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC;

SELECT `Customer Name`,sum(sales) as total_sales,
	sum(profit) as total_profit
    FROM orders
    GROUP BY `Customer Name`
    ORDER BY total_sales DESC,total_profit DESC
    LIMIT 10;
    
    SELECT
    Region,
    AVG(
        DATEDIFF(
            STR_TO_DATE(`Ship Date`, '%d-%m-%Y'),
            STR_TO_DATE(`Order Date`, '%d-%m-%Y')
        )
    ) AS avg_shipping_days
FROM orders
GROUP BY Region
ORDER BY avg_shipping_days DESC;