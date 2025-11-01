# Database Performance Monitoring Report

## Goal
Monitor and refine query performance using EXPLAIN and schema improvements.

## Bottlenecks Observed
1. Queries filtering bookings by date scanned the entire Booking table → slow on large datasets.  
2. Queries grouping by user_id also scanned the table fully → slow for analytics.

## Changes Implemented
- Added index on `Booking(start_date)` → improves date range queries.  
- Added index on `Booking(user_id)` → improves GROUP BY queries and joins with User.

## Test Queries After Changes
- Fetch bookings in 2024:
```sql
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
