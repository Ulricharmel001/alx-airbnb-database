# Airbnb Database Seed Script

This SQL script populates the Airbnb database with sample data for testing.

### Tables Covered
- **User:** sample guest and host
- **Property:** one listing by the host
- **Booking:** guest booking of the property
- **Payment:** payment made for the booking
- **Review:** user feedback on stay
- **Message:** simple host-guest communication

### Usage
Run the script after creating the database schema:
```bash
psql -d airbnb_db -f seed.sql
