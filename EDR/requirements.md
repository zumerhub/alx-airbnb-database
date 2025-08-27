# ER Diagram for Airbnb Database

## Entities:
- **User**: id, first_name, last_name, email, password, phone_number, created_at, updated_at
- **Property**: id, host_id, title, description, price_per_night, address, city, country, created_at, updated_at
- **Booking**: id, user_id, property_id, start_date, end_date, status, created_at, updated_at
- **Review**: id, user_id, property_id, rating, comment, created_at

## Relationships:
- User (1) -> (N) Booking
- User (1) -> (N) Property
- Property (1) -> (N) Booking
- User (1) -> (N) Review
- Property (1) -> (N) Review

![ER Diagram](path-to-your-diagram.png)
