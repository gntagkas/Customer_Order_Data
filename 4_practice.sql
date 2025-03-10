/*
Find all customers (names) who have placed at least one order.
*/

SELECT
    DISTINCT customers.name
FROM orders
INNER JOIN customers
    on orders.customer_id = customers.customer_id
WHERE order_id IN (
    SELECT
        order_id
    FROM order_items
    WHERE quantity >= 1
 );

SELECT
    DISTINCT customers.name
FROM customers
INNER JOIN orders
    on customers.customer_id = Orders.customer_id


/*
Find the total amount each customer has spent (name and amount spent).
*/

WITH name1 AS (
SELECT
    Orders.customer_id,
    SUM(total_amount) AS Amount_Spent
FROM Orders
INNER JOIN customers
on Orders.customer_id = customers.customer_id
GROUP BY Orders.customer_id
)

SELECT
    customers.name,
    name1.Amount_Spent
FROM name1
INNER JOIN customers
on name1.customer_id = customers.customer_id

/*
Find out which products have been sold more than once (product names).
*/

SELECT 
    product_name, 
    SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_name
HAVING SUM(quantity) > 1;

/*
Find out which customers ordered after 1 February 2024.
*/

SELECT
    name
FROM customers
WHERE created_at > '2024-01-01' 

/*
Find out which is the most expensive order and who made it.
*/

SELECT
    customers.name,
    total_amount AS most_spent
FROM customers
INNER JOIN Orders
on  customers.customer_id = orders.customer_id
WHERE orders.total_amount IN (
    SELECT
        max(total_amount)
    FROM Orders
)

/*
Find customers who have ordered more than 2 products in total.
*/

SELECT
    customers.name,
    SUM(quantity) AS orders
FROM customers
INNER JOIN orders
on  customers.customer_id = orders.customer_id
INNER JOIN order_items
on  orders.order_id = order_items.order_id
GROUP BY orders.customer_id, customers.name
HAVING COUNT(orders) > 2

/*
Find out which customers have not placed any orders.
*/

SELECT
    customers.name
FROM customers
LEFT JOIN orders
on  customers.customer_id = orders.customer_id
WHERE order_id is NULL

/*
Find the average $ of orders per customer.
*/

SELECT
    orders.customer_id,
    customers.name,
    AVG(total_amount) AS average_order
FROM customers
INNER JOIN Orders
on  customers.customer_id = orders.customer_id
GROUP BY orders.customer_id, customers.name

/*
Find out which order had the largest number of products (total quantity of products in one order).
*/

SELECT
    order_id,
    quantity
FROM order_items
ORDER BY quantity DESC
LIMIT 1

/*
Find the most popular product according to orders.
*/

SELECT
    product_name
FROM order_items
ORDER BY quantity DESC
LIMIT 1


/*
Find out which is the cheapest order and who made it.
*/

SELECT
    customers.name,
    orders.total_amount
FROM orders
INNER JOIN customers
on  orders.customer_id = customers.customer_id
ORDER BY total_amount ASC
LIMIT 1

/*
Find out how many orders each customer has placed.
*/

SELECT 
    customers.name,
    COUNT(*) AS orders
FROM Orders
INNER JOIN customers
on  orders.customer_id = customers.customer_id
GROUP BY orders.customer_id, customers.name





