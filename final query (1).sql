use olist;
ALTER TABLE olist.`olist set` RENAME TO olist_set;
select * from olist_set;
ALTER TABLE olist_set RENAME COLUMN ï»¿order_id TO order_id ;

-- KPI 1
SELECT week_name, round(SUM(payment_value)) AS Payment_stats
FROM olist_set
WHERE week_name IN ('weekday', 'weekend')
GROUP BY week_name;

-- KPI 2
SELECT count(order_id) AS Total_orders
FROM olist_set
WHERE review_score = 5 AND payment_type = "credit_card";

-- KPI 3
SELECT round(AVG(`shipping days`)) AS shipping_days 
FROM olist_set
WHERE product_category_name = "pet_shop";

-- KPI 4
SELECT round(AVG(Price)) AS Avg_price, round(AVG(payment_value)) AS Avg_Payment_value 
FROM olist_set
WHERE Customer_city = "sao paulo";

-- KPI 5

SELECT review_score , round(AVG(`shipping days`)) AS avg_shipping_days
FROM olist_set WHERE review_score !=0 
GROUP BY review_score ORDER BY review_score;
