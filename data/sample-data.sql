-- Sample data for users table
INSERT INTO users (first_name, last_name, email, password) VALUES
('John', 'Doe', 'john.doe@example.com', 'hashed_password_1'),
('Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2'),
('Michael', 'Johnson', 'michael.johnson@example.com', 'hashed_password_3'),
('Emily', 'Wilson', 'emily.wilson@example.com', 'hashed_password_4'),
('David', 'Brown', 'david.brown@example.com', 'hashed_password_5');

-- Sample data for addresses table
INSERT INTO addresses (user_id, address_title, city, district, neighborhood, street, postal_code) VALUES
(1, 'Home', 'New York', 'Manhattan', 'Midtown', '5th Avenue', '10001'),
(1, 'Work', 'New York', 'Brooklyn', 'Williamsburg', 'Bedford Ave', '11211'),
(2, 'Home', 'Los Angeles', 'Downtown', 'Arts District', 'Spring St', '90013'),
(3, 'Home', 'Chicago', 'Lincoln Park', 'Lakeview', 'Clark St', '60614'),
(4, 'Home', 'Miami', 'Miami Beach', 'South Beach', 'Ocean Drive', '33139'),
(5, 'Home', 'Seattle', 'Capitol Hill', 'Broadway', 'Pike St', '98122');

-- Sample data for categories table
INSERT INTO categories (name, description) VALUES
('Electronics', 'Electronic devices and accessories'),
('Clothing', 'Apparel and fashion items'),
('Books', 'Books, e-books, and publications'),
('Home & Kitchen', 'Household items and kitchen appliances'),
('Sports & Outdoors', 'Sports equipment and outdoor gear');

-- Sample data for products table
INSERT INTO products (name, description, price, stock, category_id) VALUES
('Smartphone X', 'Latest model with high-resolution camera', 799.99, 50, 1),
('Laptop Pro', '15-inch laptop with SSD', 1299.99, 30, 1),
('Wireless Headphones', 'Noise-cancelling Bluetooth headphones', 149.99, 100, 1),
('T-shirt Basic', 'Cotton t-shirt in various colors', 19.99, 200, 2),
('Jeans Classic', 'Denim jeans with straight fit', 59.99, 75, 2),
('Novel Bestseller', 'Fiction bestseller of the year', 24.99, 120, 3),
('Programming Guide', 'Comprehensive guide to modern programming', 39.99, 45, 3),
('Coffee Maker', 'Automatic coffee maker with timer', 89.99, 25, 4),
('Cooking Pot Set', '5-piece non-stick cooking pot set', 129.99, 15, 4),
('Running Shoes', 'Lightweight running shoes for all terrains', 79.99, 60, 5);

-- Sample data for orders table
INSERT INTO orders (user_id, address_id, total_amount) VALUES
(1, 1, 849.98),
(2, 3, 149.99),
(3, 4, 169.98),
(1, 2, 1299.99),
(4, 5, 219.97),
(5, 6, 129.99);

-- Sample data for order_details table
INSERT INTO order_details (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 799.99),
(1, 4, 2, 19.99),
(2, 3, 1, 149.99),
(3, 6, 1, 24.99),
(3, 7, 1, 39.99),
(3, 4, 5, 19.99),
(4, 2, 1, 1299.99),
(5, 8, 1, 89.99),
(5, 6, 2, 24.99),
(5, 4, 4, 19.99),
(6, 9, 1, 129.99);

-- Sample data for payments table
INSERT INTO payments (order_id, payment_type, status) VALUES
(1, 'Credit Card', 'Approved'),
(2, 'Credit Card', 'Approved'),
(3, 'Bank Transfer', 'Pending'),
(4, 'Credit Card', 'Approved'),
(5, 'Cash on Delivery', 'Pending'),
(6, 'Bank Transfer', 'Approved');
