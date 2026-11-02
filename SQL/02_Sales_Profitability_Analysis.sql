-- Project: Superstore Sales Analysis
-- Database: PostgreSQL
-- Purpose: Sales and profitability analysis
-- Dataset: Superstore


--- Query 1: Sales by Category

select 
	"Category",
	ROUND(SUM("Sales"):: numeric , 2) as total_sales
from orders o 
group by "Category"
order by total_sales desc;

---Query 2: Sales by Region

select 
	"Region" ,
	ROUND(SUM("Sales"):: numeric, 2) as total_sales
from orders o 
group by "Region"
order by total_sales desc;

--- Query 3: Profit by Category

select 
	"Category" , 
	ROUND(SUM("Profit"):: numeric, 2) as total_profit
from Orders o
group by "Category" 
order by total_profit desc;

--- Query 4: Profit Margin by Category

select 
	"Category",
	ROUND(SUM("Sales") :: numeric, 2) as total_sales,
	ROUND(SUM("Profit") :: numeric, 2) as total_profit,
	ROUND(
		(SUM("Profit")/ NULLIF(SUM("Sales"), 0) * 100) :: numeric, 2)
		as profit_margin_percentage
from Orders o 
group by "Category"
order by profit_margin_percentage  desc;

--- Query 5: Sales and Profit by Sub-Category

select 
	"Sub-Category",
	ROUND(SUM("Sales"):: numeric , 2) as total_sales,
	round(SUM("Profit"):: numeric , 2) as total_profit
from Orders o 
group by "Sub-Category"
order by total_profit desc;

--- Query 6: Loss-making Sub-Categories

select 	
	"Sub-Category",
	round(SUM("Sales"):: numeric, 2) as "total_sales",
	round(SUM("Profit"):: numeric, 2) as "total_profit"
from Orders O
group by "Sub-Category" 
having SUM("Profit") < 0
order by "total_profit" desc;

--- Query 7: Furniture Profitability Analysis

select 
	"Sub-Category",
	round(SUM("Sales"):: numeric, 2) as total_sales,
	round(SUM("Profit") :: numeric, 2) as total_profit,	
	Round(AVG("Discount"):: numeric, 2) as avg_discount
from Orders o
where "Category" = 'Furniture' 
group by "Sub-Category" 
order by avg_discount desc;