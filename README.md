# Brazilian E-Commerce Analytics

An end-to-end e-commerce analytics project using the **Brazilian E-Commerce Public Dataset by Olist**. The project analyzes sales, customers, products, sellers, delivery performance, reviews, and payment behavior using **Microsoft SQL Server, Power BI Desktop, and Power BI Service**.

---

## Data Source

This project uses the Brazilian E-Commerce Public Dataset by Olist.

Source:
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

The dataset was provided by Olist and contains approximately 100,000
orders from 2016 to 2018.

The dataset includes information related to:
- Customers
- Orders
- Order Items
- Payments
- Reviews
- Products
- Sellers
- Geolocation
- Product Category Translation

The raw dataset is not included in this GitHub repository.
Please download it directly from the original Kaggle source above.

Dataset License: CC BY-NC-SA 4.0

---

## Project Overview

The project transforms raw e-commerce data into structured business analysis through:

- Database creation and relational data modeling
- Data import and validation
- Business-rule checks
- KPI analysis
- Business question analysis
- Advanced SQL analysis
- Reusable SQL reporting objects
- Interactive Power BI reporting
- Power BI Service publishing and executive dashboard development

---

## Dataset

The Olist dataset contains multiple related tables:

- `customers`
- `orders`
- `order_items`
- `order_payments`
- `order_reviews`
- `products`
- `sellers`
- `geolocation`
- `product_category_name_translation`

The tables were analyzed using their relevant primary and foreign key relationships.

---

## Tools Used

### Microsoft SQL Server

Used for:

- Database and table creation
- CSV data import
- Row-count verification
- Duplicate checks
- Primary key validation
- Foreign key validation
- Business-rule validation
- ER diagram creation
- KPI analysis
- Business question analysis
- Advanced SQL analysis
- SQL Views
- Stored Procedures
- User Defined Function analysis

### Power BI Desktop

Used for:

- Data modeling and relationships
- DAX measures
- KPI cards
- Interactive report pages
- Trend analysis
- Category and product analysis
- Customer and seller analysis
- Delivery analysis
- Review and payment analysis
- Geographic analysis
- Interactive filters

### Power BI Service

Used for:

- Publishing the Power BI report
- Creating an executive-level dashboard
- Arranging and presenting dashboard tiles
- Creating a high-level business performance view

---

## Data Preparation & Validation

The SQL workflow included:

1. Database creation
2. Table creation
3. CSV import
4. Row-count verification
5. Duplicate checks
6. Primary key validation
7. Foreign key validation
8. Business-rule validation
9. ER diagram creation
10. KPI analysis
11. Business question analysis
12. Advanced analysis

### Business Rule Checks

Business-rule checks included validation of:

- Payment installments
- Review scores
- Product prices
- Freight values
- Order and delivery date consistency
- Estimated delivery dates

---

# Business Analysis

The analysis covers the following business areas.

## Sales Analysis

- Top products by quantity sold
- Top and bottom product categories by revenue
- Top and bottom sellers by revenue
- Revenue by state
- Revenue by month, quarter, and year
- Order volume analysis
- Average Order Value analysis

## Customer Analysis

- Total unique customers
- Top customers by spending
- Repeat customers
- One-time customers
- Customers by state and city
- Average orders per customer
- Customer purchasing behavior

## Product Analysis

- Best and least-performing product categories
- Most and least expensive products
- Revenue contribution by product category
- Average product price by category
- Product category order volume

## Seller Analysis

- Top sellers by revenue
- Top sellers by average order value
- Seller performance comparison
- Sellers by state
- Average revenue per seller

## Delivery Analysis

- Late deliveries
- On-time delivery rate
- Average delivery time
- Delivery time by state
- Fastest delivery states
- Slowest delivery states

## Review Analysis

- Review score distribution
- Average review score by category
- Average review score by seller
- Late delivery vs. review score
- Top-rated product categories

## Payment Analysis

- Payment method distribution
- Revenue by payment type
- Payment value by number of installments
- Payment count by number of installments
- Average number of installments
- Average payment value by payment type

---

# Advanced SQL Analysis

Advanced SQL was used for more detailed business analysis, including:

- Running cumulative revenue
- Revenue contribution by product category
- Top products within each category
- Monthly revenue growth
- Previous month vs. current month revenue
- Customer spending ranking
- Seller revenue ranking
- Top customers within each state

### SQL Concepts Used

- `JOIN`
- `GROUP BY`
- `HAVING`
- `CASE`
- Aggregate functions
- Subqueries
- CTEs
- Window Functions
- `LAG()`
- `RANK()`
- `DENSE_RANK()`
- `NTILE()`
- `SUM() OVER()`
- `PARTITION BY`

### SQL Reporting Objects

Reusable SQL reporting objects were created for areas such as:

- Sales Summary
- Customer Summary
- Seller Performance
- Product Performance

Stored procedures were developed for recurring analysis such as:

- Monthly Revenue
- Revenue by State

A Customer Revenue User Defined Function was also included as part of the advanced SQL work.

---

# Power BI Report

The Power BI Desktop report contains **six analytical pages** with interactive filters for:

- Year
- Product Category
- State

## 1. Executive Dashboard

The executive overview provides a high-level view of business performance.

### KPIs

| Metric | Value |
|---|---:|
| Total Revenue | R$15.84M |
| Total Orders | 99K |
| Unique Customers | 96K |
| Average Order Value | R$159.33 |
| Total Sellers | 3K |
| Average Review Score | 4.1 |

