-- Booking table indexes
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_end_date ON Booking(end_date);

-- Property table indexes
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);

-- User table indexes
CREATE INDEX idx_user_email ON `User`(email);

-- Measure query performance before and after indexes
EXPLAIN
SELECT u.first_name, b.booking_id
FROM `User` u
INNER JOIN Booking b ON u.user_id = b.user_id
WHERE u.email = 'ulrichsgrahix@gmail.com';

-- Optional: EXPLAIN ANALYZE for MySQL 8+ to see execution timing
-- EXPLAIN ANALYZE
-- SELECT u.first_name, b.booking_id
-- FROM `User` u
-- INNER JOIN Booking b ON u.user_id = b.user_id
-- WHERE u.email = 'ulrichsgrahix@gmail.com';
