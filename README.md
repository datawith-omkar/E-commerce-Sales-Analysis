# 📊 E-Commerce Sales Analysis

## 🚀 Project Overview
This project analyzes E-Commerce sales data using SQL and Power BI to uncover business insights related to revenue, profit, customer behavior, product performance, and regional sales trends.

The objective is to transform raw sales data into actionable business insights through data cleaning, SQL analysis, and interactive Power BI dashboards.

---

## 🛠️ Tools & Technologies

- SQL (MySQL)
- Power BI
- Excel / CSV
- Power Query
- DAX
- GitHub

---

## 📂 Project Structure

```
Ecommerce-Sales-Analysis/
│
├── Dataset/
│   └── ecommerce_data.csv
│
├── SQL/
│   ├── 01_database_creation.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_exploratory_analysis.sql
│   └── 04_business_queries.sql
│
├── PowerBI/
│   └── Ecommerce_Sales_Dashboard.pbix
│
├── Dashboard_Screenshots/
│
└── README.md
```

---

## 📌 Business Questions Solved

### Sales Performance
- Total Revenue Generated
- Monthly Sales Trend
- Revenue by Category
- Revenue by Sub-Category

### Profit Analysis
- Most Profitable Categories
- Least Profitable Products
- Profit Margin Analysis
- Regional Profitability

### Customer Analysis
- Top Customers by Revenue
- Customer Segment Performance
- Repeat Customer Analysis

### Product Analysis
- Best Selling Products
- Top Performing Categories
- Quantity Sold Analysis

### Regional Analysis
- Revenue by Region
- Profit by Region
- State-wise Performance

---

## 🧹 Data Cleaning Process

Performed using SQL:

- Removed duplicate records
- Handled missing values
- Standardized date formats
- Validated sales and profit values
- Checked data consistency

---

## 📈 SQL Analysis

### Database Creation

```sql
CREATE DATABASE ecommerce_sales;
```

### Sample Business Query

```sql
SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;
```

---

## 📊 Power BI Dashboard Features

### Page 1: Executive Overview
[dashboard-overview.png]
- Total Revenue
- Total Profit
- Total Orders
- Profit Margin %
- Monthly Revenue Trend

### Page 2: Customer Insights
[customer-insights.png]
- Revenue by Segment
- Top Customers
- Customer Contribution

### Page 3: Product Performance
[product-performance.png]
- Revenue by Category
- Revenue by Sub-Category
- Top Products

### Page 4: Regional Analysis
[regional-analysis.png]
- Revenue by Region
- Profit by Region
- State Performance

---

## 📷 Dashboard Preview

("C:\Users\omkar\Desktop\Ecommerce data Analysiss.pbix")

---

## 📈 Key Insights

- Technology category generated the highest revenue.
- West region contributed the highest profit.
- A small group of customers generated a significant share of revenue.
- Certain sub-categories had high sales but low profitability.

---

## 🎯 Skills Demonstrated

- SQL Data Cleaning
- Exploratory Data Analysis
- Business Query Writing
- Power BI Dashboard Development
- Data Modeling
- DAX Calculations
- Business Insight Generation

---

## 👨‍💻 Author

**Omkar Patil**

Aspiring Data Analyst | Excel | Power BI

GitHub:
https://github.com/datawith-omkar

LinkedIn:
(https://www.linkedin.com/in/omkar-patil1515)

Resume
( )

