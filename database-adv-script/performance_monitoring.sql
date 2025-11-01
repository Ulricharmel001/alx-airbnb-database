-- Check query performance using EXPLAIN

-- Example 1: Get bookings with user and property info
EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name AS property_name
FROM Booking b
INNER JOIN `User` u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date >= '2024-01-01'
  AND b.end_date <= '2024-12-31';

-- Example 2: Count total bookings per user
EXPLAIN
SELECT user_id, COUNT(*) AS total_bookings
FROM Booking
GROUP BY user_id;

-- Suggested improvements:
-- 1. Add index on Booking(start_date) for faster date filtering
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- 2. Add index on Booking(user_id) for faster grouping
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- After adding indexes, run EXPLAIN again to check improvements
EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name AS property_name
FROM Booking b
INNER JOIN `User` u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date >= '2024-01-01'
  AND b.end_date <= '2024-12-31';
