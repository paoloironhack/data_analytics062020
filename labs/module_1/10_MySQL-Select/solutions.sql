SELECT authors.au_id AS 'AUTHOR ID', au_lname as 'LAST NAME', au_fname AS 'FIRST NAME',
title AS 'TITLE', pub_name as 'PUBLISHER'
FROM authors

JOIN titleauthor on authors.au_id = titleauthor.au_id
JOIN titles on titleauthor.title_id = titles.title_id
JOIN publishers on publishers.pub_id = titles.pub_id;

SELECT authors.au_id AS 'AUTHOR ID', au_lname as 'LAST NAME', au_fname AS 'FIRST NAME', pub_name as 'PUBLISHER',
COUNT(title) AS 'TITLE COUNT'
FROM authors

JOIN titleauthor on authors.au_id = titleauthor.au_id
JOIN titles on titleauthor.title_id = titles.title_id
JOIN publishers on publishers.pub_id = titles.pub_id

GROUP BY authors.au_id, publishers.pub_id;

SELECT authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', SUM(qty) as 'TOTAL'
FROM titles
JOIN sales on sales.title_id = titles.title_id
JOIN titleauthor on titleauthor.title_id = titles.title_id
JOIN authors on titleauthor.au_id = authors.au_id
GROUP BY titles.title_id, authors.au_id

ORDER BY SUM(qty) DESC
LIMIT 3;

SELECT authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', SUM(qty) as 'TOTAL'
FROM titles
JOIN sales on sales.title_id = titles.title_id
JOIN titleauthor on titleauthor.title_id = titles.title_id
JOIN authors on titleauthor.au_id = authors.au_id
GROUP BY titles.title_id, authors.au_id

ORDER BY SUM(qty) DESC;
