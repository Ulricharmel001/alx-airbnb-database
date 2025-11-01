# Index Performance Report

## 1. High-Usage Columns

- **Booking**: user_id, property_id, start_date, end_date  
- **Property**: host_id, location  
- **User**: email  

Columns are frequently used in **WHERE**, **JOIN**, or **ORDER BY** clauses.

---

## 2. Indexes Created

```sql
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_end_date ON Booking(end_date);
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_user_email ON `User`(email);
