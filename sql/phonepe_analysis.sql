-- ============================================================
-- PROJECT: PhonePe Transaction Analysis
-- DATABASE: MySQL
-- PURPOSE: Analyze transaction performance and user behavior
-- TABLES: transaction_data, user_data
-- ============================================================


-- ============================================================
-- 1. TOTAL SUCCESSFUL TRANSACTION VALUE
-- ============================================================

SELECT
    ROUND(SUM(td.Amount), 2) AS Total_Successful_Transaction_Value
FROM transaction_data AS td
WHERE td.Payment_Status = 'Successful';


-- ============================================================
-- 2. TOTAL RECORDED TRANSACTION VALUE
-- Includes all payment statuses
-- ============================================================

SELECT
    ROUND(SUM(td.Amount), 2) AS Total_Transaction_Value
FROM transaction_data AS td;


-- ============================================================
-- 3. TOTAL USERS WHO HAVE TRANSACTED
-- ============================================================

SELECT
    COUNT(DISTINCT td.User_ID) AS Total_Users
FROM transaction_data AS td;


-- ============================================================
-- 4. TOTAL NUMBER OF TRANSACTIONS
-- ============================================================

SELECT
    COUNT(DISTINCT td.Transaction_ID) AS Total_Transactions
FROM transaction_data AS td;


-- ============================================================
-- 5. TRANSACTION SUCCESS RATE (%)
-- Successful transactions / all transactions * 100
-- ============================================================

WITH Successful_Transactions AS (
    SELECT
        COUNT(DISTINCT Transaction_ID) AS Successful_Count
    FROM transaction_data
    WHERE Payment_Status = 'Successful'
),
All_Transactions AS (
    SELECT
        COUNT(DISTINCT Transaction_ID) AS Total_Count
    FROM transaction_data
)
SELECT
    ROUND(
        100.0 * Successful_Count / NULLIF(Total_Count, 0),
        2
    ) AS Transaction_Success_Rate_Percent
FROM Successful_Transactions
CROSS JOIN All_Transactions;


-- ============================================================
-- 6. AVERAGE TRANSACTION VALUE (ATV)
-- Based on successful transactions only
-- ============================================================

SELECT
    ROUND(AVG(td.Amount), 2) AS Average_Transaction_Value
FROM transaction_data AS td
WHERE td.Payment_Status = 'Successful';


-- ============================================================
-- 7. TOTAL ACTIVE TRANSACTING USERS
-- Users with at least one successful transaction
-- ============================================================

SELECT
    COUNT(DISTINCT User_ID) AS Total_Active_Transacting_Users
FROM transaction_data
WHERE Payment_Status = 'Successful';


-- ============================================================
-- 8. TOTAL FAILED TRANSACTIONS
-- ============================================================

SELECT
    COUNT(DISTINCT td.Transaction_ID) AS Total_Failed_Transactions
FROM transaction_data AS td
WHERE td.Payment_Status = 'Failed';


-- ============================================================
-- 9. TRANSACTION FAILURE RATE (%)
-- Failed transactions / all transactions * 100
-- ============================================================

SELECT
    ROUND(
        100.0 * SUM(
            CASE
                WHEN Payment_Status = 'Failed' THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(DISTINCT Transaction_ID), 0),
        2
    ) AS Transaction_Failure_Rate_Percent
FROM transaction_data;


-- ============================================================
-- 10. NEW USERS BY MONTH
-- ============================================================

SELECT
    DATE_FORMAT(Join_Date, '%Y-%m') AS Join_Month,
    COUNT(DISTINCT User_ID) AS New_Users
FROM user_data
GROUP BY DATE_FORMAT(Join_Date, '%Y-%m')
ORDER BY Join_Month;


-- ============================================================
-- 11. USER AGE DISTRIBUTION
-- ============================================================

SELECT
    CASE
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        WHEN Age > 60 THEN '60+'
        ELSE 'Unknown'
    END AS Age_Group,
    COUNT(DISTINCT User_ID) AS Total_Users
FROM user_data
GROUP BY Age_Group
ORDER BY MIN(Age);


-- ============================================================
-- 12. CHECK AND CONVERT TRANSACTION DATES
-- Source format: DD-MM-YYYY
-- ============================================================

SELECT
    `Date` AS Original_Date,
    STR_TO_DATE(`Date`, '%d-%m-%Y') AS Formatted_Date
FROM transaction_data
LIMIT 10;


-- ============================================================
-- 13. MONTHLY TRANSACTION GROWTH (%)
-- Month-over-month growth in transaction count
-- ============================================================

WITH Monthly_Transactions AS (
    SELECT
        DATE_FORMAT(
            STR_TO_DATE(`Date`, '%d-%m-%Y'),
            '%Y-%m'
        ) AS Transaction_Month,
        COUNT(DISTINCT Transaction_ID) AS Total_Transactions
    FROM transaction_data
    GROUP BY Transaction_Month
),
Previous_Month AS (
    SELECT
        Transaction_Month,
        Total_Transactions,
        LAG(Total_Transactions) OVER (
            ORDER BY Transaction_Month
        ) AS Previous_Month_Transactions
    FROM Monthly_Transactions
)
SELECT
    Transaction_Month,
    Total_Transactions,
    Previous_Month_Transactions,
    ROUND(
        100.0 * (
            Total_Transactions - Previous_Month_Transactions
        ) / NULLIF(Previous_Month_Transactions, 0),
        2
    ) AS Monthly_Transaction_Growth_Percent
FROM Previous_Month
ORDER BY Transaction_Month;


-- ============================================================
-- 14. TOP 5 USERS BY TOTAL TRANSACTION VALUE
-- Includes all payment statuses
-- ============================================================

SELECT
    ud.User_ID,
    ud.Name,
    ROUND(SUM(td.Amount), 2) AS Total_Transaction_Value
FROM user_data AS ud
JOIN transaction_data AS td
    ON ud.User_ID = td.User_ID
GROUP BY ud.User_ID, ud.Name
ORDER BY Total_Transaction_Value DESC
LIMIT 5;


-- ============================================================
-- END OF PHONEPE TRANSACTION ANALYSIS
-- ============================================================
