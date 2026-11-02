-- Project: Superstore Sales Analysis
-- Database: PostgreSQL
-- Purpose: JOIN operations and returns analysis


--- Query 1: Find returned orders using INNER JOIN

select 
	o. "Order ID",
	r."Returned"
from Orders o
inner join returns r 
on o."Order ID" = r."Order ID" ;


--- Query 2: Find distinct returned orders


	select DISTINCT
		o."Order ID",
		r. "Returned"
		from Orders o 
		inner join "returns" r 
		on o."Order ID" = r."Order ID" ;
	
	--- Query 3: Find all orders, including non-returned orders
	
	select 
	o. "Order ID",
	r."Returned"
from Orders o
left join returns r 
on o."Order ID" = r."Order ID" ;


--- Query 4: Compare matched and unmatched records

select 
		COUNT(*) as total_joined_rows,
		count(r."Order ID") as matched_rows,
		Count(*) - Count(r."Order ID") as unmatched_rows
	from Orders o
	left join returns r
	on o."Order ID" = r."Order ID" ;

--- Query 5: Calculate overall return rate

select 
	count(distinct o."Order ID") as total_orders,
	count(distinct r."Order ID") as total_returned,
	round(
	(count(distinct r."Order ID" ):: numeric /
	nullif(count(distinct o."Order ID"),0))  * 100 ,
	2
	) as return_rate_percentage
from orders o 
left join returns r 
on o."Order ID" = r."Order ID";


--- Query 6: Return rate by region

select 
	o ."Region", 
	count(distinct o."Order ID") as total_orders,
	count(distinct r."Order ID") as total_returned,
	round(
	(count(distinct r."Order ID"):: numeric /
	nullif(count(distinct o."Order ID"), 0)) * 100, 2)
	as return_rate_percentage
from orders o
left join "returns" r 
on o."Order ID" = r."Order ID"
group by o."Region"
order by return_rate_percentage DESC ;	


--- Query 7: Return rate by product category

select 
	o."Category",
	count(distinct o."Order ID") as total_orders,
	count(distinct r."Order ID") as total_returned, 
	round(
	(count(distinct r."Order ID")::numeric /
	nullif(count(distinct o."Order ID"), 0)) * 100, 2
	) as return_rate_percentage
from Orders o
left join "returns" r 
on o."Order ID" = r."Order ID" 
group by o."Category"
order by return_rate_percentage DESC;


--- Query 8: Return rate by category and region

select 
	o."Category",
	o. "Region" ,
	count(distinct o."Order ID") as total_orders,
	count(distinct r."Order ID") as total_returned, 
	round(
	(count(distinct r."Order ID")::numeric /
	nullif(count(distinct o."Order ID"), 0)) * 100, 2
	) as return_rate_percentage
from Orders o
left join returns r 
on o."Order ID" = r."Order ID" 
group by o."Category", o."Region"
order by return_rate_percentage DESC;


---Query 9: Return rate by customer segment

select 
	o. "Segment",
	count(distinct o."Order ID") as total_orders,
	count(distinct r."Order ID") as total_returned,
	Round(
	(count(distinct r."Order ID"):: numeric /
	nullif(count(distinct o."Order ID"), 0)
	) * 100 , 2)
	as return_rate_percentage
from Orders o 
left join returns r
on o."Order ID" = r."Order ID"
group by o."Segment"
order by return_rate_percentage desc;







