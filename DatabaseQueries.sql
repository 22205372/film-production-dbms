// Film Performance Overview (Actors + Budget)
SELECT f.title,
       f.budget,
       COUNT(fc.actor_id) AS total_actors
FROM films f
LEFT JOIN film_cast fc ON f.film_id = fc.film_id
GROUP BY f.title, f.budget
ORDER BY f.budget DESC;

// Total Production Cost (Crew Salaries per Film)
SELECT f.title,
       SUM(c.salary) AS total_salary_cost
FROM films f
JOIN film_crew fc ON f.film_id = fc.film_id
JOIN crew c ON fc.crew_id = c.crew_id
GROUP BY f.title
ORDER BY total_salary_cost DESC;

// Most Active Locations (Number of Shoots)
SELECT l.location_name,
       l.city,
       COUNT(s.schedule_id) AS total_shoots
FROM locations l
JOIN schedules s ON l.location_id = s.location_id
GROUP BY l.location_name, l.city
ORDER BY total_shoots DESC;

// Films Above Average Budget
SELECT title, budget
FROM films
WHERE budget > (SELECT AVG(budget) FROM films)
ORDER BY budget DESC;

// Daily Shooting Schedule Report
SELECT f.title,
       s.shoot_date,
       s.start_time,
       s.end_time,
       l.location_name
FROM schedules s
JOIN films f ON s.film_id = f.film_id
JOIN locations l ON s.location_id = l.location_id
ORDER BY s.shoot_date;

// Number of Crew Members per Film
SELECT f.title,
       COUNT(fc.crew_id) AS total_crew
FROM films f
LEFT JOIN film_crew fc ON f.film_id = fc.film_id
GROUP BY f.title
ORDER BY total_crew DESC;

// Actor Participation Across Films
SELECT a.first_name || ' ' || a.last_name AS actor_name,
       COUNT(fc.film_id) AS films_participated
FROM actors a
JOIN film_cast fc ON a.actor_id = fc.actor_id
GROUP BY actor_name
ORDER BY films_participated DESC;
