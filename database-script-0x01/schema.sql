
-- Airbnb Database Schema
-- Table: User
CREATE TABLE IF NOT EXISTS "User" (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) NOT NULL CHECK(role IN ('guest','host','admin')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_email ON "User"(email);

-- Table: Property
CREATE TABLE IF NOT EXISTS Property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_property_host_id ON Property(host_id);

-- Table: Booking
CREATE TABLE IF NOT EXISTS Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL REFERENCES Property(property_id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) NOT NULL CHECK(status IN ('pending','confirmed','canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);


-- Table: Payment

CREATE TABLE IF NOT EXISTS Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL REFERENCES Booking(booking_id) ON DELETE CASCADE,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) NOT NULL CHECK(payment_method IN ('credit_card','paypal','stripe'))
);

CREATE INDEX idx_payment_booking_id ON Payment(booking_id);


-- Table: Review
CREATE TABLE IF NOT EXISTS Review (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL REFERENCES Property(property_id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
    rating INT NOT NULL CHECK(rating BETWEEN 1 AND 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);

-- Table: Message
CREATE TABLE IF NOT EXISTS Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
    recipient_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_message_sender_id ON Message(sender_id);
CREATE INDEX idx_message_recipient_id ON Message(recipient_id);

-- Command to insert data to the varous tables
--- User Table
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
('1e7b8f4e-3c2a-4d5b-8f4e-3c2a4d5b8f4e', 'Ulrich', 'Armel', 'ulrich.armel@example.com', 'hashed_password_1', '123-456-7890', 'guest'),
('2f8c9g5h-4d3b-5e6c-9g5h-4d3b5e6c9g5h', 'Doe', 'John', 'john.doe@example.com', 'hashed_password_2', '098-765-4321', 'host');
--- Property Table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight) VALUES
('3g9h0i6j-5e4c-6f7d-0i6j-5e4c6f7d0i6j', '2f8c9g5h-4d3b-5e6c-9g5h-4d3b5e6c9g5h', 'Cozy Cottage', 'A cozy cottage in the countryside.', '123 Country Lane, Countryside', 150.00);    
--- Booking Table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('4h0i1j7k-6f5d-7g8e-1j7k-6f5d7g8e1j7k', '3g9h0i6j-5e4c-6f7d-0i6j-5e4c6f7d0i6j', '1e7b8f4e-3c2a-4d5b-8f4e-3c2a4d5b8f4e', '2023-10-01', '2023-10-07', 900.00, 'confirmed');
--- Payment Table
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES 
('5i1j2k8l-7g6e-8h9f-2k8l-7g6e8h9f2k8l', '4h0i1j7k-6f5d-7g8e-1j7k-6f5d7g8e1j7k', 900.00, 'credit_card');
--- Review Table
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
('6j2k3l9m-8h7f-9i0g-3l9m-8h7f9i0g3l9m', '3g9h0i6j-5e4c-6f7d-0i6j-5e4c6f7d0i6j', '1e7b8f4e-3c2a-4d5b-8f4e-3c2a4d5b8f4e', 5, 'Amazing stay! The cottage was cozy and the host was very accommodating.');
--- Message Table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
('7k3l4m0n-9i8g-0j1h-4m0n-9i8g0j1h4m0n', '1e7b8f4e-3c2a-4d5b-8f4e-3c2a4d5b8f4e', '2f8c9g5h-4d3b-5e6c-9g5h-4d3b5e6c9g5h', 'Hello, I would like to inquire about the availability of your property for next month.');