-- Task 6: Subqueries & Nested Queries Examples

-- 1. Scalar Subquery (single value)
SELECT (SELECT AVG(price) FROM products) AS avg_product_price;

-- 2. Correlated Subquery (orders per customer)
SELECT c.customer_id, c.name,
  (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.customer_id) AS total_orders
FROM customer c;

-- 3. Subquery with IN (customers who bought Electronics)
SELECT DISTINCT c.customer_id, c.name
FROM customer c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
WHERE oi.product_id IN (
  SELECT product_id FROM products WHERE category = 'Electronics'
);

-- 4. Subquery with EXISTS (customers with orders > 1000)
SELECT c.customer_id, c.name
FROM customer c
WHERE EXISTS (
  SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id AND o.total_amount > 1000
);


-- 5. Derived Table in FROM (top customers by spend > 5000)
SELECT t.customer_id, t.total_spent
FROM (
  SELECT o.customer_id, SUM(o.total_amount) AS total_spent
  FROM orders o
  GROUP BY o.customer_id
) AS t
WHERE t.total_spent > 5000
ORDER BY t.total_spent DESC;

-- 6. Subquery comparing product price with category average
SELECT p.product_id, p.product_name, p.price
FROM products p
WHERE p.price > (
  SELECT AVG(p2.price) 
  FROM products p2 
  WHERE p2.category = p.category
);