### Visuals

- Monthly Revenue Trend
- Orders & Revenue Trend
- Payment Value by Payment Method
- Order Status Distribution
- Revenue by State
- Key Business Insights

---

## 2. Sales Analysis

### KPIs

- Total Revenue: **R$15.84M**
- Average Order Value: **R$159.33**

### Visuals

- Monthly Revenue Trend
- Top 10 Product Categories by Revenue
- Bottom 10 Product Categories by Revenue
- Top 10 Sellers by Revenue
- Top 10 Categories by Order Volume

---

## 3. Product & Seller Analysis

### KPIs

- Total Products: **33K**
- Average Revenue per Seller: **R$5.12K**
- Product Categories: **74**
- Total Sellers: **3K**

### Visuals

- Revenue by Product Category
- Average Product Price by Category
- Top 10 Categories by Average Price
- Top 10 Sellers by Revenue
- Top 10 Sellers by Average Order Value
- Total Sellers by State

---

## 4. Customer Analysis

### KPIs

- Unique Customers: **96K**
- Repeat Customers: **3K**
- Average Orders per Customer: **1.03**

### Visuals

- Orders per Customer Distribution
- Top 10 Customers by Spending
- Repeat Customers vs. One-Time Customers
- Customers by City
- Customers by State

### Customer Definition

A **unique customer** is identified using `customer_unique_id`.

A **repeat customer** is a unique customer associated with more than one order.

Customers who are not repeat customers are classified as **one-time customers** for this analysis.

---

## 5. Review & Payment Analysis

### KPIs

- Average Review Score: **4.1**
- Total Reviews: **99K**
- Average Number of Installments: **2.85**

### Visuals

- Review Score Distribution
- Top 10 Categories by Average Review Score
- Payment Type Distribution
- Revenue by Payment Type
- Payment Value by Number of Installments
- Payment Count by Number of Installments

---

## 6. Delivery & Logistics

### KPIs

- Average Delivery Days: **12.50**
- On-Time Delivery Rate: **91.89%**
- Late Deliveries: **8K**

### Visuals

- Average Delivery Days by Month
- Average Delivery Days by State
- Top 10 Fastest States by Delivery Time
- On-Time vs. Late Deliveries
- Top 10 Slowest States by Delivery Time

---

# Power BI Service Executive Dashboard

The Power BI report was published to **Power BI Service** and used to create an executive-level dashboard for a high-level view of business performance.

The Service dashboard focuses on key business dimensions rather than repeating every detailed report visual.

### Executive Dashboard Highlights

- Total Revenue
- Total Orders
- Unique Customers
- On-Time Delivery Rate
- Average Review Score
- Monthly Revenue Trend
- Revenue by State
- Top Product Categories by Revenue
- Repeat vs. One-Time Customers
- Payment Type Distribution
- On-Time vs. Late Orders
- Key Business Insights

The Power BI Service dashboard provides a summarized executive view, while the Power BI report contains detailed analysis across Sales, Product & Seller, Customer, Review & Payment, and Delivery & Logistics.

**Dashboard PDF:** `Brazilian Ecommerce PowerBI Executive Dashboard.pdf`

---

# Key Insights

- Total revenue reached approximately **R$15.84M**.
- Revenue peaked at approximately **R$1.2M in November 2017**.
- **SP** generated the highest revenue at approximately **R$5.9M**.
- Credit cards contributed approximately **78.34% of total payment value**.
- Delivered orders accounted for approximately **97.02% of total orders**.
- The analysis contains approximately **96K unique customers** and **3K repeat customers**.
- Average orders per customer were approximately **1.03**.
- Average delivery time was **12.50 days**.
- The on-time delivery rate was **91.89%**.
- Approximately **8K deliveries** were late.
- The average customer review score was **4.1**.

---

# Business Recommendations

Based on the analysis:

- Focus sales and marketing efforts on high-performing states and product categories.
- Develop customer retention strategies to increase repeat purchases.
- Monitor seller performance using revenue, order value, and review metrics.
- Investigate regions with slower delivery times and higher late-delivery levels.
- Use customer reviews to identify product, seller, and delivery issues.
- Monitor payment behavior and maintain support for widely used payment methods.
- Track sales, customer, seller, product, and delivery KPIs regularly.

---

# Project Structure

```text
Brazilian-E-Commerce-Analytics/
│
├── README.md
│
├── SQL/
│   ├── Database Setup
│   ├── Data Validation
│   ├── Business Analysis
│   ├── Advanced SQL
│   └── Reporting Objects
│
└── Power BI/
    │
    ├── Brazilian Ecommerce Olist PowerBI Report.pbix
    │
    ├── Brazilian Ecommerce PowerBI Executive Dashboard.pdf
    │
    └── Power BI Report Screenshots/
        ├── 01_Executive_Dashboard.png
        ├── 02_Sales_Analysis.png
        ├── 03_Product_Seller_Analysis.png
        ├── 04_Customer_Analysis.png
        ├── 05_Review_Payment_Analysis.png
        └── 06_Delivery_Logistics.png
```

---

# Project Outcome

This project demonstrates practical experience in **Microsoft SQL Server, Power BI Desktop, and Power BI Service**, including:

- Data validation
- Relational data analysis
- KPI development
- Advanced SQL
- Business analysis
- DAX-based reporting
- Interactive dashboard development
- Report publishing
- Executive dashboard creation

The final solution transforms raw e-commerce data into structured business insights across **sales, customers, products, sellers, delivery, reviews, and payments**.
