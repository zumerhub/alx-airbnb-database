# Database Normalization – AirBnB Schema

## Objective
Apply normalization principles to ensure the database is in the **Third Normal Form (3NF)** by eliminating redundancies, ensuring atomicity, and maintaining referential integrity with the tabular schema arrangement
. 

---

## Step 1: First Normal Form (1NF)
**Rule:**  
- Eliminate repeating groups.  
- Ensure atomic values (no multi-valued attributes).  
- Each row is uniquely identifiable with a primary key.  

**Implementation:**  
- All entities have a **primary key** (UUIDs).  
- No multi-valued attributes exist (e.g., emails and phone numbers are stored as single values).  
- Tables have clearly defined rows and columns.  

✅ The schema satisfies **1NF**.

---

## Step 2: Second Normal Form (2NF)
**Rule:**  
- Must already satisfy 1NF.  
- Eliminate partial dependencies (i.e., no attribute depends only on part of a composite key).  

**Implementation:**  
- All tables use **single-column primary keys** (UUIDs).  
- Non-key attributes depend **fully** on the primary key.  
  - Example: In the **Booking** table, attributes like `start_date`, `end_date`, and `total_price` depend on the entire `booking_id`.  
- No composite primary keys are used, so **partial dependency does not exist**.  

✅ The schema satisfies **2NF**.

---

## Step 3: Third Normal Form (3NF)
**Rule:**  
- Must already satisfy 2NF.  
- Eliminate transitive dependencies (non-key attributes should not depend on other non-key attributes).  

**Implementation & Adjustments:**  
1. **User Table**  
   - `role` is an ENUM, preventing redundancy (guest/host/admin).  
   - All other fields directly depend on `user_id`.  
   ✅ No transitive dependency.  

2. **Property Table**  
   - `host_id` correctly references **User(user_id)**.  
   - `pricepernight` and `location` are directly related to the property, not the user.  
   ✅ No transitive dependency.  

3. **Booking Table**  
   - `total_price` could theoretically be derived from (`end_date` - `start_date`) × `pricepernight`.  
   - Keeping it stored can cause **update anomalies**, but it may be justified for **performance**.  
   👉 To strictly enforce 3NF, move `total_price` to a **computed column** or calculate dynamically.  

4. **Payment Table**  
   - `amount`, `payment_date`, and `payment_method` depend only on `payment_id`.  
   ✅ Fully normalized.  

5. **Review Table**  
   - `rating` and `comment` depend only on `review_id`.  
   ✅ No transitive dependency.  

6. **Message Table**  
   - `message_body` and `sent_at` depend only on `message_id`.  
   ✅ No transitive dependency.  

---


## This schema applies normalization principles to ensure the database is in the **Third Normal Form (3NF)**.
---

## **User Table**
| Column        | Data Type   | Constraints                           |
|---------------|------------|---------------------------------------|
| **user_id**   | UUID       | **PK**, Indexed                       |
| first_name    | VARCHAR    | NOT NULL                              |
| last_name     | VARCHAR    | NOT NULL                              |
| email         | VARCHAR    | UNIQUE, NOT NULL                      |
| password_hash | VARCHAR    | NOT NULL                              |
| phone_number  | VARCHAR    | NULL                                  |
| role          | ENUM       | (guest, host, admin), NOT NULL        |
| created_at    | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP             |

---

## **Property Table**
| Column         | Data Type   | Constraints                                    |
|----------------|------------|------------------------------------------------|
| **property_id**| UUID       | **PK**, Indexed                                |
| host_id        | UUID       | **FK** → User(user_id)                         |
| name           | VARCHAR    | NOT NULL                                       |
| description    | TEXT       | NOT NULL                                       |
| location       | VARCHAR    | NOT NULL                                       |
| pricepernight  | DECIMAL    | NOT NULL                                       |
| created_at     | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                      |
| updated_at     | TIMESTAMP  | ON UPDATE CURRENT_TIMESTAMP                    |

---

## **Booking Table**
| Column        | Data Type   | Constraints                                    |
|---------------|------------|------------------------------------------------|
| **booking_id**| UUID       | **PK**, Indexed                                |
| property_id   | UUID       | **FK** → Property(property_id)                  |
| user_id       | UUID       | **FK** → User(user_id)                         |
| start_date    | DATE       | NOT NULL                                       |
| end_date      | DATE       | NOT NULL                                       |
| status        | ENUM       | (pending, confirmed, canceled), NOT NULL       |
| created_at    | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                      |

> ⚠️ *Optional:* `total_price` can be **removed** for strict 3NF since it’s derivable from `pricepernight × nights`.

---

## **Payment Table**
| Column         | Data Type   | Constraints                                    |
|----------------|------------|------------------------------------------------|
| **payment_id** | UUID       | **PK**, Indexed                                |
| booking_id     | UUID       | **FK** → Booking(booking_id)                   |
| amount         | DECIMAL    | NOT NULL                                       |
| payment_date   | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                      |
| payment_method | ENUM       | (credit_card, paypal, stripe), NOT NULL        |

---

## **Review Table**
| Column        | Data Type   | Constraints                                    |
|---------------|------------|------------------------------------------------|
| **review_id** | UUID       | **PK**, Indexed                                |
| property_id   | UUID       | **FK** → Property(property_id)                  |
| user_id       | UUID       | **FK** → User(user_id)                         |
| rating        | INTEGER    | CHECK (rating BETWEEN 1 AND 5), NOT NULL       |
| comment       | TEXT       | NOT NULL                                       |
| created_at    | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                      |

---

## **Message Table**
| Column         | Data Type   | Constraints                                    |
|----------------|------------|------------------------------------------------|
| **message_id** | UUID       | **PK**, Indexed                                |
| sender_id      | UUID       | **FK** → User(user_id)                         |
| recipient_id   | UUID       | **FK** → User(user_id)                         |
| message_body   | TEXT       | NOT NULL                                       |
| sent_at        | TIMESTAMP  | DEFAULT CURRENT_TIMESTAMP                      |

---

## Final Normalized Schema (3NF)
- **User(user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)**  
- **Property(property_id, host_id, name, description, location, pricepernight, created_at, updated_at)**  
- **Booking(booking_id, property_id, user_id, start_date, end_date, status, created_at)**  
  - *(Optionally remove `total_price` to maintain strict 3NF)*  
- **Payment(payment_id, booking_id, amount, payment_date, payment_method)**  
- **Review(review_id, property_id, user_id, rating, comment, created_at)**  
- **Message(message_id, sender_id, recipient_id, message_body, sent_at)**  

---

## Conclusion
The AirBnB database schema satisfies **Third Normal Form (3NF)** with minimal redundancy and strong referential integrity.  

- The only **potential violation** is `total_price` in the **Booking** table, which is functionally dependent on other attributes.  
- To maintain **strict 3NF**, this should be calculated dynamically rather than stored.  

✅ Overall, the schema is normalized and optimized for integrity, scalability, and efficient querying.  
