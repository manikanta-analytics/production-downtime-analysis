-- Production Downtime Analysis
-- Database: MySQL

-- 1. View the data
SELECT *
FROM production_downtime;

-- 2. Total downtime
SELECT SUM(downtime_minutes) AS total_downtime
FROM production_downtime;

-- 3. Downtime by machine
SELECT
    machine_id,
    SUM(downtime_minutes) AS total_downtime
FROM production_downtime
GROUP BY machine_id
ORDER BY total_downtime DESC;

-- 4. Downtime by shift
SELECT
    shift,
    SUM(downtime_minutes) AS total_downtime
FROM production_downtime
GROUP BY shift
ORDER BY total_downtime DESC;

-- 5. Failure count by machine
SELECT
    machine_id,
    COUNT(*) AS failure_count
FROM production_downtime
WHERE failure_status = 'Failure'
GROUP BY machine_id
ORDER BY failure_count DESC;
