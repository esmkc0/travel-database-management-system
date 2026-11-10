
-- ==================================================
-- TRAVEL DATABASE MANAGEMENT SYSTEM
-- SQL QUERIES
-- Oracle SQL
-- ==================================================


-- ==================================================
-- 1. WHERE - DATA FILTERING
-- ==================================================

-- Find trips starting after June 1, 2026.
SELECT *
FROM trip
WHERE start_date > DATE '2026-06-01';

-- Find visited places with a rating of 5.
SELECT *
FROM trip_place
WHERE rating = 5;

-- Find expenses greater than 100.
SELECT *
FROM expense
WHERE amount > 100;

-- Find all cities located in Poland.
SELECT c.city_name
FROM city c
JOIN country co
    ON c.country_id = co.country_id
WHERE co.country_name = 'Poland';

-- Find places categorized as castles.
SELECT *
FROM place
WHERE place_type = 'Castle';


-- ==================================================
-- 2. JOIN - COMBINING TABLES
-- ==================================================

-- Display trips with their owners.
SELECT
    t.trip_name,
    u.full_name
FROM trip t
JOIN app_user u
    ON t.user_id = u.user_id;

-- Display cities with their countries.
SELECT
    c.city_name,
    co.country_name
FROM city c
JOIN country co
    ON c.country_id = co.country_id;

-- Display places with their cities.
SELECT
    p.place_name,
    c.city_name
FROM place p
JOIN city c
    ON p.city_id = c.city_id;

-- Display trips and their visited places.
SELECT
    t.trip_name,
    p.place_name
FROM trip t
JOIN trip_place tp
    ON t.trip_id = tp.trip_id
JOIN place p
    ON tp.place_id = p.place_id;

-- Display trips with their companions.
SELECT
    t.trip_name,
    c.full_name
FROM trip t
JOIN trip_companion tc
    ON t.trip_id = tc.trip_id
JOIN companion c
    ON tc.companion_id = c.companion_id;


-- ==================================================
-- 3. GROUP BY - DATA AGGREGATION
-- ==================================================

-- Count cities in each country.
SELECT
    co.country_name,
    COUNT(c.city_id) AS city_count
FROM country co
LEFT JOIN city c
    ON co.country_id = c.country_id
GROUP BY co.country_id, co.country_name;

-- Count visited places for each trip.
SELECT
    t.trip_name,
    COUNT(tp.trip_place_id) AS visited_place_count
FROM trip t
LEFT JOIN trip_place tp
    ON t.trip_id = tp.trip_id
GROUP BY t.trip_id, t.trip_name;

-- Calculate total expenses for each trip.
SELECT
    t.trip_name,
    COALESCE(SUM(e.amount), 0) AS total_expense
FROM trip t
LEFT JOIN expense e
    ON t.trip_id = e.trip_id
GROUP BY t.trip_id, t.trip_name;

-- Find the highest place rating for each trip.
SELECT
    t.trip_name,
    MAX(tp.rating) AS max_rating
FROM trip t
LEFT JOIN trip_place tp
    ON t.trip_id = tp.trip_id
GROUP BY t.trip_id, t.trip_name;

-- Count companions for each trip.
SELECT
    t.trip_name,
    COUNT(tc.companion_id) AS companion_count
FROM trip t
LEFT JOIN trip_companion tc
    ON t.trip_id = tc.trip_id
GROUP BY t.trip_id, t.trip_name;


-- ==================================================
-- 4. SUBQUERIES - NESTED QUERIES
-- ==================================================

-- Find trips containing an expense above 100.
SELECT
    t.trip_name
FROM trip t
WHERE t.trip_id IN (
    SELECT e.trip_id
    FROM expense e
    WHERE e.amount > 100
);

-- Find places visited during trip 1.
SELECT
    p.place_name
FROM place p
WHERE p.place_id IN (
    SELECT tp.place_id
    FROM trip_place tp
    WHERE tp.trip_id = 1
);

-- Find trips with more than one visited place.
SELECT
    t.trip_name
FROM trip t
WHERE (
    SELECT COUNT(*)
    FROM trip_place tp
    WHERE tp.trip_id = t.trip_id
) > 1;
