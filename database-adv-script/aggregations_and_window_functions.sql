-- Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT users.id, COUNT(bookings.user_id) AS total_bookings
FROM bookings
INNER JOIN users ON users.id = bookings.user_id
GROUP BY users.id;

-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
SELECT 
    properties.id,
    COUNT(bookings.id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(bookings.id) DESC) AS booking_rank
FROM properties
LEFT JOIN bookings ON properties.id = bookings.property_id
GROUP BY properties.id;

SELECT 
    properties.id,
    COUNT(bookings.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(bookings.id) DESC) AS booking_rank
FROM properties
LEFT JOIN bookings ON properties.id = bookings.property_id
GROUP BY properties.id;
