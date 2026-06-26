CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE orders(
Row_ID INT,
Order_ID VARCHAR(50),
Order_Date VARCHAR(20),
Ship_Date VARCHAR(20),
Ship_Mode VARCHAR(50),
Customer_ID VARCHAR(50),
Customer_Name VARCHAR(100),
Segment VARCHAR(50),
Country VARCHAR(50),
City VARCHAR(100),
State VARCHAR(100),
Postal_Code VARCHAR(20),
Region VARCHAR(50),
Product_ID VARCHAR(50),
Category VARCHAR(50),
Sub_Category VARCHAR(50),
Product_Name VARCHAR(255),
Sales DECIMAL(10,2),
Quantity INT,
Discount DECIMAL(5,2),
Profit DECIMAL(10,2)
);

ALTER TABLE orders
MODIFY COLUMN Order_Date VARCHAR(20);
SELECT COUNT(*) FROM orders;

SELECT * FROM orders LIMIT 10;

SELECT COUNT(*) FROM orders;

DESCRIBE orders;

SHOW COLUMNS FROM orders;

SELECT COUNT(DISTINCT Order_ID) AS Total_Orders
FROM orders;
# PHASE 1: DATA QUALITY CHECKS
# 1) Total Rows
SELECT COUNT(*) AS Total_Rows
FROM orders;
# 2) Null Check
SELECT
    SUM(CASE WHEN Row_ID IS NULL THEN 1 ELSE 0 END) AS Null_Row_ID,
    SUM(CASE WHEN Order_ID IS NULL THEN 1 ELSE 0 END) AS Null_Order_ID,
    SUM(CASE WHEN Order_Date IS NULL THEN 1 ELSE 0 END) AS Null_Order_Date,
    SUM(CASE WHEN Ship_Date IS NULL THEN 1 ELSE 0 END) AS Null_Ship_Date,
    SUM(CASE WHEN Ship_Mode IS NULL THEN 1 ELSE 0 END) AS Null_Ship_Mode,
    SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Null_Customer_ID,
    SUM(CASE WHEN Customer_Name IS NULL THEN 1 ELSE 0 END) AS Null_Customer_Name,
    SUM(CASE WHEN Segment IS NULL THEN 1 ELSE 0 END) AS Null_Segment,
    SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS Null_Country,
    SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS Null_City,
    SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS Null_State,
    SUM(CASE WHEN Postal_Code IS NULL THEN 1 ELSE 0 END) AS Null_Postal_Code,
    SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END) AS Null_Region,
    SUM(CASE WHEN Product_ID IS NULL THEN 1 ELSE 0 END) AS Null_Product_ID,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS Null_Category,
    SUM(CASE WHEN Sub_Category IS NULL THEN 1 ELSE 0 END) AS Null_Sub_Category,
    SUM(CASE WHEN Product_Name IS NULL THEN 1 ELSE 0 END) AS Null_Product_Name,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Null_Sales,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS Null_Quantity,
    SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS Null_Discount,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS Null_Profit
FROM orders;
# 3) Duplicate Check

SELECT 
    Order_ID,
    Product_ID,
    Customer_ID,
    Order_Date,
    Sales,
    COUNT(*) AS duplicate_count
FROM orders
GROUP BY 
    Order_ID,
    Product_ID,
    Customer_ID,
    Order_Date,
    Sales
HAVING COUNT(*) > 1;
# 4) Negative Sales Check

SELECT *
FROM orders
WHERE Sales < 0;
# 5) Negative Profit Check

SELECT *
FROM orders
WHERE Profit < 0;
# 6) Discount Outlier Check

SELECT *
FROM orders
WHERE Discount < 0 OR Discount > 1;
# 7) Date Range Check
SELECT
    MIN(Order_Date) AS First_Order_Date,
    MAX(Order_Date) AS Last_Order_Date
FROM orders;


# PHASE 2: EXPLORATORY DATA ANALYSIS (EDA)
# KPI 1: Total Revenue
SELECT
    ROUND(SUM(Sales), 2) AS Total_Revenue
FROM orders;

# KPI 2: Total Profit
SELECT
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM orders;
# KPI 3: Total Customers
SELECT
    COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM orders;
# KPI 4: Total Orders
SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM orders;
# KPI 5: Total Products
SELECT
    COUNT(DISTINCT Product_ID) AS Total_Products
FROM orders;
# KPI 6: Total Quantity Sold
SELECT
    SUM(Quantity) AS Total_Quantity_Sold
FROM orders;


# PHASE 3: CUSTOMER ANALYTICS

# 1) Top 20 Customers by Revenue
SELECT
    Customer_Name,
    ROUND(SUM(Sales), 2) AS Revenue
FROM orders
GROUP BY Customer_Name
ORDER BY Revenue DESC
LIMIT 20;

# 2) Customer Lifetime Value (CLV)
SELECT
    Customer_ID,
    Customer_Name,
    ROUND(SUM(Sales), 2) AS Lifetime_Value
FROM orders
GROUP BY Customer_ID, Customer_Name
ORDER BY Lifetime_Value DESC;

# 3) Segment Performance
SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit
FROM orders
GROUP BY Segment
ORDER BY Revenue DESC;

# 4) Orders per Customer
SELECT
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM orders
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Orders DESC;

# 5) Repeat Customers
SELECT
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Order_Count
FROM orders
GROUP BY Customer_ID, Customer_Name
HAVING COUNT(DISTINCT Order_ID) > 1
ORDER BY Order_Count DESC;


# PHASE 4: ORDER ANALYTICS
# 1) Average Order Value
SELECT
    ROUND(SUM(Sales) / COUNT(DISTINCT Order_ID), 2) AS Avg_Order_Value
