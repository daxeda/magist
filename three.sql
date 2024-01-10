-- Question in relation to delivery time.
How many orders are delivered on time vs orders delivered with a delay?
Is there any pattern for delayed orders, e.g. big products being delayed more often?
-- what's the average time between order placed and delivery time ? 

SELECT 
	AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) days
FROM orders;
-- 12.5035 days

-- how many orders delivered on time vs orders delivered w/ a delay?


	SELECT COUNT(order_id) AS delayed 
	FROM orders
	WHERE timestampdiff (DAY, order_delivered_customer_date, order_estimated_delivery_date)<0 ;

-- 96’478 is the total amount of deliveries. There is a total of 99’441 deliveries in the DB
-- 6’535 are late deliveries - approx 7% of deliveries are late 
-- 87'187 are not late deliveries - approx 90% of deliveries are on time.


-- is there a pattern for delayed orders? ex; big products(...)
