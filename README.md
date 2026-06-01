# 💳 Payment Fraud Risk Analytics Dashboard

## 📌 Project Overview

This project focuses on analyzing payment transaction data to identify fraudulent behavior, uncover risk patterns, and generate actionable business insights. Using SQL, Python, and Power BI, the project explores fraud trends across payment methods, customer behavior, transaction timing, product categories, and geographical regions.

The goal is to simulate a real-world fraud analytics workflow used by financial institutions and e-commerce companies to support fraud prevention and risk management.

---

## 🎯 Business Problem

Fraudulent transactions can result in significant financial losses and reduced customer trust. Businesses need a data-driven approach to:

* Detect suspicious transaction patterns
* Identify high-risk customer segments
* Monitor vulnerable payment methods
* Understand fraud behavior across regions and categories
* Support proactive fraud prevention strategies

---

## 🛠️ Tools & Technologies

### Data Analysis

* Python
* Pandas
* NumPy
* Matplotlib

### Database

* MySQL

### Business Intelligence

* Power BI

### Development Environment

* Visual Studio Code

---

## 📂 Project Workflow

### 1. Data Preparation

* Imported transaction dataset into MySQL
* Validated data quality
* Created additional business attributes and fraud indicators
* Structured data for analysis

### 2. SQL Analysis

Performed exploratory and business-focused analysis using SQL:

* Fraud vs Legit transaction analysis
* Fraud rate calculation
* Payment method risk assessment
* Category-wise fraud analysis
* Device-based fraud detection
* Country and region analysis
* Ranking of high-risk segments
* Fraud pattern identification using aggregate functions and window functions

### 3. Python Analysis

Performed data exploration and visualization:

* Data cleaning
* Missing value analysis
* Fraud distribution analysis
* Customer behavior analysis
* Payment method analysis
* Category-level fraud investigation
* Visual reporting

### 4. Power BI Dashboard Development

Built an interactive dashboard consisting of:

#### Executive Overview

* Total Transactions
* Fraud Transactions
* Fraud Rate %
* High-Risk Categories
* High-Risk Payment Methods

#### Fraud Risk Analysis

* Fraud by Payment Method
* Fraud by Category
* Fraud by Region
* Fraud by Device Type
* Account Age Risk Analysis

#### Behavioral Intelligence

* Time-Based Fraud Analysis
* Weekend vs Weekday Fraud
* Risk Segmentation
* Fraud Pattern Monitoring

---

## 📊 Key Insights

### Payment Risk

Certain payment methods showed significantly higher fraud rates compared to others, indicating channel-specific vulnerabilities.

### Customer Risk

Newly created accounts demonstrated a higher probability of fraudulent activity compared to mature accounts.

### Category Risk

Fraud was concentrated within specific product categories, highlighting potential business exposure areas.

### Geographic Risk

Some countries and regions exhibited higher fraud occurrence than others.

### Behavioral Patterns

Fraud activity varied by transaction timing and customer behavior, indicating potential opportunities for real-time monitoring.

---

## 💡 Business Recommendations

* Implement enhanced verification for high-risk payment methods.
* Introduce fraud scoring for newly created accounts.
* Increase monitoring for high-risk categories and regions.
* Apply transaction risk alerts during suspicious activity periods.
* Develop automated fraud detection rules for abnormal behavior patterns.

---

## 📁 Project Structure

```plaintext
payment-fraud-risk-analytics/
│
├── dataset/
│   ├── raw_data.csv
│   └── cleaned_data.csv
│
├── python/
│   └── fraud_analysis.py
│
├── sql/
│   └── fraud_analysis.sql
│
├── powerbi/
│   └── Fraud_Dashboard.pbix
│
├── images/
│   ├── dashboard_overview.png
│   ├── fraud_distribution.png
│   ├── category_analysis.png
│   └── payment_method_analysis.png
│
└── README.md
```

---

## 📈 Skills Demonstrated

* Data Cleaning
* Exploratory Data Analysis (EDA)
* SQL Query Optimization
* Business Intelligence Reporting
* Dashboard Design
* Fraud Analytics
* Data Visualization
* Business Problem Solving
* Risk Analysis

---

## 🚀 Project Outcome

This project demonstrates an end-to-end analytics workflow, transforming raw transaction data into meaningful insights and interactive dashboards that support fraud detection and business decision-making.

The project highlights practical experience with SQL, Python, and Power BI while showcasing analytical thinking and business-oriented problem solving.
cs
