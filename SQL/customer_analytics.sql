USE ecommerce_db;
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

