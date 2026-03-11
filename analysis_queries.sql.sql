-- Total number of records in the dataset

SELECT COUNT(*) AS total_records
FROM developer_survey;


-- Top 10 programming languages by number of developers

SELECT language,
COUNT(*) AS developers
FROM developer_survey
GROUP BY language
ORDER BY developers DESC
LIMIT 10;

-- Countries with the most developers

SELECT country,
COUNT(*) AS developers
FROM developer_survey
GROUP BY country
ORDER BY developers DESC
LIMIT 10;

-- Average years of coding experience

SELECT AVG(years_code) AS average_experience
FROM developer_survey;


-- Average developer experience for each language

SELECT language,
AVG(years_code) AS avg_experience
FROM developer_survey
GROUP BY language
ORDER BY avg_experience DESC;

-- Rank languages based on number of developers

SELECT language,
COUNT(*) AS users,
RANK() OVER (ORDER BY COUNT(*) DESC) AS popularity_rank
FROM developer_survey
GROUP BY language;

-- Most popular programming language in each country

SELECT country ,
language,
users
FROM
(
SELECT country ,
language,
COUNT(*) AS users ,
RANK() OVER (PARTITION BY country ORDER BY COUNT(*) DESC) AS  rnk
FROM developer_survey 
GROUP BY country , language 
) AS ranked
WHERE rnk =  1 ;


-- Top 3 programming languages used in each country

SELECT country, language, users
FROM (
SELECT country,
language,
COUNT(*) AS users,
DENSE_RANK() OVER (PARTITION BY country ORDER BY COUNT(*) DESC) AS rank
FROM developer_survey
GROUP BY country, language
) ranked
WHERE rank <= 3;

-- Countries with highest average coding experience

SELECT country,
AVG(years_code) AS avg_experience
FROM developer_survey
GROUP BY country
ORDER BY avg_experience DESC
LIMIT 10;


-- Top countries using a Common Table Expression

WITH country_counts AS (
SELECT country,
COUNT(*) AS developers
FROM developer_survey
GROUP BY country
)
SELECT *
FROM country_counts
ORDER BY developers DESC
LIMIT 5;

