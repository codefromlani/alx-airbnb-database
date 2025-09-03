<!-- Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses). -->

- In the Users table, the high-usage columns are user_id (used in joins), email (used for lookups), and role (used for filtering).
- In the Properties table, the high-usage columns are property_id (joins), host_id (joins with users), location (filter/search), and price_per_night (filter/order).
- In the Bookings table, the high-usage columns are booking_id (joins), user_id (joins with users), property_id (joins with properties), start_date and end_date (availability searches), and status (filtering by booking state).