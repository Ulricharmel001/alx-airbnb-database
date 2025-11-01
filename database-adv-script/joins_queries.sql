-- =========================================
-- joins_queries.sql
-- =========================================

-- 1) INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM "User" AS u
INNER JOIN Booking AS b ON u.user_id = b.user_id;

-- 2) LEFT JOIN: Retrieve all properties and their reviews, including properties with no reviews
SELECT 
    p.name AS property_name,
    r.rating,
    r.comment
FROM Property AS p
LEFT JOIN Review AS r ON p.property_id = r.property_id;

-- 3) FULL OUTER JOIN: Retrieve all users and all bookings, even if unmatched
-- PostgreSQL / SQL Server version (supports FULL OUTER JOIN)
SELECT 
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM "User" AS u
FULL OUTER JOIN Booking AS b ON u.user_id = b.user_id;

-- 3b) MySQL version (if FULL OUTER JOIN not supported)
SELECT 
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM "User" AS u
LEFT JOIN Booking AS b ON u.user_id = b.user_id
UNION
SELECT 
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM "User" AS u
RIGHT JOIN Booking AS b ON u.user_id = b.user_id;
