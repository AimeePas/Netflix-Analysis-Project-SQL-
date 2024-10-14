-- 1. NETFLIX PROJECT
SELECT *
FROM NETFLIX;

SELECT COUNT(*) as total_content FROM NETFLIX;

-- 2. Dinstinct types

SELECT DISTINCT type
FROM NETFLIX;

-- 3. Dinstinct directors

SELECT DISTINCT director
FROM NETFLIX;

-- 4. Number of Movies vs Shows

SELECT type,
COUNT(*)as total_content
FROM NETFLIX
GROUP BY type
;

-- 5. Most Common Rating for Movies and TV Shows
SELECT 
type,
rating
FROM(
SELECT 
type,
rating,
COUNT(*),
RANK() OVER(PARTITION BY type ORDER BY COUNT(*)DESC) as ranking
FROM NETFLIX
GROUP BY 1,2) as t10 
WHERE
ranking = 1

--6. List of Movies Released in Year 2021
SELECT *
FROM NETFLIX
WHERE 
release_year = '2020' AND
type ='Movie'

-- 7. Identify the Longest Movie 
SELECT *
FROM NETFLIX
WHERE 
    type = 'Movie'
AND 
    CAST(SUBSTR(duration, 1, INSTR(duration, ' ') - 1) AS INTEGER) = (
        SELECT MAX(CAST(SUBSTR(duration, 1, INSTR(duration, ' ') - 1) AS INTEGER)) 
        FROM NETFLIX 
        WHERE type = 'Movie'
    );

-- 8. Movies/TV Shows Directed by 'Kirsten Johnson'
SELECT DISTINCT *
FROM NETFLIX
WHERE director LIKE 'Kirsten Johnson';

--9.  List of TV Shows with More Than 5 Seasons
SELECT *, 
       CAST(SUBSTR(duration, 1, INSTR(duration, ' ') - 1) AS INTEGER) AS sessions
FROM NETFLIX
WHERE type = 'TV Show' 
  AND CAST(SUBSTR(duration, 1, INSTR(duration, ' ') - 1) AS INTEGER) > 5;

-- 10. Count of Content Items for Each rating
SELECT 
    rating,
    COUNT(show_id) AS c
FROM 
    NETFLIX
GROUP BY 
    rating
ORDER BY 
    c DESC;

-- 11. Highest Average Numbers of Content Released in any 5 Years in United Kingdom

SELECT release_year,
COUNT(*) as count,
 (COUNT(*) * 1.0 / (SELECT COUNT(*) FROM NETFLIX WHERE country = 'United Kingdom')) * 100 AS percentage
FROM 
    NETFLIX
WHERE 
      country LIKE '%United Kingdom%' 
      GROUP BY 1 
      ORDER BY count DESC
      LIMIT 5
-- 12.  List of Movies that are Documentaries
SELECT type,
listed_in ,
COUNT(*) as count
FROM NETFLIX
WHERE  listed_in LIKE '%Documentaries%'

-- 13. Content Without a Director

SELECT * 
FROM NETFLIX
WHERE director = ''

-- 14. Count of Movies Featuring Actor 'Kevin Hart' in the Last 10 Years
SELECT * 
FROM NETFLIX
WHERE ("casts") LIKE '%Kevin Hart%' 
AND CAST(release_year AS INTEGER) > 2014
GROUP BY show_id




--15. Top 10 Actors with the Highest Number of Movies

WITH RECURSIVE split_actors AS (
    SELECT show_id,title,
           TRIM(SUBSTR(casts, 1, INSTR(casts || ',', ',') - 1)) AS actor,
           SUBSTR(casts, INSTR(casts || ',', ',') + 1) AS remaining
    FROM NETFLIX
    WHERE casts IS NOT NULL 
    GROUP BY show_id

    UNION ALL

    SELECT show_id,title,
           TRIM(SUBSTR(remaining, 1, INSTR(remaining || ',', ',') - 1)),
           SUBSTR(remaining, INSTR(remaining || ',', ',') + 1)
    FROM split_actors
    WHERE remaining != ''
    
)

SELECT DISTINCT actor, Count(*) AS count
FROM split_actors
WHERE actor != ''
GROUP BY actor
ORDER BY count DESC;

--16. Categorization of Content Based on Keywords 'Kill' and 'Violence' in the Description and Group them as Good or Bad Content

WITH new_table
AS
(
SELECT 
*,
    CASE
    WHEN 
        LOWER("description") LIKE '%kill%' OR
        LOWER("description") LIKE '%violence%' THEN 'Bad_content'
        ELSE 'Good_Content'
    END category
FROM NETFLIX
GROUP BY show_id)
SELECT category,
COUNT(*) as total_content
FROM new_table
GROUP BY 1

-- 17.  Oldest movies/ shows on Netflix
SELECT title, typee,release_year
FROM NETFLIX
GROUP BY show_id
ORDER BY release_year ASC

