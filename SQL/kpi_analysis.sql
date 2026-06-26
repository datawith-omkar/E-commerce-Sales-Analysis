USE ecommerce_db;
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
