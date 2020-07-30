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

#[tjerk]
# this query is longer than needed and hard to read for your colleagues
# it was probably a lot of work to come up with it but i advice you to
# make more compact queries
# a temporary table is not needed
# please study and run this solution, also change some values and see what happens:
# then remove it and try to reproduce the query, let me know how this worked out for you

# SELECT a.au_id AS AuthorID, a.au_lname AS LastName, a.au_fname AS FirstName, t.title AS Title, p.pub_name AS Publisher
# FROM publications.authors a
# INNER JOIN publications.titleauthor ta ON ta.au_id = a.au_id
# INNER JOIN publications.titles t ON ta.title_id = t.title_id
# INNER JOIN publications.publishers p ON p.pub_id = t.pub_id
# ORDER BY AuthorID ASC;

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

#[tjerk]
# great job, you can do it without the temp table also, check the solutions when we publish it to see how

Challenge 4:
USE publications;
UPDATE publications.authors_itemssold SET qty=0 WHERE qty is null;
SELECT * FROM  publications.authors_itemssold
GROUP BY qty
ORDER BY qty DESC;

# [tjerk]
# yes, i think this works also! But
# the idea was to calculate it
# solution:
# Challenge 4
SELECT a.au_id AS AuthorID, a.au_lname AS LastName, a.au_fname AS FirstName, IFNULL(SUM(s.qty),0) AS Total
FROM publications.authors a
LEFT JOIN publications.titleauthor ta ON ta.au_id = a.au_id
LEFT JOIN publications.sales s ON s.title_id = ta.title_id
GROUP BY AuthorID
ORDER BY Total DESC, AuthorID DESC;


# [tjerk]
# please don't share the solutions since 3 students still have to hand in their work, ok?

# overall great job, but try to only use temp tables when you cannot solve it without

# tip: study the solutions and do the lab again if you find some time
# i review this as done since you worked hard on it and the results of your queries are good enough miss supervisor.


