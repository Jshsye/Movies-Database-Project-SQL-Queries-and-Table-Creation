create database movie_details

CREATE TABLE MOVIES (
	POSTER_LINK VARCHAR(100),
	SERIES_TITLE VARCHAR(100),
	RELEASED_YEAR VARCHAR(20),
	CERTIFICATE VARCHAR(30),
	RUNTIME VARCHAR(60),
	GENRE VARCHAR(50),
	IMDB_RATING DECIMAL,
	OVERVIEW VARCHAR(315),
	META_SCORE NUMERIC,
	DIRECTOR VARCHAR(35),
	STAR1 VARCHAR(40),
	STAR2 VARCHAR(100),
	STAR3 VARCHAR(100),
	STAR4 VARCHAR(100),
	NO_OF_VOTES NUMERIC,
	GROSS MONEY
);


select * from movies

--1] changes in character

alter table movies
alter poster_link type varchar(500)


-- 2] fetchd data of movie name, director, released date

select series_title, released_year, director
from movies_NEW


--3] fetchd name , released date, imbd rating with ua certificate

select series_title, released_year, imdb_rating, certificate
from movies_NEW
where certificate='UA'



-- 4] fetchd movie name , genre, with ua certifcate and imdb rating of 8

select series_title, released_year, imdb_rating, certificate, genre
from movies_NEW
where certificate='UA' and imdb_rating>8



select * from movies_NEW


-- 5] fetchd how many movies are in drama genre 

select count(genre)
from movies_NEW
where genre like '%Drama%'


--6] changes in character

alter table movies_new
alter poster_link type varchar(500)


--7] fetchd data of movie name, director, released date

select series_title, released_year, director
from movies_new


-- 8] fetchd name , released date, imbd rating with ua certificate

select series_title, released_year, imdb_rating, certificate
from movies_new
where certificate='UA'


--9] fetchd movie name , genre, with ua certifcate and imdb rating of 8

select series_title, released_year, imdb_rating, certificate, genre
from movies_new
where certificate='UA' and imdb_rating>8


select * from movies_new


--10] fetchd how many movies are in drama genre 

select count(genre)
from movies_new
where genre like '%Drama%'


--11] filtering particular directors film 

select count(*)
from movies_new
where director in ('Quentin Tarantino', 'Steven Spielberg', 'Christopher Nolan', 'Rajkumar Santoshi')


--12] finding all amirkhan movies from the data

select * from movies_new
where star1='Aamir Khan'
or star2='Aamir Khan'
or star3='Aamir Khan' 
or star4='Aamir Khan';


-- 13] displaying the movies where certificate is null

select series_title, certificate
from movies_new
where certificate is null


-- 14] display the movies who recieved certificate

select series_title, certificate
from movies_new
where certificate is not null


--15]  display the movies who recieved certificate other than a & ua

select series_title, certificate
from movies_new
where certificate not in ('A', 'UA')


-- 16] display all movies apart from crime

select series_title, genre
from movies_new
where genre not like '%Crime%'


-- 17] displaying minumum and maximum imdb raiting

SELECT
	MIN(IMDB_RATING) AS MINIMUM_VALUE,
	MAX(IMDB_RATING) AS MAXIMUM_VALUE
FROM
	MOVIES_NEW


-- 18] displaying both min & max in single table

select min(imdb_rating) as Min_value
from movies_new
union
select max(imdb_rating) as Max_value
from movies_new


-- 19] display both min and max with seperate name

SELECT
	MIN(IMDB_RATING) as value,
	'Min_value' AS MIN_MAX
FROM
	MOVIES_NEW
UNION
SELECT
	MAX(IMDB_RATING),
	'max_value'
FROM
	MOVIES_NEW


-- 20] display total certificate group wise

select count(certificate), certificate
from movies_new
where certificate is not null
group by certificate


-- 21] displaying total certificate above 120

select count(certificate), certificate
from movies_new
group by certificate
having count(certificate)>120


-- 22] displaying counts total count of A,UA,PG-13 CERTIFICATE

SELECT
	COUNT(CERTIFICATE),
	CERTIFICATE
FROM
	MOVIES_NEW
WHERE
	CERTIFICATE IN ('A', 'UA', 'PG-13')
GROUP BY
	CERTIFICATE


-- 23] SHOWING TOTAL AMOUNT OF CRIME, ACTION GENRE MOVIES

SELECT
	SUM(GROSS),
	'Crime'
FROM
	MOVIES_NEW
WHERE
	GENRE LIKE '%Crime%'
UNION
SELECT
	SUM(GROSS),
	'Action'
FROM
	MOVIES_NEW
WHERE
	GENRE LIKE '%Action%'

select * from movies_new


-- 24] using substring function

select series_title, substring(series_title, 1,8)
from movies_new


-- 25] seperating first words from series title

SELECT
	SERIES_TITLE,
	SUBSTRING(SERIES_TITLE, 1, STRPOS(SERIES_TITLE, ' '))
FROM
	MOVIES_NEW


-- 26] seperate last letter from series title (it involved space)

SELECT
	SERIES_TITLE,
	SUBSTRING(SERIES_TITLE, STRPOS(SERIES_TITLE, ' '))
FROM
	MOVIES_NEW


-- 27] seperate last name in series title (without space)

SELECT
	SERIES_TITLE,
	SUBSTRING(
		SERIES_TITLE,
		STRPOS(SERIES_TITLE, ' ') + 1,
		LENGTH(SERIES_TITLE) - STRPOS(SERIES_TITLE, ' ')
	) as New_data FROM
	MOVIES_NEW



