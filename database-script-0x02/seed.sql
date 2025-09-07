-- -- Insert sample Users
-- INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
-- ('Adekunle', 'Samuel', 'ade@example.com', 'hash1', '08012345678', 'Customer'),
-- ('Grace', 'Johnson', 'grace.j@example.com', 'hash2', '08023456789', 'Customer'),
-- ('Michael', 'Ojo', 'mike.ojo@example.com', 'hash3', '08034567890', 'Host'),
-- ('Ngozi', 'Adeyemi', 'ngozi.a@example.com', 'hash4', '08045678901', 'Host');
-- -- Insert sample Properties
-- INSERT INTO Property (user_id, title, description, location, price_per_night, property_type) VALUES
-- (3, 'Cozy Apartment in Ikeja', '2-bedroom fully furnished apartment close to Ikeja City Mall.', 'Ikeja, Lagos', 25000.00, 'Apartment'),
-- (3, 'Luxury Villa in Lekki', '4-bedroom villa with private pool and ocean view.', 'Lekki, Lagos', 120000.00, 'Villa'),
-- (4, 'Budget Room in Surulere', 'Affordable single room for short stay.', 'Surulere, Lagos', 10000.00, 'Room');
-- -- Insert sample Bookings
-- INSERT INTO Booking (user_id, property_id, check_in, check_out, status) VALUES
-- (1, 1, '2025-09-01', '2025-09-05', 'Confirmed'),
-- (2, 2, '2025-09-10', '2025-09-15', 'Pending'),
-- (1, 3, '2025-10-01', '2025-10-03', 'Cancelled');
-- -- Insert sample Payments
-- INSERT INTO Payment (booking_id, amount, payment_date, payment_method, status) VALUES
-- (1, 100000.00, '2025-08-20', 'Credit Card', 'Completed'),
-- (2, 600000.00, '2025-08-25', 'Bank Transfer', 'Pending'),
-- (3, 20000.00, '2025-08-28', 'Cash', 'Refunded');
-- -- Insert sample Reviews
-- INSERT INTO Review mysql -u root -p alx_airbnb_database < /home/zumerhub/alx_codebase/alx-airbnb-database/database-script-0x02/seed.sql
-- (user_id, property_id, rating, comment, review_date) VALUES
-- (1, 1, 5, 'Excellent apartment, very neat and comfortable!', '2025-09-06'),
-- (2, 2, 4, 'Great villa, but quite expensive.', '2025-09-16'),
-- (1, 3, 2, 'Room was not clean as expected.', '2025-10-04');
-- --Features included:
-- -- Multiple Users (Customers & Hosts).
-- --  Properties owned by Hosts.
-- --  Bookings linked to Users & Properties.
-- --  Payments tied to Bookings.
-- --  Reviews tied to Users & Properties.



-- Insert sample Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(UUID(), 'Adekunle', 'Samuel', 'ade@example.com', 'hash1', '08012345678', 'guest'),
(UUID(), 'Grace', 'Johnson', 'grace.j@example.com', 'hash2', '08023456789', 'guest'),
(UUID(), 'Michael', 'Ojo', 'mike.ojo@example.com', 'hash3', '08034567890', 'host'),
(UUID(), 'Ngozi', 'Adeyemi', 'ngozi.a@example.com', 'hash4', '08045678901', 'host');

-- Insert sample Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
(UUID(), (SELECT user_id FROM User WHERE first_name='Michael'), 'Cozy Apartment in Ikeja',
 '2-bedroom fully furnished apartment close to Ikeja City Mall.', 'Ikeja, Lagos', 25000.00),

(UUID(), (SELECT user_id FROM User WHERE first_name='Michael'), 'Luxury Villa in Lekki',
 '4-bedroom villa with private pool and ocean view.', 'Lekki, Lagos', 120000.00),

(UUID(), (SELECT user_id FROM User WHERE first_name='Ngozi'), 'Budget Room in Surulere',
 'Affordable single room for short stay.', 'Surulere, Lagos', 10000.00);

-- Insert sample Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status)
VALUES
(UUID(), (SELECT property_id FROM Property WHERE name='Cozy Apartment in Ikeja'),
 (SELECT user_id FROM User WHERE first_name='Adekunle'), '2025-09-01', '2025-09-05', 'confirmed'),

(UUID(), (SELECT property_id FROM Property WHERE name='Luxury Villa in Lekki'),
 (SELECT user_id FROM User WHERE first_name='Grace'), '2025-09-10', '2025-09-15', 'pending'),

(UUID(), (SELECT property_id FROM Property WHERE name='Budget Room in Surulere'),
 (SELECT user_id FROM User WHERE first_name='Adekunle'), '2025-10-01', '2025-10-03', 'canceled');

-- Insert sample Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
(UUID(), (SELECT booking_id FROM Booking LIMIT 1), 100000.00, '2025-08-20', 'credit_card'),
(UUID(), (SELECT booking_id FROM Booking LIMIT 1 OFFSET 1), 600000.00, '2025-08-25', 'paypal'),
(UUID(), (SELECT booking_id FROM Booking LIMIT 1 OFFSET 2), 20000.00, '2025-08-28', 'stripe');

-- Insert sample Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
(UUID(), (SELECT property_id FROM Property WHERE name='Cozy Apartment in Ikeja'),
 (SELECT user_id FROM User WHERE first_name='Adekunle'), 5, 'Excellent apartment, very neat and comfortable!'),

(UUID(), (SELECT property_id FROM Property WHERE name='Luxury Villa in Lekki'),
 (SELECT user_id FROM User WHERE first_name='Grace'), 4, 'Great villa, but quite expensive.'),

(UUID(), (SELECT property_id FROM Property WHERE name='Budget Room in Surulere'),
 (SELECT user_id FROM User WHERE first_name='Adekunle'), 2, 'Room was not clean as expected.');
