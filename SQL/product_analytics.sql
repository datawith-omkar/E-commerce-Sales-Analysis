USE ecommerce_db;
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