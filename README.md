# Retail-Sales-Analysis
SQL | Retail Sales Analysis Project
# 🛍️ Retail Sales Analysis — SQL Project

### 📘 Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: `retail_sales`  
**Tools**: PostgreSQL  

This project showcases my foundational SQL skills through the exploration and analysis of a fictional retail sales dataset. It involves creating a database, cleaning and preparing the data, performing exploratory analysis, and answering realistic business questions using SQL queries.

> 🧠 **Note**: This is my **first-ever SQL project**, and I’m proud to share it as the beginning of my journey in data analysis. I’m excited to grow and take on more advanced projects in the future!

---

### 🎯 Objectives

1. **Database Setup**: Create and structure the `retail_sales` table for transactional data.
2. **Data Cleaning**: Identify and remove records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Understand the dataset using descriptive queries.
4. **Business Insights**: Answer key business questions related to sales, customers, and product performance.

---

### 🏗️ Project Structure

#### 1. Table Setup

```sql
CREATE TABLE retail_sales (
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
```

#### 2. Data Cleaning

```sql
DELETE FROM retail_sales
WHERE sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL
   OR gender IS NULL OR age IS NULL OR category IS NULL
   OR quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```
### 🔍 Key Business Questions Answered

- How many unique customers are in the dataset?
- What are the most popular product categories?
- What are the peak shopping hours (Morning, Afternoon, Evening)?
- Who are the top 5 customers with the highest total sales?
- What is the average age of customers in the "Beauty" category?
- Which month in each year had the highest average sales?
- What is the number of unique customers per category?
- Which age group makes the most purchases?

> 📂 All queries are available in the file: `Retail sales project.sql`

---

### 📌 Findings

- **Customer Demographics**: Majority of sales come from young adult customers.
- **High-Value Transactions**: Multiple transactions had values exceeding 1000.
- **Sales Trends**: Clear patterns across months and times of day.
- **Product Insights**: Clothing and beauty are among the top-performing categories.

---

### 📂 Files Included

- `Retail sales project.sql`: All SQL queries used for data cleaning, analysis, and insights.

---


### 👩‍💻 By : Raghad Khudair

This project is part of my learning portfolio as a beginner in SQL and data analysis. I'm looking forward to building more projects, gaining new skills, and growing in the data field.
> 🌱 Thanks for reading! More projects coming soon — stay tuned.
