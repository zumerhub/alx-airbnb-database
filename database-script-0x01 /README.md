# AirBnB Database Schema (SQL DDL)

## Overview
This project defines a normalized **AirBnB-style relational database schema** using **SQL Data Definition Language (DDL)**.  
The schema follows **Third Normal Form (3NF)** to reduce redundancy, ensure data integrity, and optimize query performance.

---

## Entities & Relationships
The database consists of six main entities:

1. **User** – Stores guest, host, and admin information.  
2. **Property** – Represents listings created by hosts.  
3. **Booking** – Tracks reservations made by users for properties.  
4. **Payment** – Records payments linked to bookings.  
5. **Review** – Captures guest feedback and ratings for properties.  
6. **Message** – Supports communication between users.  

---

## Features
- **UUID primary keys** for unique identification.  
- **Foreign key constraints** to maintain referential integrity.  
- **CHECK constraints** for role, booking status, payment method, and rating values.  
- **Automatic timestamps** for creation and updates.  
- **Indexes** on frequently queried columns (`email`, `property_id`, `booking_id`, etc.).  
- **Strict 3NF compliance**: avoids redundancy and ensures data consistency.  

---

## Database Schema
### Tables Created
- `User`  
- `Property`  
- `Booking`  
- `Payment`  
- `Review`  
- `Message`  

Each table includes **primary keys (PK)**, **foreign keys (FK)**, and **constraints** as defined in the SQL script.

---

## Usage
1. Open your SQL client (e.g., **PostgreSQL psql**, **MySQL CLI**, or **pgAdmin**).  
2. Run the SQL file:  

```bash
psql -U <username> -d <database> -f schema.sql
