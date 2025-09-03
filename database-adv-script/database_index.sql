-- Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql

-- Users table
CREATE INDEX idx_users_role ON users(role);

-- Properties table
CREATE INDEX idx_properties_price_per_night ON properties(price_per_night);

-- Bookings table
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_end_date ON bookings(end_date);
CREATE INDEX idx_bookings_status ON bookings(status);

-- Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE.

-- Before adding new indexes
EXPLAIN ANALYZE
SELECT *
FROM bookings
JOIN users ON bookings.user_id = users.id
WHERE users.email = 'test@example.com'
  AND bookings.start_date >= '2024-09-01'
  AND bookings.status = 'confirmed';

-- Before adding new indexes
EXPLAIN ANALYZE
SELECT *
FROM properties
WHERE properties.location = 'New York'
  AND properties.price_per_night BETWEEN 100 AND 200
ORDER BY properties.price_per_night;

-- Before adding new indexes
EXPLAIN ANALYZE
SELECT id, first_name, last_name
FROM users
WHERE users.role = 'host';
