# Airbnb Database Schema

## Objective
This project provides the SQL schema for an Airbnb-clone application.  
The schema is normalized up to **Third Normal Form (3NF)** to ensure data integrity, eliminate redundancy, and optimize query performance.  

## Repository Structure
- **schema.sql** → SQL script containing table definitions, constraints, and indexes  
- **README.md** → Documentation of the database schema  

## Entities
### 1. Users
- Stores guest, host, and admin information  
- Attributes: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`  

### 2. Properties
- Represents listings created by hosts  
- Attributes: `property_id`, `host_id`, `name`, `description`, `location`, `price_per_night`, `timestamps`
- Foreign key: `host_id → users(user_id)`  

### 3. Bookings
- Records reservations made by users  
- Attributes: `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`  
- Foreign keys: `property_id → properties(property_id)`, `user_id → users(user_id)`  

### 4. Payments
- Tracks payment transactions  
- Attributes: `payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`  
- Foreign key: `booking_id → bookings(booking_id)`  

### 5. Reviews
- Stores user feedback on properties  
- Attributes: `review_id`, `property_id`, `user_id`, `rating`, `comment`, `created_at`  
- Foreign keys: `property_id → properties(property_id)`, `user_id → users(user_id)`  

### 6. Messages
- Handles communication between users  
- Attributes: `message_id`, `sender_id`, `recipient_id`, `message_body`, `sent_at`  
- Foreign keys: `sender_id → users(user_id)`, `recipient_id → users(user_id)`  

## Features
- Use of **UUIDs** as primary keys for scalability  
- **Constraints** (CHECK, UNIQUE, NOT NULL) to enforce data integrity  
- **Indexes** on frequently queried columns for performance  
- **3NF Normalization**: no redundancy, no partial or transitive dependencies  

## Usage
1. Clone the repository:  
   ```bash
   git clone https://github.com/codefromlani/alx-airbnb-database.git
   cd alx-airbnb-database/database-script-0x01

2. Run the schema in PostgreSQL: 
   ```bash
   psql -U <username> -d <database_name> -f schema.sql

3. Verify tables: 
   ```bash
   \dt