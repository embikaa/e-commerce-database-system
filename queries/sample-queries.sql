SELECT * FROM users;
---------------------------------
SELECT * FROM categories;
-----------------------------------
SELECT p.id, p.name, p.description, p.price, p.stock, c.name AS category_name
FROM products p
LEFT JOIN categories c ON p.category_id = c.id
ORDER BY p.id;
-----------------------------------
SELECT u.id, u.first_name, u.last_name, COUNT(o.id) AS total_orders, 
       SUM(o.total_amount) AS total_spent
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.first_name, u.last_name
ORDER BY total_spent DESC;
-----------------------------------
SELECT p.id, p.name, SUM(od.quantity) AS total_quantity_ordered
FROM products p
JOIN order_details od ON p.id = od.product_id
GROUP BY p.id, p.name
ORDER BY total_quantity_ordered DESC
LIMIT 5;
-----------------------------------
SELECT o.id AS order_id, o.order_date, o.total_amount, p.status AS payment_status
FROM orders o
JOIN payments p ON o.id = p.order_id
WHERE o.user_id = 1
ORDER BY o.order_date DESC;
-----------------------------------
SELECT id, name, stock, price
FROM products
WHERE stock < 30
ORDER BY stock ASC;
-----------------------------------
SELECT o.id AS order_id, 
       o.order_date, 
       CONCAT(u.first_name, ' ', u.last_name) AS customer_name,
       p.name AS product_name,
       od.quantity,
       od.unit_price,
       (od.quantity * od.unit_price) AS subtotal,
       o.total_amount AS order_total,
       pm.payment_type,
       pm.status AS payment_status
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN order_details od ON o.id = od.order_id
JOIN products p ON od.product_id = p.id
JOIN payments pm ON o.id = pm.order_id
ORDER BY o.order_date DESC;
-----------------------------------
SELECT u.id, u.first_name, u.last_name, u.email, 
       a.city, a.district, a.neighborhood, a.street
FROM users u
JOIN addresses a ON u.id = a.user_id
WHERE a.address_title = 'Home';
-----------------------------------
SELECT c.name AS category_name, 
       SUM(od.quantity * od.unit_price) AS total_sales,
       COUNT(DISTINCT od.order_id) AS number_of_orders
FROM categories c
JOIN products p ON c.id = p.category_id
JOIN order_details od ON p.id = od.product_id
GROUP BY c.name
ORDER BY total_sales DESC;
-----------------------------------
SELECT payment_type, 
       COUNT(*) AS number_of_payments,
       SUM(o.total_amount) AS total_amount
FROM payments p
JOIN orders o ON p.order_id = o.id
GROUP BY payment_type
ORDER BY number_of_payments DESC;
-----------------------------------
UPDATE products
SET price = 849.99
WHERE id = 1;
-----------------------------------
ALTER TABLE products ADD COLUMN view_count INT DEFAULT 0;
-----------------------------------
UPDATE products
SET stock = stock - 1
WHERE id = 1;
-----------------------------------
SELECT p.id, p.name, p.price, COUNT(*) AS frequency
FROM products p
JOIN order_details od ON p.id = od.product_id
WHERE od.order_id IN (
    SELECT DISTINCT o.id
    FROM orders o
    JOIN order_details od ON o.id = od.order_id
    WHERE od.product_id = 1
      AND o.id != 1
)
AND p.id != 1
GROUP BY p.id, p.name, p.price
ORDER BY frequency DESC
LIMIT 5;
-----------------------------------
SELECT p.name, p.price, c.name AS category_name
FROM products p
JOIN categories c ON p.category_id = c.id
WHERE c.name = 'Electronics' AND p.price > 500;
-----------------------------------
DELETE FROM addresses WHERE id = 2;
-----------------------------------
CREATE VIEW product_details_with_category AS
SELECT
    p.id AS product_id,
    p.name AS product_name,
    p.description AS product_description,
    p.price,
    p.stock,
    c.name AS category_name,
    c.description AS category_description
FROM
    products p
LEFT JOIN
    categories c ON p.category_id = c.id;

SELECT * FROM product_details_with_category

DROP VIEW IF EXISTS product_details_with_category
-----------------------------------

