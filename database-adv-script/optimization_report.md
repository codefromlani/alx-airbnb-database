# Query Optimization Report

## Initial Query
The initial query joined `bookings`, `users`, `properties`, and `payments` tables and selected all columns.

**Performance Analysis (EXPLAIN ANALYZE):**
- Sequential scans observed on `bookings` and `payments`.
- High estimated cost due to selecting unnecessary columns and wide joins.
- Execution time was higher because the query retrieved more data than required.

## Refactoring
Changes made:
- Added indexes on `bookings.user_id`, `bookings.property_id`, and `payments.booking_id`.
- Reduced unnecessary selected columns (`users.email`, `properties.price_per_night`, etc.).
- Kept `LEFT JOIN` only for `payments` since some bookings may not have payments.