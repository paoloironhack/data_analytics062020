/* Challenge #1 */
USE Publications;

SELECT titles.title AS 'TITLE', authors.au_id AS 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname AS 'FIRST NAME', publishers.pub_name as 'PUBLISHER'
FROM `authors`
INNER JOIN `titleauthor`
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;

/* Challende #2 */

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname AS 'FIRST NAME', publishers.pub_name as 'PUBLISHER',
COUNT(title) AS 'COUNT'
FROM authors
JOIN titleauthor on authors.au_id = titleauthor.au_id
JOIN titles on titleauthor.title_id = titles.title_id
JOIN publishers on publishers.pub_id = titles.pub_id

GROUP BY authors.au_id, publishers.pub_id
ORDER BY COUNT DESC;

/* Challenge #3 */

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname AS 'FIRST NAME', SUM(sales.qty) as 'TOTAL'
FROM authors
JOIN titleauthor on authors.au_id = titleauthor.au_id
JOIN titles on titleauthor.title_id = titles.title_id
JOIN sales on titles.title_id = sales.title_id

GROUP BY titles.title_id, authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

/* Challenge #4 */

SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname AS 'FIRST NAME', coalesce(SUM(sales.qty),0) as 'TOTAL'
FROM authors
JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
JOIN titles 
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales 
ON titles.title_id = sales.title_id

GROUP BY titles.title_id, authors.au_id
ORDER BY TOTAL DESC;


/* Hoi Elke, 
Goed gedaan, vergeet niet je joins te specificeren, meestal kun je een LEFT join gebruiken, je hebt
met de opdracht niet laten zien of je dit beheers. maar ik zie het door de vingers als we afspreken dat
jij nog even de verschillende type joins bestudeerd. is dat ok? */
