USE sql7356949;

-- Challenge 1

SELECT titleauthor.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, titles.title as TITLE, publishers.pub_name as PUBLISHER
FROM titleauthor
LEFT JOIN authors ON titleauthor.au_ID = authors.au_ID
LEFT JOIN titles ON titleauthor.title_ID = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id;


-- Challenge 2

SELECT titleauthor.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, publishers.pub_name as PUBLISHER, COUNT(titleauthor.title_id) as TITLE_COUNT
FROM titleauthor
LEFT JOIN authors ON titleauthor.au_ID = authors.au_ID
LEFT JOIN titles ON titleauthor.title_ID = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY titleauthor.au_id, publishers.pub_name;


-- Challenge 3

SELECT titleauthor.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, SUM(sales.qty) as TOTAL
FROM titleauthor
LEFT JOIN authors ON titleauthor.au_ID = authors.au_ID
LEFT JOIN sales ON titleauthor.title_ID = sales.title_id
GROUP BY titleauthor.au_id
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4

SELECT authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, COALESCE(SUM(sales.qty),0) as TOTAL
FROM authors
LEFT JOIN titleauthor ON titleauthor.au_ID = authors.au_ID
LEFT JOIN sales ON titleauthor.title_ID = sales.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;