-- Superstore Sales Analysis
-- Author: Gurjit Singh Gill
-- Tool: DB Browser for SQLite
-- Dataset: Superstore retail transactions 2015-2018


-- total sales across all regions
SELECT 
    ROUND(SUM(Sales), 2) AS total_sales
FROM orders;


-- which region makes the most sales
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM orders), 1) AS sales_percentage
FROM orders
GROUP BY Region
ORDER BY total_sales DESC;


-- sales by product category
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS total_orders
FROM orders
GROUP BY Category
ORDER BY total_sales DESC;


-- how much each customer segment contributes to revenue
SELECT 
    Segment,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM orders), 1) AS revenue_percentage
FROM orders
GROUP BY Segment
ORDER BY total_sales DESC;


-- yearly sales trend 2015 to 2018
SELECT 
    STRFTIME('%Y', Order_Date) AS year,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS total_orders
FROM orders
GROUP BY year
ORDER BY year ASC;


-- top 10 best selling products
SELECT 
    Product_Name,
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    COUNT(*) AS times_ordered
FROM orders
GROUP BY Product_Name, Category
ORDER BY total_sales DESC
LIMIT 10;


-- profit margin by region
SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 1) AS profit_margin_pct
FROM orders
GROUP BY Region
ORDER BY total_profit DESC;


-- orders and sales by shipping method
SELECT 
    Ship_Mode,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(AVG(Sales), 2) AS avg_order_value
FROM orders
GROUP BY Ship_Mode
ORDER BY total_orders DESC;
