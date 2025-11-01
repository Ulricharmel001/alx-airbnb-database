--- total booking per user 
SELECT user_id, COUNT(*) AS total_bookings
FROM Booking
GROUP BY user_id
ORDER BY total_bookings DESC;

--- rant property by total booking 

SELECT property_id
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM Booking
GROUP BY property_id
ORDER BY booking_rank;




-- Indexes to improve query performance
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_property_location ON Property(location);



