/*
Creating 3 Different Tables: Customers - Orders - Order_Items
*/

CREATE TABLE Customers (
    customer_id INT primary KEY,
    name TEXT,
    email TEXT,
    created_at DATE
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount NUMERIC,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES public.Customers (customer_id)
);

CREATE TABLE Order_Items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_name TEXT,
    quantity INT,
    price NUMERIC,
    FOREIGN KEY (order_id) REFERENCES public.Orders (order_id)
);

/*
Set ownership of the tables to the postgres user
*/

ALTER TABLE public.Customers OWNER to postgres;
ALTER TABLE public.Orders OWNER to postgres;
ALTER TABLE public.Order_Items OWNER to postgres;


