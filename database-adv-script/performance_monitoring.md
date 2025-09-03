# Database Performance Monitoring Report

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and implementing schema improvements.

## Queries Monitored
1. Fetch bookings by user_id
2. Search properties by location and price range
3. Retrieve reviews for a property

## Performance Analysis
- **Initial findings:** Sequential scans and nested loops observed in frequently used queries.
- High execution times noted on large tables without proper indexing.

## Improvements Implemented
- Added index on `bookings.user_id` for faster user bookings retrieval.
- Added composite index on `properties(location, price_per_night)` for faster property searches.
- Added index on `reviews.property_id` to speed up review retrievals.

## Results
- Sequential scans replaced with index scans in key queries.
- Average query execution times reduced significantly.
- Database performance improved, making queries more scalable for larger datasets.
