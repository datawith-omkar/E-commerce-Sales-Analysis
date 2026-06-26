USE ecommerce_db;
#PHASE 8: ADVANCED BUSINESS KPIs

-- 1. Profit Margin %
SELECT
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Percentage
FROM orders;

-- 2. Average Discount %
SELECT
    ROUND(AVG(Discount) * 100, 2) AS Avg_Discount_Percentage
FROM orders;

-- 3. Sales Per Product
SELECT
    ROUND(SUM(Sales) / COUNT(DISTINCT Product_ID), 2) AS Sales_Per_Product
FROM orders;

-- 4. Profit Per Customer
SELECT
    ROUND(SUM(Profit) / COUNT(DISTINCT Customer_ID), 2) AS Profit_Per_Customer
FROM orders;

-- 5. Revenue By Ship Mode
SELECT
    Ship_Mode,
    ROUND(SUM(Sales), 2) AS Revenue
FROM orders
GROUP BY Ship_Mode
ORDER BY Revenue DESC;

-- 6. Profit By Ship Mode
SELECT
    Ship_Mode,
    ROUND(SUM(Profit), 2) AS Profit
FROM orders
GROUP BY Ship_Mode
ORDER BY Profit DESC;

-- 7. Average Order Value (AOV)
SELECT
    ROUND(SUM(Sales) / COUNT(DISTINCT Order_ID), 2) AS Avg_Order_Value
FROM orders;

-- 8. Revenue Per Customer
SELECT
    ROUND(SUM(Sales) / COUNT(DISTINCT Customer_ID), 2) AS Revenue_Per_Customer
FROM orders;

-- 9. Orders Per Customer
SELECT
    ROUND(COUNT(DISTINCT Order_ID) / COUNT(DISTINCT Customer_ID), 2) AS Orders_Per_Customer
FROM orders;

-- 10. Average Profit Per Order
SELECT
    ROUND(SUM(Profit) / COUNT(DISTINCT Order_ID), 2) AS Avg_Profit_Per_Order
FROM orders;

# 6) Profit by Ship Mode
SELECT
    Ship_Mode,
    ROUND(SUM(Profit), 2) AS Profit
FROM orders
GROUP BY Ship_Mode
ORDER BY Profit DESC;