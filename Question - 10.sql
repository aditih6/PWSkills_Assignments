-- -----------------------------------------------------------
-- sakila_analysis.sql
-- Data Analysis Queries for Sakila Video Rentals
-- Author: [Your Name]
-- Description: Business insights for management decision-making
-- -----------------------------------------------------------

USE sakila;

-- -----------------------------------------------------------
-- 1️⃣ Top 5 Customers by Total Amount Spent
-- -----------------------------------------------------------
SELECT 
    c.first_name AS FirstName,
    c.last_name AS LastName,
    c.email AS Email,
    SUM(p.amount) AS TotalAmountSpent
FROM 
    customer c
JOIN 
    payment p ON c.customer_id = p.customer_id
GROUP BY 
    c.customer_id
ORDER BY 
    TotalAmountSpent DESC
LIMIT 5;

-- -----------------------------------------------------------
-- 2️⃣ Top 3 Movie Categories by Rental Count
-- -----------------------------------------------------------
SELECT 
    cat.name AS CategoryName,
    COUNT(r.rental_id) AS RentalCount
FROM 
    category cat
JOIN 
    film_category fc ON cat.category_id = fc.category_id
JOIN 
    inventory i ON fc.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    cat.category_id
ORDER BY 
    RentalCount DESC
LIMIT 3;

-- -----------------------------------------------------------
-- 3️⃣ Films Available at Each Store & Films Never Rented
-- -----------------------------------------------------------
SELECT 
    s.store_id,
    COUNT(DISTINCT i.film_id) AS TotalFilms,
    COUNT(DISTINCT i.film_id) 
      - COUNT(DISTINCT r.inventory_id) AS NeverRentedFilms
FROM 
    store s
JOIN 
    inventory i ON s.store_id = i.store_id
LEFT JOIN 
    rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    s.store_id;

-- -----------------------------------------------------------
-- 4️⃣ Total Revenue per Month for the Year 2023
-- -----------------------------------------------------------
SELECT 
    DATE_FORMAT(p.payment_date, '%Y-%m') AS Month,
    SUM(p.amount) AS TotalRevenue
FROM 
    payment p
WHERE 
    YEAR(p.payment_date) = 2023
GROUP BY 
    DATE_FORMAT(p.payment_date, '%Y-%m')
ORDER BY 
    Month;

-- -----------------------------------------------------------
-- 5️⃣ Customers Who Rented More Than 10 Times in the Last 6 Months
-- -----------------------------------------------------------
SELECT 
    c.first_name AS FirstName,
    c.last_name AS LastName,
    c.email AS Email,
    COUNT(r.rental_id) AS TotalRentals
FROM 
    customer c
JOIN 
    rental r ON c.customer_id = r.customer_id
WHERE 
    r.rental_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY 
    c.customer_id
HAVING 
    TotalRentals > 10
ORDER BY 
    TotalRentals DESC;

-- -----------------------------------------------------------
-- ✅ End of Report
-- -----------------------------------------------------------
