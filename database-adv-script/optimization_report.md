# Query Optimization Report

## 1. Initial Query
The initial query retrieved all bookings with user, property, and payment details using multiple JOINs.  
It selected all columns, which can slow performance for large datasets.

### EXPLAIN Analysis
- Observed table scans on Booking, User, Property, and Payment tables.  
- LEFT JOIN on Payment added overhead for bookings without payments.  
- Query execution time increased with dataset size.

---

## 2. Refactored Query
- Removed unnecessary columns.  
- Used indexed columns in JOINs.  
- Added ORDER BY for common queries.  

```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_price,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount AS payment_amount,
    pay.payment_method
FROM Booking b
INNER JOIN `User` u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
ORDER BY b.start_date DESC;