FROM orders;

# 2) Revenue Per Customer
SELECT
    ROUND(SUM(Sales) / COUNT(DISTINCT Customer_ID), 2) AS Revenue_Per_Customer
FROM orders;

# 3) Orders Per Customer
SELECT
    ROUND(COUNT(DISTINCT Order_ID) / COUNT(DISTINCT Customer_ID), 2) AS Orders_Per_Customer
FROM orders;

# 4) Average Profit Per Order
SELECT
    ROUND(SUM(Profit) / COUNT(DISTINCT Order_ID), 2) AS Avg_Profit_Per_Order
FROM orders;


# PHASE 5: PRODUCT ANALYTICS

# 1) Top 10 Products by Revenue
SELECT
    Product_Name,
    ROUND(SUM(Sales), 2) AS Revenue
FROM orders
GROUP BY Product_Name
ORDER BY Revenue DESC
LIMIT 10;

# 2) Top 10 Products by Profit
SELECT
    Product_Name,
    ROUND(SUM(Profit), 2) AS Profit
FROM orders
GROUP BY Product_Name
ORDER BY Profit DESC
LIMIT 10;

# 3) Loss-Making Products
SELECT
    Product_Name,
    ROUND(SUM(Profit), 2) AS Profit
FROM orders
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY Profit ASC;

# 4) Most Discounted Products
SELECT
    Product_Name,
    ROUND(AVG(Discount), 2) AS Avg_Discount
FROM orders
GROUP BY Product_Name
ORDER BY Avg_Discount DESC
LIMIT 20;

# 5) Category Analysis
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit
FROM orders
GROUP BY Category
ORDER BY Revenue DESC;

# 6) Sub-Category Analysis
SELECT
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Revenue,
    ROUND(SUM(Profit), 2) AS Profit
FROM orders
GROUP BY Sub_Category
ORDER BY Revenue DESC;

# 7) Quantity Sold by Product
SELECT
    Product_Name,
    SUM(Quantity) AS Total_Quantity
FROM orders
GROUP BY Product_Name
ORDER BY Total_Quantity DESC
LIMIT 20;


# PHASE 6: GEOGRAPHICAL ANALYSIS

# 1) Region Wise Revenue
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Revenue
FROM orders
GROUP BY Region
ORDER BY Revenue DESC;

# 2) Region Wise Profit
SELECT
    Region,
    ROUND(SUM(Profit), 2) AS Profit
FROM orders
GROUP BY Region
ORDER BY Profit DESC;

# 3) State Wise Revenue
SELECT
    State,
    ROUND(SUM(Sales), 2) AS Revenue
FROM orders
GROUP BY State
ORDER BY Revenue DESC;

# 4) State Wise Profit
SELECT
    State,
    ROUND(SUM(Profit), 2) AS Profit
FROM orders
GROUP BY State
ORDER BY Profit DESC;

# 5) Top 15 Cities by Revenue
SELECT
    City,
    ROUND(SUM(Sales), 2) AS Revenue
FROM orders
GROUP BY City
ORDER BY Revenue DESC
LIMIT 15;

# 6) Top 15 Cities by Profit
SELECT
    City,
    ROUND(SUM(Profit), 2) AS Profit
FROM orders
GROUP BY City
ORDER BY Profit DESC
LIMIT 15;


# PHASE 7: TIME SERIES ANALYSIS

# 1) Monthly Sales Trend
SELECT
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    ROUND(SUM(Sales), 2) AS Revenue
FROM orders
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month;

# 2) Monthly Profit Trend
SELECT
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    ROUND(SUM(Profit), 2) AS Profit
FROM orders
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month;

# 3) Best Sales Month
SELECT
    MONTHNAME(Order_Date) AS Month,
    ROUND(SUM(Sales), 2) AS Revenue
FROM orders
GROUP BY MONTHNAME(Order_Date)
ORDER BY Revenue DESC;

# 4) Best Profit Month
SELECT
    MONTHNAME(Order_Date) AS Month,
    ROUND(SUM(Profit), 2) AS Profit
FROM orders
GROUP BY MONTHNAME(Order_Date)
ORDER BY Profit DESC;

# 5) Yearly Sales Trend
SELECT
    YEAR(Order_Date) AS Year,
    ROUND(SUM(Sales), 2) AS Revenue
FROM orders
GROUP BY YEAR(Order_Date)
ORDER BY Year;

# 6) Yearly Profit Trend
SELECT
    YEAR(Order_Date) AS Year,
    ROUND(SUM(Profit), 2) AS Profit
FROM orders
GROUP BY YEAR(Order_Date)
ORDER BY Year;


#PHASE 8: ADVANCED BUSINESS KPIs
# 1) Profit Margin %
SELECT
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percentage
FROM orders;

# 2) Average Discount
SELECT
    ROUND(AVG(Discount) * 100, 2) AS Avg_Discount_Percentage
FROM orders;

# 3) Sales per Product
SELECT
    ROUND(SUM(Sales) / COUNT(DISTINCT Product_ID), 2) AS Sales_Per_Product
FROM orders;

# 4) Profit per Customer
SELECT
    ROUND(SUM(Profit) / COUNT(DISTINCT Customer_ID), 2) AS Profit_Per_Customer
FROM orders;

# 5) Revenue by Ship Mode
SELECT
    Ship_Mode,
    ROUND(SUM(Sales), 2) AS Revenue
FROM orders
GROUP BY Ship_Mode
ORDER BY Revenue DESC;

# 6) Profit by Ship Mode
SELECT
    Ship_Mode,
    ROUND(SUM(Profit), 2) AS Profit
FROM orders
GROUP BY Ship_Mode
ORDER BY Profit DESC;