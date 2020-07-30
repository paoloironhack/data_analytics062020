

#CHALLENGE 1
SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
FROM (((authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id)
INNER JOIN titles
ON titleauthor.title_id = titles.title_id)
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id);


#check no. of rows from titleauthor (no. of rows is 25)
SELECT Count(*)
FROM titleauthor;


#CHALLENGE 2

SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', publishers.pub_name as 'PUBLISHER', COUNT(titles.title) as 'TITLECOUNT'
FROM (((authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id)
INNER JOIN titles
ON titleauthor.title_id = titles.title_id)
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id)
GROUP BY authors.au_id,authors.au_lname,authors.au_fname,publishers.pub_name
ORDER BY authors.au_id DESC;


#CHECK IF OUTPUT IS CORRECT

Select sum(TITLECOUNT) from (SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', publishers.pub_name as 'PUBLISHER', COUNT(titles.title) as 'TITLECOUNT'
FROM (((authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id)
INNER JOIN titles
ON titleauthor.title_id = titles.title_id)
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id)
GROUP BY authors.au_id,authors.au_lname,authors.au_fname,publishers.pub_name
ORDER BY authors.au_id DESC) AS TOTAL;
SELECT Count(*)
FROM titleauthor;

#CHALLENGE 3

Select authors.au_id as 'Author ID' , authors.au_fname as 'FIRST NAME' , authors.au_lname as 'LAST NAME' , sum(qty) as TOTAL from authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY  authors.au_id
ORDER BY TOTAL DESC LIMIT 3 ;

#challenge 4
SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', COALESCE(SUM(sales.qty), 0) as TOTAL
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;














