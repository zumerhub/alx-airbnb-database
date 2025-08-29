# Database Sample Data

This document provides sample data inserted into the **Property Rental Management System** database.  
The data simulates real-world usage, including users, properties, bookings, payments, and reviews.

---

## 📌 1. Users
| ID | Full Name        | Email                | Phone       | Role      |
|----|-----------------|----------------------|-------------|-----------|
| 1  | Adekunle Samuel | ade@example.com      | 08012345678 | Customer  |
| 2  | Grace Johnson   | grace.j@example.com  | 08023456789 | Customer  |
| 3  | Michael Ojo     | mike.ojo@example.com | 08034567890 | Host      |
| 4  | Ngozi Adeyemi   | ngozi.a@example.com  | 08045678901 | Host      |

**Explanation**:  
- Customers can book properties.  
- Hosts own and manage properties.  

---

## 📌 2. Properties
| ID | User (Host) | Title                     | Location       | Price/Night | Type      |
|----|-------------|---------------------------|---------------|-------------|-----------|
| 1  | Michael Ojo | Cozy Apartment in Ikeja   | Ikeja, Lagos  | 25,000.00   | Apartment |
| 2  | Michael Ojo | Luxury Villa in Lekki     | Lekki, Lagos  | 120,000.00  | Villa     |
| 3  | Ngozi Adeyemi | Budget Room in Surulere | Surulere, Lagos | 10,000.00 | Room      |

**Explanation**:  
- Each property belongs to a **host** (linked via `user_id`).  
- Price per night varies by property type.  

---

## 📌 3. Bookings
| ID | User (Customer) | Property | Check-In   | Check-Out  | Status     |
|----|-----------------|----------|------------|------------|------------|
| 1  | Adekunle Samuel | Apartment (Ikeja) | 2025-09-01 | 2025-09-05 | Confirmed |
| 2  | Grace Johnson   | Villa (Lekki)     | 2025-09-10 | 2025-09-15 | Pending   |
| 3  | Adekunle Samuel | Room (Surulere)   | 2025-10-01 | 2025-10-03 | Cancelled |

**Explanation**:  
- Customers book properties with specific dates.  
- Status shows whether booking is `Confirmed`, `Pending`, or `Cancelled`.  

---

## 📌 4. Payments
| ID | Booking | Amount    | Date       | Method        | Status     |
|----|---------|-----------|------------|---------------|------------|
| 1  | 1       | 100,000.00 | 2025-08-20 | Credit Card   | Completed  |
| 2  | 2       | 600,000.00 | 2025-08-25 | Bank Transfer | Pending    |
| 3  | 3       | 20,000.00  | 2025-08-28 | Cash          | Refunded   |

**Explanation**:  
- Payments are linked to **bookings**.  
- Includes different methods (`Credit Card`, `Bank Transfer`, `Cash`).  

---

## 📌 5. Reviews
| ID | User (Customer) | Property | Rating | Comment                                    | Date       |
|----|-----------------|----------|--------|--------------------------------------------|------------|
| 1  | Adekunle Samuel | Apartment (Ikeja) | 5 | Excellent apartment, very neat and comfortable! | 2025-09-06 |
| 2  | Grace Johnson   | Villa (Lekki)     | 4 | Great villa, but quite expensive.           | 2025-09-16 |
| 3  | Adekunle Samuel | Room (Surulere)   | 2 | Room was not clean as expected.             | 2025-10-04 |

**Explanation**:  
- Customers can leave reviews after booking.  
- Ratings range from 1 (poor) to 5 (excellent).  

---

## 🚀 Usage
Run the provided `INSERT` SQL script to populate the database with this data:  

```bash
mysql -u your_user -p your_database < sample_data.sql
