-- Project: Superstore Sales Analysis
-- Database: PostgreSQL
-- Purpose: Data quality checks
-- Dataset: Superstore



--- Query 1: Total records in all tables

SELECT 'orders' AS table_name, COUNT(*) AS total_rows
FROM orders o

UNION ALL

SELECT 'people', COUNT(*)
FROM people p

UNION ALL

SELECT 'returns', COUNT(*)
FROM returns r;


--- Query 2: Check missing values in important columns

select 
	count(*) as total_rows,
	count(*) filter (where "Order ID" is NULL) as missing_order_id,
	count(*) filter  (where "Order Date" is NULL) as missing_order_date,
	count(*) filter  (where "Customer ID" is NULL) as missing_customer_id,
	count(*) filter  (where "Product ID" is NULL) as missing_product_id
from orders o;	


--- Query 3: Check unique Row IDs

select 
	COUNT(*) as total_rows,
	COUNT(distinct "Row ID") as unique_row_ids
from orders o ;	

--- Query 4: Check duplicate Row IDs

select 
	"Row ID",
	count(*) as duplicate_count
from orders o 
group by "Row ID"
having count(*) >1;


--- Query 5: Check repeated Order IDs

select 
	"Order ID",
	Count(*) as row_count
from Orders o
group by "Order ID" 
having count(*) > 1
order by row_count desc 
limit 10;