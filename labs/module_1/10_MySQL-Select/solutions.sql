show databases;
use publications;
show tables;
select * from titleauthor;
select * from titles;
select*from publishers;
select*from authors;
SELECT * FROM sales;

# CHALLENGE 1
SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, titles.title AS TITLE, publishers.pub_name AS PUBLISHER FROM publications.authors
LEFT JOIN publications.titleauthor 
ON authors.au_id = titleauthor.au_id

LEFT JOIN publications.titles
ON titleauthor.title_id = titles.title_id

INNER JOIN publications.publishers
ON titles.pub_id = publishers.pub_id
ORDER BY AUTHOR_ID asc;

# CHALLENGE 2

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, publishers.pub_name AS PUBLISHER, count(titles.title) AS TITLE_COUNT FROM publications.authors
LEFT JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id

LEFT JOIN publications.titles
ON titleauthor.title_id = titles.title_id

INNER JOIN publications.publishers
ON titles.pub_id = publishers.pub_id
GROUP BY AUTHOR_ID,LAST_NAME,FIRST_NAME,PUBLISHER
ORDER BY AUTHOR_ID DESC;

# CHALLENGE 3

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, SUM(qty) AS TOTAL FROM publications.authors 
LEFT JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id

INNER JOIN publications.sales
ON titleauthor.title_id = sales.title_id
GROUP BY LAST_NAME, FIRST_NAME
ORDER BY TOTAL DESC
LIMIT 3;

# CHALLENGE 4

select AUTHOR_ID, LAST_NAME, FIRST_NAME, COALESCE(TOTAL,0) AS TOTAL_WITH_ZEROS
from (SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, SUM(qty) AS TOTAL FROM publications.authors 
LEFT JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id

LEFT JOIN publications.sales
ON titleauthor.title_id = sales.title_id
GROUP BY LAST_NAME, FIRST_NAME
ORDER BY TOTAL DESC) as xxx;

