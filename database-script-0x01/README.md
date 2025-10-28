# Airbnb Database Schema

This directory contains the SQL schema for the Airbnb-like application.  
It defines all tables, primary keys, foreign keys, constraints, and indexes according to the project specification.

## Tables
- **User:** Stores user information including role and contact details.  
- **Property:** Stores property listings with host reference.  
- **Booking:** Stores booking details linking users and properties.  
- **Payment:** Stores payments associated with bookings.  
- **Review:** Stores property reviews by users.  
- **Message:** Stores messages between users.

## Features
- Primary keys and foreign keys enforced.  
- Constraints for ENUM values and rating range.  
- Indexes on commonly queried fields for optimized performance.  
- Timestamp columns for creation and updates.

## INSERT COMMAND 

Script taht insert data in the various table available 