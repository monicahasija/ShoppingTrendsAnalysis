SELECT 
    p.product_category_name,
    MONTHNAME(o.order_delivered_customer_date) AS month_name,
    MONTH(o.order_delivered_customer_date) AS month,
    SUM(o_p.payment_value) AS total_revenue
FROM
    orders o
        LEFT JOIN
    order_payments o_p ON o.order_id = o_p.order_id
        LEFT JOIN
    order_items o_i ON o.order_id = o_i.order_id
        LEFT JOIN
    products p ON p.product_id = o_i.product_id
GROUP BY 1 ,2,3
ORDER BY 1 ASC,3 asc;
 