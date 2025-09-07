# SQL Joins – ALX Airbnb Database Project

This project demonstrates how to use different types of SQL joins with the Airbnb schema.

## Queries Included

### 1. INNER JOIN
Retrieve all bookings with their respective users.
```sql
SELECT b.booking_id, b.start_date, b.end_date,
       u.user_id, u.first_name, u.last_name, u.email
FROM Booking b
INNER JOIN `User` u ON b.user_id = u.user_id;

