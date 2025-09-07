-- ==========================================
-- Task 2: Aggregations and Window Functions
-- ==========================================

-- 1. Aggregation with COUNT and GROUP BY
-- Find the total number of bookings for each user
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM `User` u
LEFT JOIN Booking b
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;

-- 2. Window Function with RANK 
-- Rank properties based on the total number of bookings
SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_rank;

-- 3. Window Function with ROW_NUMBER
-- Assign a row number to each booking per user, ordered by start_date
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    ROW_NUMBER() OVER (PARTITION BY u.user_id ORDER BY b.start_date) AS booking_sequence
FROM `User` u
INNER JOIN Booking b
    ON u.user_id = b.user_id
ORDER BY u.user_id, booking_sequence;
