-- Fill our three tables, with data.

COPY customers(customer_id, name, email, created_at)
FROM 'D:\SQL_Data_For_Projects\Data_For_Practice1/customers.txt'
DELIMITER ','

COPY Orders(order_id,customer_id,total_amount,order_date)
FROM 'D:\SQL_Data_For_Projects\Data_For_Practice1/Orders.txt'
DELIMITER ','

COPY Order_Items(item_id,order_id,product_name,quantity,price)
FROM 'D:\SQL_Data_For_Projects\Data_For_Practice1/order_items.txt'
DELIMITER ','

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM Order_Items