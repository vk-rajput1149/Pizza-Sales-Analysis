-- Creating a table
CREATE TABLE PizzaSales (
    pizza_id INT,
    order_id INT,
    pizza_name_id TEXT,
    quantity INT,
    order_date DATE,
    order_time TIME,
    unit_price NUMERIC,
    total_price NUMERIC,
    pizza_size TEXT,
    pizza_category TEXT,
    pizza_ingredients TEXT,
    pizza_name TEXT
);

--Preview the table
SELECT * FROM PizzaSales;

-- Change the datestyle for not getting any error
SET datestyle = 'DMY';

-- Importing the data csv file
COPY PizzaSales
FROM 'E:/pizza_sales.csv'
DELIMITER ','
CSV HEADER
QUOTE '"';


-- Preview the table data
SELECT * FROM PizzaSales;

-->> Here we are calculating the KPIs values-

--1. Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM PizzaSales;

--2. Average Order Value:
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS avg_order_value FROM PizzaSales;

--3. Total Pizza Sold:
SELECT SUM(quantity) AS total_pizza_sold FROM PizzaSales;

--4. Total Orders:
SELECT COUNT(DISTINCT order_id) AS total_order FROM PizzaSales;


--5. Average Pizza Per Order:
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/ 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS avg_pizza_per_order FROM PizzaSales;

-->> Here we are calculating the Charts values-

--6. Daily Trend For Total Orders:
SELECT 
    TO_CHAR(order_date, 'FMDay') AS order_day, 
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    PizzaSales
GROUP BY 
    TO_CHAR(order_date, 'FMDay')
ORDER BY 
    CASE TO_CHAR(order_date, 'FMDay')
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END;

--7. Monthly Trend for Total Orders:
SELECT 
    TO_CHAR(order_date, 'FMMonth') AS month_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    PizzaSales
GROUP BY 
    TO_CHAR(order_date, 'FMMonth'),
    DATE_PART('month', order_date)
ORDER BY 
    DATE_PART('month', order_date);

--8. Percentage of Sales By Pizza Category:
SELECT pizza_category, SUM(total_price) AS total_sales, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM PizzaSales) AS DECIMAL(10,2)) AS pc_sales
FROM PizzaSales
GROUP BY pizza_category;

--9. Percentage of Sales by Pizza Size:
SELECT pizza_size, SUM(total_price) AS total_sales, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM PizzaSales) AS DECIMAL(10,2)) AS pc_sales
FROM PizzaSales
GROUP BY pizza_size
ORDER BY pc_sales DESC;

--10. Top 5 best sellers by revenue, total quantity and total orders:
SELECT pizza_name, SUM(total_price) AS total_revenue FROM PizzaSales
GROUP BY pizza_name
ORDER BY total_revenue DESC LIMIT(5);

--TOAL QUANTITY-
SELECT pizza_name, SUM(quantity) AS total_quantity FROM PizzaSales
GROUP BY pizza_name
ORDER BY total_quantity DESC LIMIT(5);

--TOTAL ORDERS- 
SELECT pizza_name, COUNT(DISTINCT order_id) AS total_orders FROM PizzaSales
GROUP BY pizza_name
ORDER BY total_orders DESC LIMIT(5);