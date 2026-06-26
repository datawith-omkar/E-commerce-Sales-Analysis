USE ecommerce_db;
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
