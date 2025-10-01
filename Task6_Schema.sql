Create database Ecommercedb;

-- schema: customers, orders, order_items, products
CREATE TABLE customer (
  customer_id INTEGER PRIMARY KEY,
  name TEXT
);


CREATE TABLE products (
  product_id INTEGER PRIMARY KEY,
  product_name TEXT,
  category TEXT,
  price NUMERIC
);

CREATE TABLE Orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER,
  order_date DATE,
  total_amount NUMERIC,
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE order_items (
  order_item_id INTEGER PRIMARY KEY,
  order_id INTEGER,
  product_id INTEGER,
  qty INTEGER,
  price NUMERIC,
  FOREIGN KEY(order_id) REFERENCES Orders(order_id),
  FOREIGN KEY(product_id) REFERENCES products(product_id)
);





