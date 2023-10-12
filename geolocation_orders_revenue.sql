-- statewise total orders and revenue generated

select
 c.customer_state,
 count(o.order_id) as num_orders,
 sum(o_p.payment_value) as total_revenue
 from orders o 
 left join customers c on
 c.customer_id= o.customer_id
 left join order_payments o_p
 on o.order_id =o_p.order_id
 group by c.customer_state
 order by total_revenue desc;