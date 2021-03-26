--1.
--1793
select count(*) from data_analyst_jobs;

--2.
-- ExxonMobil
select * from data_analyst_jobs
limit 10;

--3.
-- Tennessee - 21
-- TN or KY - 27
select count(company) 
from data_analyst_jobs
where location in ('TN', 'KY');

--4.
-- 3
select count(company) 
from data_analyst_jobs
where star_rating > 4
and location = 'TN';

--5.
--151
select count(company)
from data_analyst_jobs
where review_count between 500 and 1000;

--6.
-- Nebraska
select round(avg(star_rating),2) as avg_rating, location
from data_analyst_jobs
where location is not null
and star_rating is not null
group by location
order by avg_rating desc;

--7.
--881
select count(title) as number_of_titles, title
from data_analyst_jobs
group by title
order by number_of_titles desc;

--8.
--230
select location, count(distinct(title)) as unique_jobs
from data_analyst_jobs
where location = 'CA'
group by location;

--9.
--40
select company, round(avg(star_rating),2) as ratings
from data_analyst_jobs
where review_count > 5000
and company is not null
and star_rating is not null
group by company
order by ratings desc;

--10.
--Unilever - 4.20 Stars
select company, round(avg(star_rating),2) as ratings
from data_analyst_jobs
where review_count > 5000
and company is not null
and star_rating is not null
group by company
order by ratings desc;

--11.
--774
select distinct(title)as unique_analyst_jobs
from data_analyst_jobs
where title like '%Analyst%';

select count(distinct(title)) as unique_analyst_jobs
from data_analyst_jobs
where title ilike '%Analyst%';

--12.
--4 - They are all Tableau positions
select count(distinct(title)) as unique_analyst_jobs
from data_analyst_jobs
where title like '%Analyst%'
or title like '%Analytics%';

select distinct(title) as unique_analyst_jobs
from data_analyst_jobs
where title like '%Analyst%'
or title like '%Analytics%';

SELECT distinct(title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
AND title NOT ILIKE '%Analytics%';

--BONUS
--
--
SELECT DISTINCT(domain) AS industry,
COUNT(title) AS num_of_hard_to_fill_jobs,
MAX(skill) AS skill,
AVG(days_since_posting) AS days_since_posting
FROM data_analyst_jobs
WHERE domain IS NOT NULL
AND skill LIKE '%SQL%'
AND days_since_posting > 21
GROUP BY domain
ORDER BY num_of_hard_to_fill_jobs DESC;
