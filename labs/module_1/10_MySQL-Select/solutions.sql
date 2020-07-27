Challenge 1

USE publications;
CREATE TEMPORARY TABLE publications.titleauthor_titlesummary
SELECT titles.title,  titleauthor.au_id, titleauthor.title_id, titles.pub_id
FROM titleauthor
RIGHT JOIN titles
ON titleauthor.title_id = titles.title_id

UNION

SELECT titles.title,  titleauthor.au_id,titleauthor.title_id, titles.pub_id
FROM titleauthor
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id;
CREATE TEMPORARY TABLE publications.author_details
SELECT authors.au_id, authors.au_lname,authors.au_fname, publications.titleauthor_titlesummary.title_id, publications.titleauthor_titlesummary.pub_id, publications.titleauthor_titlesummary.title
FROM publications.titleauthor_titlesummary
LEFT JOIN authors
ON authors.au_id = publications.titleauthor_titlesummary.au_id;
CREATE TEMPORARY TABLE publications.all_details
SELECT publications.author_details.au_id, publications.author_details.au_lname, publications.author_details.au_fname, publications.author_details.title_id, publications.author_details.pub_id, publications.author_details.title, publishers.pub_name
FROM publications.author_details
LEFT JOIN publishers
ON publishers.pub_id = publications.author_details.pub_id;
DELETE FROM publications.all_details WHERE au_id IS NULL;
SELECT * FROM publications.all_details;

Challenge 2:
USE publications;
SELECT au_id,  pub_id, COUNT(*)
FROM publications.all_details GROUP BY au_id, pub_id;

Challenge 3:
USE publications;
CREATE TEMPORARY TABLE publications.authors_itemssold
SELECT publications.all_details. au_id, publications.all_details .au_lname, publications.all_details .au_fname, sales.qty
FROM publications.all_details
LEFT JOIN sales
ON sales.title_id = publications.all_details.title_id;
CREATE TEMPORARY TABLE publications.topthree
SELECT * FROM publications.authors_itemssold
GROUP BY qty
ORDER BY qty DESC
LIMIT 3;
SELECT * FROM publications.topthree

Challenge 4:
USE publications;
UPDATE publications.authors_itemssold SET qty=0 WHERE qty is null;
SELECT * FROM  publications.authors_itemssold
GROUP BY qty
ORDER BY qty DESC;

