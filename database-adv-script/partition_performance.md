# Partitioning Performance Report

## Objective
The `bookings` table became very large, and queries filtering by `start_date` were slow.  
Implemented table partitioning by **RANGE on start_date** to improve performance.

## Implementation
- Renamed the old `bookings` table.
- Created a new partitioned `bookings` table with yearly partitions (`bookings_2023`, `bookings_2024`, `bookings_2025`).
- Migrated existing data from the old table into the partitioned structure.

## Performance Testing
Tested queries filtering by date ranges using `EXPLAIN ANALYZE`:

- **Before partitioning:**  
  - Queries scanned the entire `bookings` table.  
  - Execution plans showed `Seq Scan` with high cost.  

- **After partitioning:**  
  - Queries only scanned the relevant partition (`bookings_2024`, etc.).  
  - Execution plans showed **Partition Pruning**, reducing scanned rows.  
  - Execution time decreased significantly for date-based filters.

## Result
- Partitioning improved query performance by restricting scans to relevant partitions.  
- This reduces I/O, speeds up date-range queries, and makes the `bookings` table more scalable.
