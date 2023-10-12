SELECT 
s.seller_id,
avg(o_r.review_score)
from sellers s left join order_items o_i on s.seller_id= o_i.seller_id
 left join order_reviews o_r on o_r.order_id= o_i.order_id
 group by 1
 order by 2 desc;
 
