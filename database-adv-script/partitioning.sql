-- ======================================
-- Task 5: Partitioning the Booking Table
-- ======================================

-- 1. Create a partitioned version of the Booking table based on start_date
CREATE TABLE Booking_Partitioned (
    booking_id  CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id     CHAR(36) NOT NULL,
    start_date  DATE NOT NULL,
    end_date    DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status      VARCHAR(20) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    KEY idx_booking_property (property_id),
    KEY idx_booking_user (user_id)
    KEY idx_booking_start_date (start_date),
    KEY idx_booking_status (status)
)

PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2019 VALUES LESS THAN (2020),
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);


-- Example query to utilize the partitioned table
-- 2. Query to find all bookings in the year 2022-01-01 and 2022-12-31

SELECT *
FORM Booking_Partitioned
WHERE start_date BETWEEN '2022-01-01' AND '2022-12-31'
