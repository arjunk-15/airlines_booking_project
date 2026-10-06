# Airline Booking & Revenue Analysis (SQL)

## Project Overview
An end-to-end SQL data analysis project investigating passenger booking behaviors, route yields, channel cancellation rates, and customer segmentation across domestic flight corridors.

---

## Database Schema
The analysis operates on a relational schema (`airline_bookings`) capturing transactional, customer, and flight data:

- **booking_id**: Unique identifier for each transaction
- **passenger_id / passenger_name**: Customer identifiers
- **flight_number / origin / destination**: Flight logistics and routing
- **booking_date / travel_date**: Lead-time and schedule timestamps
- **fare_class / fare_amount**: Ticket tier and transactional yield
- **booking_channel**: Distribution source (`Website`, `Mobile App`, `Travel Agent`)
- **booking_status**: Order lifecycle (`Confirmed`, `Cancelled`, `No-show`)

---

## Core Analytical Queries & Findings

### 1. High-Yield Flight Routes
- **DEL → BOM** generated the highest total revenue (₹35,800 across 4 bookings), accounting for over 35% of overall sales volume.
- Key secondary trunk routes include **BOM → BLR** (₹15,900) and **DEL → BLR** (₹14,000).

### 2. Cabin Class Performance
- **Economy** drove the highest passenger volume (8 bookings, ₹39,600).
- **Business Class** produced comparable total revenue (₹39,500) from only 3 bookings, yielding an average fare of ₹13,166.67 (~2.7× Economy yield).

### 3. Distribution Channel Reliability & Churn
- **Mobile App** demonstrated the lowest risk with a **0.0% cancellation rate** across 5 bookings.
- **Website** showed a moderate cancellation rate of **20.0%**.
- **Travel Agent** bookings experienced the highest cancellation rate at **50.0%**.

### 4. Passenger Loyalty & Segmentation
- Identified repeat travelers booking across multiple sectors and fare tiers.
- High-value travelers consistently book Business and premium inventory, highlighting prime targets for automated loyalty retention campaigns.

### 5. Corridor Leaderboards via Window Functions
- Applied `DENSE_RANK()` window partitioning to establish dynamic rank standings based on route revenue without gaps between tied positions.

---

## Tech Stack
- **Database Engine:** MySQL
- **Key SQL Concepts:** Data Aggregation (`COUNT`, `SUM`, `AVG`), Rounding (`ROUND`), Conditional Grouping (`CASE WHEN`), Window Functions (`DENSE_RANK() OVER`)
