# E-Commerce Database Management System

##  Project Overview

This project is a comprehensive e-commerce database management system developed as part of the MIS-3016 Databases course. The system includes a normalized database structure with complete SQL implementation for managing customers, products, orders, and payments.

##  Database Schema

The database consists of 7 main tables following 3NF normalization:

- **users** - Customer information management
- **addresses** - User address storage
- **categories** - Product categorization
- **products** - Product catalog
- **orders** - Order management
- **order_details** - Order item details
- **payments** - Payment transaction tracking

##  Files Structure

```
e-commerce-database/
├── README.md
├── schema/
│   └── database-schema-english.sql
├── data/
│   └── sample-data.sql
├── queries/
│   └── sample-queries.sql
├── docs/
│   └── project-report.pdf
└── assets/
    └── er-diagram.png
```

##  Quick Start

### Prerequisites
- PostgreSQL 12 or higher
- Database client (pgAdmin, DBeaver, etc.)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/e-commerce-database.git
cd e-commerce-database
```

2. Create database and run schema:
```sql
-- Connect to PostgreSQL and create database
CREATE DATABASE ecommerce_db;

-- Run the schema file
\i schema/database-schema-english.sql
```

3. Load sample data:
```sql
\i data/sample-data.sql
```

4. Test with sample queries:
```sql
\i queries/sample-queries.sql
```

##  Database Features

### Core Functionality
- ✅ User registration and management
- ✅ Product catalog with categories
- ✅ Shopping cart and order processing
- ✅ Payment tracking
- ✅ Address management
- ✅ Inventory management

### Key Queries Included
- User order analysis
- Best selling products
- Sales reports by category
- Low stock alerts
- Payment method analytics
- Customer purchase history

##  Sample Queries

### Get user order summary:
```sql
SELECT u.first_name, u.last_name, COUNT(o.id) AS total_orders, 
       SUM(o.total_amount) AS total_spent
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.first_name, u.last_name
ORDER BY total_spent DESC;
```

### Find best selling products:
```sql
SELECT p.name, SUM(od.quantity) AS total_sold
FROM products p
JOIN order_details od ON p.id = od.product_id
GROUP BY p.id, p.name
ORDER BY total_sold DESC
LIMIT 5;
```

##  Database Design

### Entity Relationships
- Users → Addresses (1:N)
- Users → Orders (1:N)
- Categories → Products (1:N)
- Orders → Order_Details (1:N)
- Products → Order_Details (1:N)
- Orders → Payments (1:1)

### Normalization
The database follows Third Normal Form (3NF) principles:
- Eliminated repeating groups
- Removed partial dependencies
- Eliminated transitive dependencies

##  Performance Optimization

Recommended indexes for better performance:
```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_orders_user ON orders(user_id);
CREATE INDEX idx_order_details_order ON order_details(order_id);
CREATE INDEX idx_order_details_product ON order_details(product_id);
```

##  Documentation

- **Full Project Report**: Available in `/docs/project-report.pdf`
- **ER Diagram**: Available in `/assets/er-diagram.png`
- **SQL Scripts**: All scripts are documented with comments

##  Technologies Used

- **Database**: PostgreSQL
- **Language**: SQL
- **Tools**: pgAdmin, SQL clients
- **Design**: Entity-Relationship Modeling

##  Sample Data

The project includes realistic sample data:
- 5 users with multiple addresses
- 5 product categories
- 10 products across different categories
- 6 orders with detailed line items
- Payment records for all orders

##  Future Enhancements

- Product reviews and ratings
- Wishlist functionality
- Discount and coupon system
- Advanced inventory management
- Order status tracking
- Customer loyalty program


##  License

This project is created for educational purposes as part of a university database course.

##  Contributing

This is an academic project, but feedback and suggestions are welcome! Feel free to open an issue or submit a pull request.

##  Contact

For questions about this project, please contact:
- Email: kilicburak859@gmail.com
- LinkedIn: https://www.linkedin.com/in/muhammet-burak-kilic-bba568280/



