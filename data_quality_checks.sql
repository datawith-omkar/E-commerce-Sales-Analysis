-- Total Rows
SELECT COUNT(*) AS Total_Rows
FROM orders;

-- Null Checks
SELECT
SUM(CASE WHEN Row_ID IS NULL THEN 1 ELSE 0 END) AS Null_Row_ID,
SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS Null_Order_ID,
SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Null_Sales,
SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Null_Profit
FROM orders;

-- Duplicate Records
SELECT
Order_ID,
Product_ID,
Customer_ID,
COUNT(*) AS Duplicate_Count
FROM orders
GROUP BY Order_ID, Product_ID, Customer_ID
HAVING COUNT(*) > 1;

-- Negative Sales
SELECT *
FROM orders
WHERE Sales < 0;

-- Negative Profit
SELECT *
FROM orders
WHERE Profit < 0;

-- Discount Validation
SELECT *
FROM orders
WHERE Discount < 0 OR Discount > 1;

-- Date Range
SELECT
MIN(Order_Date) AS First_Order_Date,
MAX(Order_Date) AS Last_Order_Date
FROM orders;
