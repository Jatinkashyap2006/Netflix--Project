create database Netflix;
use Netflix;
CREATE TABLE Netflix (
    Show_id VARCHAR(10),
    Type VARCHAR(200),
    Title VARCHAR(500),
    Director VARCHAR(208),
    Cast VARCHAR(771),
    Country VARCHAR(123),
    Date_added VARCHAR(50),
    Release_year VARCHAR(50),
    Rating VARCHAR(10),
    Duration VARCHAR(50),
    Listed_in VARCHAR(79),
    Description VARCHAR(300)
);

-- 10 Business Problems & Solutions

-- 1. List all movies released in a specific year (e.g., 2020)
SELECT 
    *
FROM
    Netflix
WHERE
    Type = 'Movie' AND Release_year = 2020;

-- 2. Find the most common rating for movies and TV shows
SELECT Type,Ratin 
FROM (SELECT Type,Rating,COUNT(*), RANK() OVER(PARTITION BY Type ORDER BY COUNT(*) DESC) AS Ranking 
         FROM Netflix GROUP BY Type,Rating) AS T1 
WHERE Ranking = 1 ;

-- 3. Identify the longest movie
SELECT 
    *
FROM
    Netflix
WHERE
    Type = 'Movie'
        AND Duration = (SELECT 
            MAX(Duration)
        FROM
            Netflix);

-- 4 Find All TV shows release in 2021 
SELECT 
    *
FROM
    Netflix
WHERE
    Type = 'TV Show' AND Release_year = 2021;

-- 5 Find all the movies/TV shows by director 'Mike Flanagan'
SELECT 
    *
FROM
    Netflix
WHERE
    Director LIKE '%Mike Flanagan';

-- 6 List all TV shows with more than 5 seasons
SELECT 
    *
FROM
    Netflix
WHERE
    Type = 'TV Show'
        AND Duration >= '5 Season';

-- 7 count all Movie and TV show
SELECT 
    Type, COUNT(Type) AS Count
FROM
    Netflix
GROUP BY Type;

-- 8. List all movies that are documentaries
SELECT 
    *
FROM
    netflix
WHERE
    Listed_in LIKE '%documentaries%';

-- 9. Find all content without a director
SELECT 
    *
FROM
    Netflix
WHERE
    director IS NULL;

-- 10. Find how many movies actor 'Salman Khan' appeared in last 10 years!
SELECT 
    *
FROM
    netflix
WHERE
    cast LIKE '%Salman Khan%'
        AND release_year > EXTRACT(YEAR FROM (CURRENT_DATE - INTERVAL 10 YEAR));








