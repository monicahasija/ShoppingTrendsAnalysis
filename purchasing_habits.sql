with total_orders as( 
select 
customer_unique_id,
count(o.order_id) as orders
from customers c 
left join orders o on c.customer_id = o.customer_id 
group by 1
order by 2 desc)
select 
*,
percent_rank() over (order by orders desc) as percentile_rank,
case 
when percent_rank() over (order by orders desc) <=0.3
then "frequent_buyer"
when percent_rank() over (order by orders desc) <=0.6
then "regular_buyer"
else "low_frequency_buyer"
end 
 from total_orders;