-- Insert sample Users
INSERT INTO Users (full_name, email, phone, role) VALUES
('Adekunle Samuel', 'ade@example.com', '08012345678', 'Customer'),
('Grace Johnson', 'grace.j@example.com', '08023456789', 'Customer'),
('Michael Ojo', 'mike.ojo@example.com', '08034567890', 'Host'),
('Ngozi Adeyemi', 'ngozi.a@example.com', '08045678901', 'Host');

-- Insert sample Properties
INSERT INTO Properties (user_id, title, description, location, price_per_night, property_type) VALUES
(3, 'Cozy Apartment in Ikeja', '2-bedroom fully furnished apartment close to Ikeja City Mall.', 'Ikeja, Lagos', 25000.00, 'Apartment'),
(3, 'Luxury Villa in Lekki', '4-bedroom villa with private pool and ocean view.', 'Lekki, Lagos', 120000.00, 'Villa'),
(4, 'Budget Room in Surulere', 'Affordable single room for short stay.', 'Surulere, Lagos', 10000.00, 'Room');

-- Insert sample Bookings
INSERT INTO Bookings (user_id, property_id, check_in, check_out, status) VALUES
(1, 1, '2025-09-01', '2025-09-05', 'Confirmed'),
(2, 2, '2025-09-10', '2025-09-15', 'Pending'),
(1, 3, '2025-10-01', '2025-10-03', 'Cancelled');

-- Insert sample Payments
INSERT INTO Payments (booking_id, amount, payment_date, payment_method, status) VALUES
(1, 100000.00, '2025-08-20', 'Credit Card', 'Completed'),
(2, 600000.00, '2025-08-25', 'Bank Transfer', 'Pending'),
(3, 20000.00, '2025-08-28', 'Cash', 'Refunded');

-- Insert sample Reviews
INSERT INTO Reviews (user_id, property_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Excellent apartment, very neat and comfortable!', '2025-09-06'),
(2, 2, 4, 'Great villa, but quite expensive.', '2025-09-16'),
(1, 3, 2, 'Room was not clean as expected.', '2025-10-04');



--Features included:
-- Multiple Users (Customers & Hosts).
--  Properties owned by Hosts.
--  Bookings linked to Users & Properties.
--  Payments tied to Bookings.
--  Reviews tied to Users & Properties.

