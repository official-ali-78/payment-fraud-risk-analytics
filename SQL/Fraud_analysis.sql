use fraud_project;

-- Fraud Percentage : 

SELECT
    CASE
        WHEN label = 0 THEN 'LEGIT'
        ELSE 'FRAUD'
    END AS Status,
    CONCAT(
        ROUND(
            COUNT(*) * 100.0 /
            (SELECT COUNT(*) FROM fraud_payments),
            2
        ),
        '%'
    ) AS Percentage
FROM fraud_payments
GROUP BY label;

-- Fraud by Category using group by :

SELECT 
    Category,
    CONCAT(ROUND(AVG(label) * 100, 2) , '%')Fraud_rate
FROM fraud_payments
GROUP BY Category
ORDER BY fraud_rate DESC;


-- Fraud by Payment Method :

SELECT 
    paymentMethod,
    COUNT(*) AS total_transactions,
    SUM(label) AS fraud_cases , 
    CONCAT(ROUND(AVG(label) * 100 , 2) , '%') AS fraud_rate
FROM fraud_payments
GROUP BY paymentMethod;


-- Fraud by Weekend/Weekday : 

 SELECT 
    isWeekend,
    CONCAT(ROUND(AVG(label) * 100, 2),'%') AS fraud_rate
FROM fraud_payments
GROUP BY isWeekend;


-- Fraud by Time : 

SELECT 
    HOUR(`localTime`) AS transaction_hour,
    COUNT(*) AS fraud_cases
FROM fraud_payments
WHERE label = 1
GROUP BY transaction_hour
ORDER BY transaction_hour;



-- Fraud Rate by Country :

SELECT
    Country,
    COUNT(*) AS total_transactions,
    SUM(label) AS fraud_cases,
    CONCAT(ROUND(AVG(label) * 100, 2), '%') AS fraud_rate
FROM fraud_payments
GROUP BY Country
ORDER BY AVG(label) DESC;



 -- Fraud by Device Type : 
 
 SELECT DeviceType ,
 COUNT(*) AS total_transactions,
 SUM(label) AS fraud_cases,
 CONCAT(ROUND(AVG(label) * 100, 2), '%') AS fraud_rate 
 FROM fraud_payments group by DeviceType 
 Order by AVG(label) DESC;
 
 
 
 -- High Value Fraud Transactions  : 
 
 SELECT
    CustomerName,
    TransactionAmount,
    paymentMethod,
    Country
FROM fraud_payments
WHERE label = 1
ORDER BY TransactionAmount DESC
LIMIT 10;




-- total cases using CASE WHEN 

SELECT
    CASE
        WHEN label = 1 THEN 'Fraud'
        ELSE 'Legit'
    END AS transaction_status,
    COUNT(*) AS total
FROM fraud_payments
GROUP BY transaction_status;



-- Rank Window function : 

SELECT
    Category,
    COUNT(*) AS total_transactions,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS category_rank
FROM fraud_payments
GROUP BY Category;


-- Fraud by Transaction Amount Range

SELECT
    CASE
        WHEN TransactionAmount < 500 THEN 'Low'
        WHEN TransactionAmount BETWEEN 500 AND 2000 THEN 'Medium'
        ELSE 'High'
    END AS amount_category,
    
    COUNT(*) AS total_transactions,
    SUM(label) AS fraud_cases
FROM fraud_payments
GROUP BY amount_category;


-- Risk Matrix


SELECT
    Category,
    paymentMethod,
    ROUND(AVG(label) * 100,2) fraud_rate
FROM fraud_payments
GROUP BY Category, paymentMethod
ORDER BY fraud_rate DESC;