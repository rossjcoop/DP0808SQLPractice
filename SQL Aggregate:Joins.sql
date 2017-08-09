#1Get the average rating for a movie
#2Get the total ratings for a movie
#3Get the total movies for a genre
#4Get the average rating for a user
#5Find the user with the most ratings
#6Find the user with the highest average rating
#7Find the user with the highest average rating with more than 50 reviews
#8Find the movies with an average rating over 4
#9For each genre find the total number of reviews as well as the average review sort by highest average review.
#10Find all comedies
#11Find all comedies in the year 2000
#12Find any movies that are about death and are a comedy
#13Find any movies from either 2001 or 2002 with a title containing super

#/////////////////////////////////////////////////////////////

#1

SELECT 
    m.title, m.movieid, AVG(r.rating) AS AvgRating
FROM
    ratings r
        JOIN
    movies m ON m.movieid = r.movieid
WHERE
    r.movieid = '25';
    
#GREAT MOVIE BTW


#2///////////////////////////////////////////////////////////

SELECT 
    m.title, m.movieid, COUNT(r.rating) AS RatingCounts
FROM
    ratings r
        JOIN
    movies m ON m.movieid = r.movieid
WHERE
    r.movieid = '25';


#3////////////////////////not sure if this one is accurate, probably counts duplicate movies.....

SELECT 
    g.genres, mg.genre_id, COUNT(m.movieid) AS MovieCounts
FROM
    movie_genre mg
        JOIN
    movies m ON m.movieid = mg.movieid
        JOIN
    genre g ON mg.genre_id = g.id
WHERE
    mg.genre_id = '2';


#4/////////////////////////////////////////////////////////////


SELECT 
    r.userid, AVG(r.rating) AS AvgRating
FROM
    ratings r
   
WHERE
    r.userid = '2';


#5/////////////////////////////////////////////////////////////


SELECT 
    COUNT(r.rating) AS TotalRatings, r.userid
FROM
    ratings r
GROUP BY r.userid 
ORDER BY COUNT(r.rating) DESC
LIMIT 1;


#6/////////////////////////////////////////////////////////////


SELECT 
    AVG(r.rating) AS AvgRatings, r.userid
FROM
    ratings r
GROUP BY r.userid 
ORDER BY AVG(r.rating) DESC
LIMIT 1;


#7////////////////////////////////////////////////////////////


SELECT 
    r.userid,
    AVG(r.rating) AS AvgRatings,
    COUNT(r.rating) AS RaitingCount
FROM
    ratings r
GROUP BY r.userid
HAVING COUNT(r.rating)>=50
ORDER BY AVG(r.rating) DESC
LIMIT 1;


#8/////////////////////////////////////////////////////////////


SELECT 
    m.movieid, m.title, AVG(r.rating) AS AvgRatings
FROM
    ratings r
        JOIN
    movies m ON m.movieid = r.movieid
GROUP BY m.title
HAVING AVG(r.rating) >= 4
ORDER BY AVG(r.rating) ASC


#9////////////////////////////////////////////////////////////


SELECT 
    g.genres,
    g.id,
    COUNT(r.rating) AS RatingCount,
    AVG(r.rating) AS AverageCount
FROM
    movies m
        JOIN
    movie_genre mg ON mg.movieid = m.movieid
        JOIN
    ratings r ON r.movieid = m.movieid
        JOIN
    genre g ON g.id = mg.genre_id
WHERE
    m.movieid < 100
GROUP BY g.id
ORDER BY AVG(r.rating) DESC






#10/////////////////////////////////////////////////////////////


SELECT 
    m.movieid, m.title, g.genres, g.id
FROM
    movies m
        JOIN
    movie_genre mg ON mg.movieid = m.movieid
        JOIN
    genre g ON g.id = mg.genre_id
WHERE
    g.id = 2



#11//////////////////////////////////////////////////////////////


SELECT 
    m.movieid, m.title, g.genres, g.id
FROM
    movies m
        JOIN
    movie_genre mg ON mg.movieid = m.movieid
        JOIN
    genre g ON g.id = mg.genre_id
WHERE
    g.id = 2 AND m.title LIKE '%2000%'



#12//////////////////////////////////////////////////////////////


SELECT 
    m.movieid, m.title, g.genres, t.tag, g.id
FROM
    movies m
        JOIN
    movie_genre mg ON mg.movieid = m.movieid
        JOIN
    genre g ON g.id = mg.genre_id
		JOIN
	tags t ON t.movieid = m.movieid
	
WHERE
    g.id = 2 AND t.tag LIKE '%death%'


#13//////////////////////////////////////////////////////////////


SELECT 
    m.title
FROM
    movies m
WHERE
    (m.title LIKE '%2001%'
        OR m.title LIKE '%2002%')
        AND m.title LIKE '%super%';


		





