-- Create Booking table partitioned by year of start_date
CREATE TABLE Booking (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(20),
    PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Insert some sample bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
('b001', 'p001', 'u001', '2023-05-01', '2023-05-05', 500.00, 'confirmed'),
('b002', 'p002', 'u002', '2024-07-10', '2024-07-15', 750.00, 'confirmed'),
('b003', 'p003', 'u003', '2025-03-20', '2025-03-25', 600.00, 'pending');

-- Test query: get all bookings in 2024
SELECT * 
FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
