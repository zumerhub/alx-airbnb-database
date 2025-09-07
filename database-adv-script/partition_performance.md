# Task 5: Partitioning Large Tables - Performance Report

## Objective
The `Booking` table is assumed to be very large, and queries filtering by date ranges were slow. To optimize, we implemented **table partitioning** based on the `start_date` column using `RANGE` partitioning by year.

---

## Implementation
- Created a new table `Booking_Partitioned` with partitions for each year (2019–2023) and one `MAXVALUE` partition for future years.
- Queries filtering by `start_date` (e.g., bookings in 2022) are now only executed on the relevant partition rather than scanning the entire table.

---

## Performance Testing
### Before Partitioning
```sql
EXPLAIN SELECT * FROM Booking
WHERE start_date BETWEEN '2022-01-01' AND '2022-12-31';

---

 ## Note 
 - Partitioning the `Booking table` by start_date provides faster queries on date ranges and makes managing large datasets more efficient. It is especially useful for time-series or log-style data such as bookings.

---