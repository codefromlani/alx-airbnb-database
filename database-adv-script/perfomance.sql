-- Write an initial query that retrieves all bookings along with the user details, property details, and payment details and save it on perfomance.sql

-- Initial query: retrieve all bookings with user, property, and payment details
SELECT *
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
LEFT JOIN payments ON bookings.id = payments.booking_id;

-- Optimized query: reduced unnecessary columns and ensured indexed joins
SELECT 
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date,
    bookings.total_price,
    bookings.status,
    users.first_name,
    users.last_name,
    properties.name AS property_name,
    properties.location,
    payments.amount,
    payments.payment_date
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
LEFT JOIN payments ON bookings.id = payments.booking_id;
