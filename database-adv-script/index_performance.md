# Index Optimization – ALX Airbnb Database Project

This task demonstrates how **indexes** can be used to improve query performance in the Airbnb database schema.
---

# Step 1: Identify high-usage columns
- ** From the `schema`: **
  ## User table
  -  email (often used for lookups)
  -  user_id (foreign key in Booking, Property, Review)
  
  ## Property table
  -  property_id (foreign key in Booking, Review)
  -  location (likely used for searches/filtering)

  ## Booking table
  -  user_id (foreign key from User)
  -  property_id (foreign key from Property)
  -  status (could be filtered often: WHERE status = 'Confirmed')


---

## 1. Indexes Created
The following indexes were added (see `database_index.sql`):

- **User Table**
  - `idx_user_email` → optimizes login and lookups by email.
- **Booking Table**
  - `idx_booking_user_id` → speeds up joins with the `User` table.
  - `idx_booking_property_id` → speeds up joins with the `Property` table.
  - `idx_booking_user_property` → improves performance when filtering by both user and property.
  - `idx_booking_date` → useful for date range searches.
- **Property Table**
  - `idx_property_location` → optimizes queries filtering/searching by location.

---

## 2. Measuring Performance
I tested queries before and after adding indexes using `EXPLAIN`.


#### Example 1: Booking Join with User
```sql
EXPLAIN SELECT * 
FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE b.status = 'Confirmed';



EXPLAIN SELECT * 
FROM Booking b
JOIN Property p ON b.property_id = p.property_id
WHERE p.location = 'Lagos';