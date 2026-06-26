USE ecommerce_db;
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