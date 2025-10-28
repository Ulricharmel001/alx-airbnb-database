-- Seed data for Airbnb database
-- Adds sample records to all main tables

-- User Table
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('1e7b8f4e-3c2a-4d5b-8f4e-3c2a4d5b8f4e', 'Ulrich', 'Armel', 'ulrich.armel@example.com', 'hashed_password_1', '123-456-7890', 'guest'),
('2f8c9f5h-4d3b-5e6c-9f5h-4d3b5e6c9f5h', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_2', '098-765-4321', 'host');

-- Property Table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('3g9h0i6j-5e4c-6f7d-0i6j-5e4c6f7d0i6j', '2f8c9f5h-4d3b-5e6c-9f5h-4d3b5e6c9f5h', 'Cozy Cottage', 'A cozy cottage in the countryside.', '123 Country Lane, Countryside', 150.00);

-- Booking Table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('4h0i1j7k-6f5d-7g8e-1j7k-6f5d7g8e1j7k', '3g9h0i6j-5e4c-6f7d-0i6j-5e4c6f7d0i6j', '1e7b8f4e-3c2a-4d5b-8f4e-3c2a4d5b8f4e', '2023-10-01', '2023-10-07', 900.00, 'confirmed');

-- Payment Table
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('5i1j2k8l-7g6e-8h9f-2k8l-7g6e8h9f2k8l', '4h0i1j7k-6f5d-7g8e-1j7k-6f5d7g8e1j7k', 900.00, 'credit_card');

-- Review Table
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('6j2k3l9m-8h7f-9i0g-3l9m-8h7f9i0g3l9m', '3g9h0i6j-5e4c-6f7d-0i6j-5e4c6f7d0i6j', '1e7b8f4e-3c2a-4d5b-8f4e-3c2a4d5b8f4e', 5, 'Amazing stay! The cottage was cozy and the host was very accommodating.');

-- Message Table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('7k3l4m0n-9i8g-0j1h-4m0n-9i8g0j1h4m0n', '1e7b8f4e-3c2a-4d5b-8f4e-3c2a4d5b8f4e', '2f8c9f5h-4d3b-5e6c-9f5h-4d3b5e6c9f5h', 'Hello, I would like to inquire about the availability of your property for next month.');
