-- ===========================================
-- Task 3: Implement Indexes for Optimization
-- ===========================================

-- Index an User table for quick lookup by email 
-- CREATE INDEX idx_user_email ON User (email);
CREATE INDEX idx_user_role ON `User` (role);


-- Index on Booking table for joins on user_id
CREATE INDEX idx_booking_user_id ON Booking (user_id);

-- Index on Booking table for joins on property_id
CREATE INDEX idx_booking_property_id ON Booking (property_id);

-- Composite index on Booking for queries filtering by user_id and property_id together
CREATE INDEX idx_booking_user_property_id ON Booking (user_id, property_id);
CREATE INDEX idx_booking_status ON Booking (status);

-- Index on Property table for quick search by location 
CREATE INDEX idx_property_location ON Property (location);

-- Index on Booking dates for faster filtering by date ranges
CREATE INDEX idx_booking_start_date ON Booking (start_date);
CREATE INDEX idx_booking_end_date ON Booking (end_date);


