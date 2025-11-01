-- INNER JOIN: get all bookings with the users who made them
SELECT 
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM `User` AS u
INNER JOIN Booking AS b ON u.user_id = b.user_id
ORDER BY b.booking_id;

-- LEFT JOIN: get all properties with their reviews (include properties without reviews)
SELECT 
    p.name AS property_name,
    r.rating,
    r.comment
FROM Property AS p
LEFT JOIN Review AS r ON p.property_id = r.property_id
ORDER BY p.property_id;

-- FULL OUTER JOIN workaround in MySQL: get all users and all bookings
SELECT 
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM `User` AS u
LEFT JOIN Booking AS b ON u.user_id = b.user_id

UNION

SELECT 
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM `User` AS u
RIGHT JOIN Booking AS b ON u.user_id = b.user_id
ORDER BY booking_id;