CREATE Table customers(
  customer_id INTEGER Primary Key,
  customer_name TEXT,
  country TEXT
);

INSERT INTO customers(customer_id, customer_name, country) VALUES 
  (1, "Alex", "United States"),
  (2, "Brian", "Canada"),
  (3, "Aaron", "Australia");  -- Added customer with "a" and "or"

CREATE Table products(
  product_id INTEGER Primary Key,  
  product_name TEXT,
  country TEXT
);

INSERT INTO products(product_id, product_name, country) VALUES 
  (1, "Widget A", "United States"),
  (2, "Widget B", "Canada");

CREATE TABLE exports( 
  export_id Primary Key,
  order_id INTEGER,
  country_exported TEXT,
  Foreign Key (order_id) REFERENCES orders(order_id)
);

INSERT INTO exports(export_id, order_id, country_exported) VALUES
  (1, 1, "Mexico"),
  (2, 2, "France");

CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  customer_id INTEGER,
  product_id INTEGER,
  quantity INTEGER,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders(order_id, customer_id, product_id, quantity, order_date) VALUES
  (1, 1, 1, 5, '2023-10-01'),
  (2, 1, 2, 3, '2023-10-02'),
  (3, 3, 1, 2, '2023-10-03');  -- Added order for customer "Aaron"

SELECT c.customer_name, c.country, p.product_name, p.country AS product_country, e.country_exported
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id
JOIN Exports e ON o.order_id = e.order_id;  -- No WHERE clause to retrieve all customers