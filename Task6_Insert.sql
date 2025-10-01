INSERT INTO customer (customer_id, name) VALUES
(1, 'Isha Sadavarte'),
(2, 'Rahul Sharma'),
(3, 'Sneha Patil'),
(4, 'Ravi Kumar'),
(5, 'Anjali Deshmukh');


INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mobile Phone', 'Electronics', 25000),
(103, 'Headphones', 'Accessories', 3000),
(104, 'Office Chair', 'Furniture', 7000),
(105, 'Wrist Watch', 'Accessories', 5000);



INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
(5001, 1, '2025-09-25', 55000),
(5002, 2, '2025-09-26', 28000),
(5003, 3, '2025-09-27', 8000),
(5004, 4, '2025-09-28', 1200),
(5005, 5, '2025-09-29', 5300);



INSERT INTO order_items (order_item_id, order_id, product_id, qty, price) VALUES
(9001, 5001, 101, 1, 55000),   -- Laptop
(9002, 5002, 102, 1, 25000),   -- Mobile Phone
(9003, 5002, 103, 1, 3000),    -- Headphones with phone
(9004, 5003, 104, 1, 7000),    -- Office Chair
(9005, 5005, 105, 1, 5000);    -- Wrist Watch


