-- -----------------------------------------------
-- RIDE STATUS BREAKDOWN
-- -----------------------------------------------
 
SELECT
    booking_status,
    COUNT(*) AS ride_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM uber_rides
GROUP BY booking_status
ORDER BY ride_count DESC;
 
 
-- -----------------------------------------------
-- COMPLETED BOOKINGS BY MONTH
-- -----------------------------------------------
 
SELECT
    TO_CHAR(ride_date, 'Mon') AS month_name,
    EXTRACT(MONTH FROM ride_date) AS month_num,
    COUNT(*) AS completed_bookings
FROM uber_rides
WHERE booking_status = 'Completed'
GROUP BY month_name, month_num
ORDER BY month_num;
 
 
-- -----------------------------------------------
-- REVENUE BY MONTH
-- -----------------------------------------------
 
SELECT
    TO_CHAR(ride_date, 'Mon') AS month_name,
    EXTRACT(MONTH FROM ride_date) AS month_num,
    ROUND(SUM(booking_value), 2) AS monthly_revenue
FROM uber_rides
WHERE booking_status = 'Completed'
GROUP BY month_name, month_num
ORDER BY month_num;
 
 
-- -----------------------------------------------
-- REVENUE BY VEHICLE TYPE
-- -----------------------------------------------
 
SELECT
    vehicle_type,
    ROUND(SUM(booking_value), 2) AS total_revenue,
    COUNT(*) AS total_bookings
FROM uber_rides
WHERE booking_status = 'Completed'
GROUP BY vehicle_type
ORDER BY total_revenue DESC;
 
 
-- -----------------------------------------------
-- VEHICLE PERFORMANCE TABLE
-- -----------------------------------------------
 
SELECT
    vehicle_type,
    COUNT(DISTINCT customer_id)                        AS customer_count,
    ROUND(SUM(booking_value), 2)                       AS revenue,
    SUM(CASE WHEN booking_status = 'Completed' THEN 1 ELSE 0 END) AS completed_bookings,
    ROUND(
        SUM(CASE WHEN booking_status = 'Completed' THEN 1 ELSE 0 END) * 100.0
        / NULLIF(COUNT(*), 0), 2
    )                                                  AS completion_pct
FROM uber_rides
GROUP BY vehicle_type
ORDER BY revenue DESC;
 
 
-- -----------------------------------------------
-- TOP PICKUP LOCATION
-- -----------------------------------------------
 
SELECT
    pickup_location,
    COUNT(*) AS pickup_count
FROM uber_rides
WHERE booking_status = 'Completed'
GROUP BY pickup_location
ORDER BY pickup_count DESC
LIMIT 10;
 
 
-- -----------------------------------------------
-- TOP DROP LOCATION
-- -----------------------------------------------
 
SELECT
    drop_location,
    COUNT(*) AS drop_count
FROM uber_rides
WHERE booking_status = 'Completed'
GROUP BY drop_location
ORDER BY drop_count DESC
LIMIT 10;
 
 
-- -----------------------------------------------
-- AVERAGE RATINGS
-- -----------------------------------------------
 
SELECT
    ROUND(AVG(customer_rating), 2) AS avg_customer_rating,
    ROUND(AVG(driver_rating), 2)   AS avg_driver_rating
FROM uber_rides
WHERE booking_status = 'Completed';
 
 
-- -----------------------------------------------
-- REVENUE BY PAYMENT METHOD
-- -----------------------------------------------
 
SELECT
    payment_method,
    ROUND(SUM(booking_value), 2) AS total_revenue,
    COUNT(*) AS transaction_count
FROM uber_rides
WHERE booking_status = 'Completed'
  AND payment_method IS NOT NULL
GROUP BY payment_method
ORDER BY total_revenue DESC;
 
 
-- -----------------------------------------------
-- REVENUE BY CUSTOMER (Top 10)
-- -----------------------------------------------
 
SELECT
    customer_id,
    ROUND(SUM(booking_value), 2) AS total_spend,
    COUNT(*) AS total_rides,
    ROUND(AVG(ride_distance), 2) AS avg_distance
FROM uber_rides
WHERE booking_status = 'Completed'
GROUP BY customer_id
ORDER BY total_spend DESC
LIMIT 10;
 
 
-- -----------------------------------------------
-- CUSTOMER COUNT BY MONTH
-- -----------------------------------------------
 
SELECT
    TO_CHAR(ride_date, 'Mon') AS month_name,
    EXTRACT(MONTH FROM ride_date) AS month_num,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM uber_rides
GROUP BY month_name, month_num
ORDER BY month_num;
 
 
-- -----------------------------------------------
-- CUSTOMERS BY PAYMENT METHOD
-- -----------------------------------------------
 
SELECT
    payment_method,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM uber_rides
WHERE payment_method IS NOT NULL
GROUP BY payment_method
ORDER BY unique_customers DESC;
 
 
-- -----------------------------------------------
-- RIDE CANCELLATION REASONS — BY DRIVER
-- -----------------------------------------------
 
SELECT
    cancel_reason_driver AS cancellation_reason,
    COUNT(*) AS booking_count
FROM uber_rides
WHERE cancelled_by_driver = 1
  AND cancel_reason_driver IS NOT NULL
GROUP BY cancel_reason_driver
ORDER BY booking_count DESC;
 
 
-- -----------------------------------------------
-- RIDE CANCELLATION REASONS — BY CUSTOMER
-- -----------------------------------------------
 
SELECT
    cancel_reason_customer AS cancellation_reason,
    COUNT(*) AS booking_count
FROM uber_rides
WHERE cancelled_by_customer = 1
  AND cancel_reason_customer IS NOT NULL
GROUP BY cancel_reason_customer
ORDER BY booking_count DESC;
 
 
-- -----------------------------------------------
-- INCOMPLETE RIDE REASONS
-- -----------------------------------------------
 
SELECT
    incomplete_ride_reason,
    COUNT(*) AS booking_count
FROM uber_rides
WHERE incomplete_ride = 1
  AND incomplete_ride_reason IS NOT NULL
GROUP BY incomplete_ride_reason
ORDER BY booking_count DESC;
 
