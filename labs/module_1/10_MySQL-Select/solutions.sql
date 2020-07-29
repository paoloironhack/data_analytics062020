#CHALLENGE 1 - Who Have Published What At Where?

SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;

#check nr of rows from titleauthor (nr of rows is 25)
SELECT *
FROM titleauthor;

#CHALLENGE 2 - Who Have Published How Many At Where?

SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', publishers.pub_name as 'PUBLISHER', COUNT(titles.title) as 'TITLE COUNT', SUM(COUNT(titles.title)) OVER() AS TOTAL TITLE COUNT
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id;

#Check with count rows (25)
SELECT COUNT(*)
FROM titleauthor;

#CHALLENGE 3 - Best Selling Authors

SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', SUM(sales.qty) as TOTAL
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

#CHALLENGE 4 - Best Selling Authors Ranking

SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', COALESCE(SUM(sales.qty), 0) as TOTAL
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;
