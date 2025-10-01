# SQL TASK 6

Conversation opened. 1 unread message.

Skip to content
Using Gmail with screen readers
1 of 972
(no subject)
Inbox

Isha sadavarte <ishasadavarte7180@gmail.com>
Attachments
6:45 PM (2 minutes ago)
to me


 10 Attachments
  •  Scanned by Gmail
# 📊 Task 6 - Subqueries & Nested Queries (SQL)

This project demonstrates the use of **subqueries and nested queries** in SQL with a sample `ecommerce` database.

---

## 🗂️ Files
- `schema.sql` → Table creation scripts
- `insert_data.sql` → Sample data insertion
- `Task6_Queries.sql` → Subqueries & nested queries
- `screenshots/` → Folder containing screenshots
- `README.md` → Documentation

---

## 📝 Schema
(see `schema.sql`)

---

## 📥 Insert Data
(see `insert_data.sql`)

---

## 🔎 Queries & Screenshots

### 1. Scalar Subquery
```sql
SELECT (SELECT AVG(price) FROM products) AS avg_product_price;
```
📸 **Screenshot:**  
screenshots/scalar.png)

---

### 2. Correlated Subquery (orders per customer)
```sql
SELECT c.customer_id, c.name,
  (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.customer_id) AS total_orders
FROM customer c;
```
📸 **Screenshot:**  
screenshots/correlated.png)

---

### 3. Subquery with IN (customers who bought Electronics)
```sql
SELECT DISTINCT c.customer_id, c.name
FROM customer c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
WHERE oi.product_id IN (
  SELECT product_id FROM products WHERE category = 'Electronics'
);
```
📸 **Screenshot:**  
screenshots/in.png)

---

### 4. Subquery with EXISTS (customers with orders > 1000)
```sql
SELECT c.customer_id, c.name
FROM customer c
WHERE EXISTS (
  SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id AND o.total_amount > 1000
);
```
📸 **Screenshot:**  
(screenshots/exists.png)

---

### 5. Derived Table in FROM (top customers by spend > 5000)
```sql
SELECT t.customer_id, t.total_spent
FROM (
  SELECT o.customer_id, SUM(o.total_amount) AS total_spent
  FROM orders o
  GROUP BY o.customer_id
) AS t
WHERE t.total_spent > 5000
ORDER BY t.total_spent DESC;
```
📸 **Screenshot:**  
(screenshots/derived.png)

---

### 6. Subquery comparing product price with category average
```sql
SELECT p.product_id, p.product_name, p.price
FROM products p
WHERE p.price > (
  SELECT AVG(p2.price) 
  FROM products p2 
  WHERE p2.category = p.category
);
```
