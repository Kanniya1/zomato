#1
  SELECT * FROM customers;
#2
  SELECT COUNT(*) AS total_customers FROM customers;
#3
SELECT * FROM customers;
#4
SELECT COUNT(*) AS total_customers FROM restaurants;
#5
SELECT * FROM ORDERS WHERE ORDER_STATUS = "DELIVERED";
#6
SELECT * FROM orders WHERE orders_status="cancelled";
#7
SELECT COUNT(*) AS total_orders FROM orders;
#8
select SUM(total_amount)AS total_revenue FROM orders;
#9
SELECT AVG(total_amount)AS average_order_value FROM orders;
#10
SELECT customer_id,SUM(total_amount)AS total_spent FROM orders GROUP BY customer_id ORDER BY total_spent DESC LIMIT 5;
#11
SELECT customer_id COUNT(order_id)AS total_orders FROM orders GROUP BY customer_id;
#12
SELECT  restaurant_id, SUM(total_amount)AS revenue FROM orders GROUP BY restaurant_id order by revenue DESC LIMIT 5;
#13
SELECT DATE(ORDER_DATE)AS order_day,COUNT(*) AS total_orders FROM ORDERS GROUP BY ORDER_DAY;
#14
SELECT MAX(total_amount) AS highest_order FROM ORDERS;
#15
SELECT MIN(total_amount) AS lowest_order FROM ORDERS;
#16
SELECT payment_method,
COUNT(*) AS total_orders FROM payments GROUP BY payment_method;
#17
SELECT * FROM PAYMENTS WHERE payment_status='success'
#18
SELECT delivery_person_id,COUNT (order_id) AS delivered_orders FROM deliveries GROUP BY delivery_person_id ORDER BY delivered_orders DESC;
#19
SELECT c.customer_name,o.order_id,o.total_amount FROM customer c JOIN orders o ON c.customer_id =o.customer_id;
#20
SELECT r.restaurant_name,COUNT(O.order_id) AS total_orders FROM customers c JOIN order o ON r.restaurant_id=o.restaurant_id GROUP BY r.restaurant_name ORDER BY total_orders DESC;
