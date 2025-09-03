-- Assume the Booking table is large and query performance is slow. Implement partitioning on the Booking table based on the start_date column. Save the query in a file partitioning.sql

-- Step 1: Rename old bookings table
ALTER TABLE bookings RENAME TO bookings_old;

-- Step 2: Create new partitioned bookings table
CREATE TABLE bookings (
    id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions by year
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: Move existing data into the partitioned table
INSERT INTO bookings
SELECT * FROM bookings_old;

-- Step 5: Drop the old table (optional after verifying migration)
-- DROP TABLE bookings_old;


-- Test the performance of queries on the partitioned table (e.g., fetching bookings by date range).

-- Query bookings in 2024
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';

-- Query bookings in 2023
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date >= '2023-09-01' AND start_date <= '2023-09-30';

