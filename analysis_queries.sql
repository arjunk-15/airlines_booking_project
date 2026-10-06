-- 1. Route Revenue & Booking Volume
SELECT origin, 
       destination, 
       COUNT(*) AS total_booking, 
       SUM(fare_amount) AS total_revenue 
FROM airline_bookings 
GROUP BY origin, destination
ORDER BY total_revenue DESC;

-- 2. Fare Class Performance Breakdown
SELECT fare_class,
       COUNT(*) AS total_bookings,
       SUM(fare_amount) AS total_revenue,
       ROUND(AVG(fare_amount), 2) AS avg_fare
FROM airline_bookings
GROUP BY fare_class
ORDER BY total_revenue DESC;

-- 3. Cancellation Rates by Booking Channel
SELECT booking_channel,
       COUNT(*) AS total_bookings,
       SUM(CASE WHEN booking_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_count,
       ROUND(
         SUM(CASE WHEN booking_status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
         2
       ) AS cancellation_rate_pct
FROM airline_bookings
GROUP BY booking_channel
ORDER BY cancellation_rate_pct DESC;

-- 4. Customer Segmentation (Frequent Flyers vs One-Time)
SELECT passenger_id,
       passenger_name,
       COUNT(*) AS booking_count,
       SUM(fare_amount) AS total_spend,
       CASE
           WHEN COUNT(*) > 1 THEN 'Frequent Flyer'
           ELSE 'One-time Traveler'
       END AS customer_segment
FROM airline_bookings
GROUP BY passenger_id, passenger_name
ORDER BY total_spend DESC;

-- 5. Route Revenue Ranking (Window Function)
SELECT origin, 
       destination,
       SUM(fare_amount) AS total_revenue,
       DENSE_RANK() OVER (ORDER BY SUM(fare_amount) DESC) AS revenue_rank
FROM airline_bookings
GROUP BY origin, destination;
