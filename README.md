# Superstore Sales Analysis

## Project Overview

This project focuses on analysing retail sales data using PostgreSQL to identify sales trends, profitability patterns and customer return behaviour.

The objective is to develop practical SQL skills and generate meaningful business insights from retail transaction data.

## Tools and Technologies

* PostgreSQL
* DBeaver
* SQL
* GitHub

## Dataset

The project uses a retail Superstore dataset containing three tables:

* **Orders:** Order details, customers, products, sales, quantity, discounts and profit.
* **Returns:** Information about returned orders.
* **People:** Regional information.

## SQL Analysis Performed

### 1. Data Quality Checks

* Checked total records across tables.
* Identified missing values in key columns.
* Checked duplicate Row IDs.
* Analysed unique and repeated Order IDs.

### 2. Sales and Profitability Analysis

* Sales by category and region.
* Profit by category and subcategory.
* Profit margin calculations.
* Identification of loss-making subcategories.
* Discount analysis for Furniture products.

### 3. Conditional Analysis Using CASE WHEN

* Classified subcategories based on profitability.
* Categorised product categories by profit levels.
* Counted profitable, loss-making and zero-profit records.
* Calculated profitability percentages.

### 4. JOIN and Returns Analysis

* Practised INNER JOIN and LEFT JOIN.
* Identified returned and non-returned orders.
* Compared matched and unmatched records.
* Calculated overall return rate.
* Analysed return rates by region, product category, category and region, and customer segment.

## Key Business Insights

### Overall Returns

* Total distinct orders: 5,009
* Returned orders: 296
* Overall return rate: 5.91%

### Regional Analysis

* West had the highest return rate at 11.73%.
* South had the lowest return rate at 2.92%.

### Category Analysis

* Technology had the highest category-level return rate at 7.97%.
* Furniture followed at 7.71%.
* Office Supplies had the lowest return rate at 6.25%.

### Customer Segment Analysis

* Corporate had the highest return rate at 6.14%.
* Consumer followed at 5.96%.
* Home Office had the lowest return rate at 5.39%.

## Project Structure

* SQL/

  * 01_Data_quality_Checks.sql
  * 02_Sales_Profitability_Analysis.sql
  * 03_Case_When_Analysis.sql
  * 04_Joins_Returns_Analysis.sql

## Learning Objectives

Through this project, I am developing practical skills in:

* SQL querying and data analysis
* Data quality checks
* Aggregate functions
* GROUP BY and HAVING
* CASE WHEN statements
* INNER JOIN and LEFT JOIN
* Analytical calculations
* Business insight generation

## Future Enhancements

* Build an interactive Power BI dashboard.
* Add visualisations for sales, profitability and returns.
* Explore monthly and yearly sales trends.
* Extend the analysis with additional business questions.
