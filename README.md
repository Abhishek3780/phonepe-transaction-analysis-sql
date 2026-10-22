# 📱 PhonePe Transaction Analysis Using SQL

### 📊 Exploring Digital Payments, Transaction Performance & User Behavior

## 📌 Project Overview

This project focuses on analyzing digital payment transactions and user behavior using **MySQL**. The goal is to evaluate transaction performance, identify payment trends, and derive meaningful business insights using SQL queries.

## 🎯 Business Objectives

- 💰 Measure total transaction value and successful transaction value.
- ✅ Evaluate transaction success rate.
- ❌ Analyze failed transactions and failure rate.
- 📈 Track month-over-month transaction growth.
- 🧮 Calculate Average Transaction Value (ATV).
- 👥 Identify active transacting users.
- 🗓️ Analyze monthly user acquisition.
- 🎂 Understand user age distribution.
- 🏆 Identify the top 5 users by transaction value.

## 🗂️ Dataset Description

The project uses two relational tables:

### 1. 💳 `transaction_data`

Contains transaction-level information.

- `Transaction_ID` — Unique transaction identifier
- `Amount` — Transaction amount
- `User_ID` — User associated with the transaction
- `Service` — Service used
- `Service_Type` — Type of service
- `Payment_Status` — Transaction status
- `Reason` — Reason associated with the transaction
- `Date` — Transaction date

### 2. 👤 `user_data`

Contains user-level information.

- `User_ID` — User identifier
- `Name` — User name
- `Age` — User age
- `Join_Date` — Date the user joined

## 🛠️ Tools & Technologies

- 🐬 **MySQL** — Querying and analyzing data
- 🐙 **GitHub** — Version control and project documentation

## 🧠 SQL Concepts Demonstrated

- 🔢 Aggregate functions: `SUM()`, `COUNT()`, `AVG()`
- 🔍 Filtering with `WHERE`
- 📦 Grouping with `GROUP BY`
- 🔗 Joining tables with `JOIN`
- 🧩 Common Table Expressions (CTEs)
- 🔎 Subqueries and conditional aggregation
- 📅 Date conversion and formatting
- 🪟 Window functions using `LAG()`
- 📐 Percentage calculations
- 🏅 Sorting and ranking using `ORDER BY` and `LIMIT`
- 🛡️ Handling division by zero using `NULLIF()`

## 📊 Key Analyses & KPIs

| # | Analysis | Business Purpose |
|---|---|---|
| 1 | 💰 Successful Transaction Value | Measure completed transaction value |
| 2 | 💳 Total Transaction Value | Measure recorded transaction value |
| 3 | 👥 Total Transacting Users | Understand user reach |
| 4 | 🔢 Total Transactions | Measure transaction volume |
| 5 | ✅ Transaction Success Rate | Evaluate payment performance |
| 6 | 🧮 Average Transaction Value | Understand average successful payment size |
| 7 | 🟢 Active Transacting Users | Measure users with successful transactions |
| 8 | ❌ Failed Transaction Count & Rate | Evaluate payment failures |
| 9 | 🗓️ New Users by Month | Track user acquisition |
| 10 | 🎂 User Age Distribution | Understand user demographics |
| 11 | 📈 Monthly Transaction Growth | Track month-over-month volume changes |
| 12 | 🏆 Top 5 Users by Transaction Value | Identify high-value users |

## 🔍 Key Findings

*Insights will be added after validating the query results and analyzing the dataset.*

## 📁 Project Structure

```text
phonepe-transaction-analysis-sql/
│
├── README.md
└── sql/
    └── phonepe_analysis.sql
```

## 🚀 How to Use This Project

1. Install or open MySQL.
2. Load the dataset into the required tables.
3. Review the SQL scripts in the `sql/` directory.
4. Execute the queries in MySQL.
5. Review the results and interpret the business insights.

## ⚠️ Data & Methodology Notes

- Transaction value and transaction revenue are not necessarily the same. This project measures transaction amounts, not PhonePe's actual revenue or commission.
- Total recorded transaction value includes all payment statuses unless otherwise specified.
- Successful transaction value and Average Transaction Value are calculated using successful transactions only.
- Monthly transaction growth measures changes in transaction count, not transaction amount.
- Results depend on the accuracy and completeness of the supplied dataset.

## 👨‍💻 Author

**Abhishek Verma**

Aspiring Data Analyst | SQL | Excel | Power BI

## ⭐ Project Note

This is an independent portfolio project created for SQL practice and data analysis. It does not represent official PhonePe business performance.

If you find this project useful, feel free to explore the SQL scripts and analysis!
