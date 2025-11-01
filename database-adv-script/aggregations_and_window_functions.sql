-- Rank properties by total bookings using ROW_NUMBER()
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM Booking
GROUP BY property_id
ORDER BY booking_rank;


-- Rank properties by total bookings
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM Booking
GROUP BY property_id
ORDER BY booking_rank;



