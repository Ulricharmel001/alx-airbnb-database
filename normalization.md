# Task 1: Database Normalization to 3NF
**Project:** DataScape: Mastering Database Design  
---

## Objective
Apply normalization principles to ensure the Airbnb database schema is in the **Third Normal Form (3NF)**, eliminating redundancy and ensuring data integrity.

---

## 1. Review of the Initial Schema

The database contains the following entities:

- **User** (`user_id`, first_name, last_name, email, password_hash, phone_number, role, created_at)  
- **Property** (`property_id`, host_id, name, description, location, pricepernight, created_at, updated_at)  
- **Booking** (`booking_id`, property_id, user_id, start_date, end_date, total_price, status, created_at)  
- **Payment** (`payment_id`, booking_id, amount, payment_date, payment_method)  
- **Review** (`review_id`, property_id, user_id, rating, comment, created_at)  
- **Message** (`message_id`, sender_id, recipient_id, message_body, sent_at)  

---

## 2. Normalization Steps

### **Step 1: First Normal Form (1NF)**
**Rules:**
- Eliminate repeating groups and arrays.
- Ensure all attributes are atomic.

**Analysis:**
- All tables already have atomic columns.
- No repeating groups exist.
- **1NF satisfied.**

---

### **Step 2: Second Normal Form (2NF)**
**Rules:**
- Table must be in 1NF.
- Every non-key attribute must be fully functionally dependent on the primary key.

**Analysis:**
- **User**: All non-key attributes depend on `user_id`. ✅  
- **Property**: All non-key attributes depend on `property_id`. ✅  
- **Booking**: All non-key attributes (`start_date`, `end_date`, `total_price`, `status`) depend on `booking_id`. ✅  
- **Payment**: All non-key attributes depend on `payment_id`. ✅  
- **Review**: All non-key attributes depend on `review_id`. ✅  
- **Message**: All non-key attributes depend on `message_id`. ✅  

**Conclusion:** All tables are in 2NF.

---

### **Step 3: Third Normal Form (3NF)**
**Rules:**
- Table must be in 2NF.
- No transitive dependency (non-key attributes cannot depend on other non-key attributes).

**Analysis:**
- **User**: No transitive dependencies. ✅  
- **Property**: No transitive dependencies. ✅  
- **Booking**: `total_price` could be calculated from `Property.pricepernight * DATEDIFF(end_date, start_date)`. However, storing it avoids recomputation for historical data. No violation. ✅  
- **Payment**: No transitive dependencies. ✅  
- **Review**: No transitive dependencies. ✅  
- **Message**: No transitive dependencies. ✅  

**Conclusion:** All tables satisfy 3NF.

---

## 3. Summary of Normalization Decisions

| Table     | 1NF | 2NF | 3NF | Notes |
|-----------|-----|-----|-----|-------|
| User      | ✅   | ✅   | ✅   | All attributes depend on PK |
| Property  | ✅   | ✅   | ✅   | No transitive dependency |
| Booking   | ✅   | ✅   | ✅   | `total_price` stored for historical consistency |
| Payment   | ✅   | ✅   | ✅   | Fully dependent on PK |
| Review    | ✅   | ✅   | ✅   | Fully dependent on PK |
| Message   | ✅   | ✅   | ✅   | Fully dependent on PK |

All tables in this Airbnb database schema are in **Third Normal Form (3NF)**.  
The design eliminates redundancy and ensures **data integrity** while maintaining real-world usability.

---

## 4. References
- Database normalization principles: 1NF, 2NF, 3NF.  
- Airbnb database specification provided by ALX.
