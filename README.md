# Olist Brazilian E-Commerce Analysis (2016–2018)

## Project Overview
This project analyzes the performance of Olist, a major Brazilian e-commerce marketplace. The objective is to identify key drivers of revenue and order volume by exploring the relationships between geographic locations, payment methods, seller performance, and product categories.

By synthesizing data across these dimensions, this study provides actionable insights to support data-driven decisions, helping the business focus on high-performing segments and optimize commercial strategy.

## Dataset Overview
The analysis utilizes a publicly available dataset provided by Olist on Kaggle. It consists of 9 CSV files organized in a relational schema, covering the period from September 2016 to October 2018.

- **Core Tables**: Orders (99.4K rows), Order Items (112.6K rows), Payments, and Products.
- **Support Tables**: Sellers, Customers, Reviews, Geolocation, and Category Name Translation.
- **Data Integrity**: The dataset follows ROCCC standards. All Personally Identifiable Information (PII) has been removed to ensure customer privacy.

## Technical Analysis: SQL Implementation
The raw data was transformed into insights using MySQL. I executed 14 complex queries to address specific business questions.

**Key Techniques Applied:**
- **Data Loading**: Efficiently imported large CSVs using `LOAD DATA LOCAL INFILE`.
- **Advanced Logic**: Leveraged `DENSE_RANK()` for seller ranking, `DATEDIFF()` for delivery lead times, and `CASE` statements for payment and delivery categorization.
- **Complex Joins**: Integrated multiple tables to map product translations and geographic trends.

> **Note:** For the full source code of all 14 queries, see the [SQL_queries.sql](SQL_queries.sql) file.

## Data Visualization & Dashboarding
The processed data was connected to Power BI for visual storytelling.

- **Data Modeling**: Created SQL Views for a clean import and established a Star Schema centered on the Orders and Order_Items fact tables.
- **Dynamic Interactivity**: Implemented bi-directional cross-filtering, allowing the dashboard to respond dynamically to any selected field (e.g., filtering by city updates revenue and category charts simultaneously).

## Executive Summary & Key Insights

### 1. High-Level KPIs
- **Total Revenue**: R$ 15.42M
- **Total Orders**: 99.44K (from 96.10K unique customers)
- **Logistics**: 97.02% Delivery Rate with a 12.5-day average fulfillment cycle.
- **Quality**: Average Platform Rating of 4.09/5.

### 2. Market Dynamics
- **Geographic Hub**: São Paulo is the primary engine of the platform, accounting for over 15.5K orders and R$ 5.77M in revenue.
- **Top Categories**: Segments like `Bed_Bath_Table`, `Health_Beauty`, and `Sports_Leisure` drive the highest volume, each exceeding 5,000 orders.
- **Growth**: Revenue increased from R$ 6.92M in 2017 to R$ 8.45M in 2018, showing a healthy upward trajectory.

### 3. Payment Behavior
- **Installment Power**: Installment payments generate 63% of total revenue (R$ 9.73M), even though order volumes are nearly equal to one-time payments.
- **Credit Dominance**: Credit Cards are the most used payment method, particularly for high-value installment purchases.

## Business Recommendations
1. **Promote Installment Plans**: Since installments drive the majority of revenue, Olist should prioritize marketing high-ticket items with flexible credit options to leverage Brazil’s consumer behavior.
2. **Focus on Core Demographics**: Target marketing efforts toward Household and Teenager/Lifestyle categories, as these segments consistently drive the highest order volumes.
3. **Incentivize Loyalty**: With a high percentage of one-time shoppers, Olist should implement loyalty programs or "returning customer" discounts to increase Customer Lifetime Value (CLV).

## Project Limitations & Future Scope
- **Profitability**: Due to a lack of cost data (COGS), the analysis focuses on Gross Revenue rather than net profit.
- **Future Enhancement**: With more data, I aim to include Customer Cohort Analysis, Seller Performance Scoring, and Profitability Modeling.
