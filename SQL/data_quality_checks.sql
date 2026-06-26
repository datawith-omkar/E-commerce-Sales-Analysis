# DATA QUALITY CHECKS

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