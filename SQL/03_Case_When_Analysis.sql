-- Project: Superstore Sales Analysis
-- Database: PostgreSQL
-- Purpose: Conditional analysis and profitability classification

--- Query 1: Profitability classification by sub-category
select 
	"Sub-Category",
	round(SUM("Profit"):: numeric, 2)as total_profit,
	case 
		when SUM("Profit") > 0 then 'Profitable'
		when SUM("Profit") < 0 then 'Loss'
		else 'Break-even'
		end as profit_status
	from Orders o
	where "Category" = 'Furniture'
	group by "Sub-Category";

--- Query 2: Profit classification by category


select
	"Category",
	Round(SUM("Profit"):: numeric, 2) as total_profit,
	case 
		when SUm("Profit") > 100000 then 'High Profit'
		when SUM("Profit") < 100000 and
		SUm("Profit") > 50000 then 'Medium Profit'
		when SUm("Profit") < 50000 then 'Low Profit'
		end as Profit_classification
	from Orders o
	group by "Category";


--- Query 3: Count profitable records by category


select
	"Category", 
	SUM(
	case 
		when "Profit" > 0 then 1
		else 0
	end
	) as profit_count
from Orders o
group by "Category";


--- Query 4: Count profitable, loss-making and zero-profit records

select 
	"Category",
	SUM(
	case
		when "Profit" > 0 then 1
		else 0
		end  ) as Profit_count,
	SUM(
	case 
		when "Profit" < 0 then 1
		else 0
		
	end
	) as Loss_count,
	SUM (
	case 
		when "Profit" = 0 then 1
	end
	) as zero_Profit_Count
from orders
group by "Category" ;


--- Query 5: Profitability percentage by category


select 
		"Category",
		COUNT(*) as Total_records,
		
		SUM(
		case 
		when "Profit" >0 then 1 
		else 0
		end ) as Profit_records,
		
		 SUM (
		 case
		 when "Profit" <0 then 1
		 else 0
		 end) as Loss_records,
		
		(
		 
		Round(SUM(
		case 
		when "Profit" >0 then 1 
		else 0
		end ):: numeric / 
		NULLIF(COUNT(*), 0) * 100, 2) 
		)
		
		as Profitability_percentage
		
	from Orders 
	group by "Category";
	

