-- ============================================
-- PRODUCTION DOWNTIME ANALYSIS
-- ============================================


-- 1. View all records
SELECT *
FROM production_downtime;


-- 2. Total production records
SELECT COUNT(*) AS total_production_records
FROM production_downtime;


-- 3. Total production quantity
SELECT
    SUM(production_qty) AS total_production
FROM production_downtime;


-- 4. Total downtime
SELECT
    ROUND(SUM(downtime_hours), 2) AS total_downtime_hours
FROM production_downtime;


-- 5. Total planned hours
SELECT
    ROUND(SUM(planned_hours), 2) AS total_planned_hours
FROM production_downtime;


-- 6. Total operating hours
SELECT
    ROUND(SUM(operating_hours), 2) AS total_operating_hours
FROM production_downtime;


-- 7. Total maintenance cost
SELECT
    SUM(maintenance_cost) AS total_maintenance_cost
FROM production_downtime;


-- 8. Downtime by machine
SELECT
    machine_id,
    ROUND(SUM(downtime_hours), 2) AS total_downtime_hours
FROM production_downtime
GROUP BY machine_id
ORDER BY total_downtime_hours DESC;


-- 9. Downtime by shift
SELECT
    shift,
    ROUND(SUM(downtime_hours), 2) AS total_downtime_hours
FROM production_downtime
GROUP BY shift
ORDER BY total_downtime_hours DESC;


-- 10. Failure count by machine
SELECT
    machine_id,
    COUNT(*) AS failure_count
FROM production_downtime
WHERE failure_type <> 'No Failure'
GROUP BY machine_id
ORDER BY failure_count DESC;


-- 11. Failure count by failure type
SELECT
    failure_type,
    COUNT(*) AS failure_count
FROM production_downtime
WHERE failure_type <> 'No Failure'
GROUP BY failure_type
ORDER BY failure_count DESC;


-- 12. Downtime by failure type
SELECT
    failure_type,
    ROUND(SUM(downtime_hours), 2) AS total_downtime_hours
FROM production_downtime
WHERE failure_type <> 'No Failure'
GROUP BY failure_type
ORDER BY total_downtime_hours DESC;


-- 13. Maintenance cost by machine
SELECT
    machine_id,
    SUM(maintenance_cost) AS total_maintenance_cost
FROM production_downtime
GROUP BY machine_id
ORDER BY total_maintenance_cost DESC;


-- 14. Downtime by department
SELECT
    Department AS department,
    ROUND(SUM(downtime_hours), 2) AS total_downtime_hours
FROM production_downtime
GROUP BY department
ORDER BY total_downtime_hours DESC;


-- 15. Production quantity by machine
SELECT
    machine_id,
    SUM(production_qty) AS total_production
FROM production_downtime
GROUP BY machine_id
ORDER BY total_production DESC;


-- 16. Utilization by machine
SELECT
    machine_id,
    ROUND(
        SUM(operating_hours) / NULLIF(SUM(planned_hours), 0) * 100,
        2
    ) AS utilization_percentage
FROM production_downtime
GROUP BY machine_id
ORDER BY utilization_percentage DESC;


-- 17. Downtime percentage by machine
    SELECT
        machine_id,
        ROUND(
            SUM(downtime_hours) / NULLIF(SUM(planned_hours), 0) * 100,
            2
        ) AS downtime_percentage
    FROM production_downtime
    GROUP BY machine_id
    ORDER BY downtime_percentage DESC;


-- 18. Monthly downtime trend
SELECT
    YEAR(date) AS year,
    MONTH(date) AS month,
    MONTHNAME(date) AS month_name,
    ROUND(SUM(downtime_hours), 2) AS total_downtime_hours
FROM production_downtime
GROUP BY
    YEAR(date),
    MONTH(date),
    MONTHNAME(date)
ORDER BY
    year,
    month;


-- 19. Monthly production trend
SELECT
    YEAR(date) AS year,
    MONTH(date) AS month,
    MONTHNAME(date) AS month_name,
    SUM(production_qty) AS total_production
FROM production_downtime
GROUP BY
    YEAR(date),
    MONTH(date),
    MONTHNAME(date)
ORDER BY
    year,
    month;


-- 20. Failure count by shift
SELECT
    shift,
    COUNT(*) AS failure_count
FROM production_downtime
WHERE failure_type <> 'No Failure'
GROUP BY shift
ORDER BY failure_count DESC;


-- 21. Downtime and failures by machine
SELECT
    machine_id,
    ROUND(SUM(downtime_hours), 2) AS total_downtime_hours,
    SUM(
        CASE    
            WHEN failure_type <> 'No Failure' THEN 1
            ELSE 0
        END
    ) AS failure_count
FROM production_downtime
GROUP BY machine_id
ORDER BY total_downtime_hours DESC;


-- 22. Machine-wise production, downtime and utilization
    SELECT
        machine_id,
        SUM(production_qty) AS total_production,
        ROUND(SUM(planned_hours), 2) AS planned_hours,
        ROUND(SUM(downtime_hours), 2) AS downtime_hours,
        ROUND(SUM(operating_hours), 2) AS operating_hours,
        ROUND(
            SUM(operating_hours) / NULLIF(SUM(planned_hours), 0) * 100,
            2
        ) AS utilization_percentage
    FROM production_downtime
    GROUP BY machine_id
    ORDER BY downtime_hours DESC;


-- 23. Top 3 machines by downtime
SELECT
    machine_id,
    ROUND(SUM(downtime_hours), 2) AS total_downtime_hours
FROM production_downtime
GROUP BY machine_id
ORDER BY total_downtime_hours DESC
LIMIT 3;


-- 24. Top 3 machines by maintenance cost
SELECT
    machine_id,
    SUM(maintenance_cost) AS total_maintenance_cost
FROM production_downtime
GROUP BY machine_id
ORDER BY total_maintenance_cost DESC
LIMIT 3;


-- 25. Overall failure summary
SELECT
    COUNT(*) AS total_records,
    SUM(
        CASE
            WHEN failure_type <> 'No Failure' THEN 1
            ELSE 0
        END
    ) AS total_failures,
    SUM(
        CASE
            WHEN failure_type = 'No Failure' THEN 1
            ELSE 0
        END
    ) AS no_failure_records
FROM production_downtime;
