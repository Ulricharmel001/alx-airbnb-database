# Booking Table Partitioning Report

## Goal
Make queries faster on the Booking table by partitioning by start_date.

## How Partitioning Was Done
- RANGE partitioning by YEAR(start_date)  
- Partitions: p2023, p2024, p2025, pmax

## Test Query
SELECT * 
FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

## Improvements
- Queries now scan only the needed partition.  
- Faster than scanning the whole table.  
- Easier to maintain or archive old partitions.

## Notes
- Primary key includes start_date for MySQL partitioning.  
- Best used for queries filtering on start_date.  
- Other indexes can still be applied for extra speed.
