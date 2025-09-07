-- ================================================
-- Task 4: Optimize Complex Queries
-- ================================================

-- Initial query retrieving all bookings with user, property, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location AS property_location,
    pay.amount AS payment_amount,
    pay.payment_status,
    pay.payment_date
FROM Booking b
INNER JOIN `User` u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
INNER JOIN Payment pay ON b.booking_id = pay.booking_id;



-- Optimized/Refactor query with indexing and selective columns
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    p.location AS property_location,
    pay.amount AS payment_amount,
    pay.payment_status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
