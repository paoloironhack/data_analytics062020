--step 1

SELECT titles.title_id AS 'TITLE', au_id AS 'AUTHOR', (titles.advance * titleauthor.royaltyper / 100) AS 'ADVANCE', (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'ROYALTIES'

fROM titleauthor

JOIN titles ON titles.title_id = titleauthor.title_id
JOIN sales ON sales.title_id = titles.title_id;

--step 2

SELECT TITLE, AUTHOR, SUM(ROYALTIES) FROM

(SELECT titles.title_id AS 'TITLE', au_id AS 'AUTHOR', (titles.advance * titleauthor.royaltyper / 100) AS 'ADVANCE', (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'ROYALTIES'

fROM titleauthor

JOIN titles ON titles.title_id = titleauthor.title_id
JOIN sales ON sales.title_id = titles.title_id) AS CALCULATIONS

GROUP BY AUTHOR, TITLE;

--step 3
SELECT AUTHOR, SUM(ROYALTIES) + SUM(ADVANCE) AS 'TOTAL' FROM
(SELECT titles.title_id AS 'TITLE', au_id AS 'AUTHOR',
  (titles.advance * titleauthor.royaltyper / 100) AS 'ADVANCE',
  (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'ROYALTIES'
  FROM titleauthor
  JOIN titles ON titles.title_id = titleauthor.title_id
  JOIN sales ON sales.title_id = titles.title_id) AS CALCULATIONS

GROUP BY AUTHOR
ORDER BY TOTAL DESC
LIMIT 3;

--Challenge 2:
--Step 1

CREATE TEMPORARY TABLE publications.test_sales SELECT titles.title_id AS 'TITLE', au_id AS 'AUTHOR', (titles.advance * titleauthor.royaltyper / 100) AS 'ADVANCE', (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'ROYALTIES'

fROM titleauthor
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN sales ON sales.title_id = titles.title_id;

--Step 2

CREATE TEMPORARY TABLE publications.sales_summary
SELECT titles.title_id AS 'TITLE', au_id AS 'AUTHOR', (titles.advance * titleauthor.royaltyper / 100) AS 'ADVANCE', (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'ROYALTIES'

fROM titleauthor
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN sales ON sales.title_id = titles.title_id;

SELECT TITLE, AUTHOR, SUM(ROYALTIES) FROM publications.sales_summary
GROUP BY AUTHOR, TITLE;

--Step 3



CREATE TEMPORARY TABLE publications.sales_summary
SELECT titles.title_id AS 'TITLE', au_id AS 'AUTHOR', (titles.advance * titleauthor.royaltyper / 100) AS 'ADVANCE', (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'ROYALTIES'

fROM titleauthor

JOIN titles ON titles.title_id = titleauthor.title_id
JOIN sales ON sales.title_id = titles.title_id;

SELECT AUTHOR, SUM(ROYALTIES) + SUM(ADVANCE) AS 'TOTAL' FROM publications.sales_summary
GROUP BY AUTHOR
ORDER BY TOTAL DESC
LIMIT 3;


--Challenge 3

create table publications.most_protfiting_authors


SELECT AUTHOR AS 'au_id', SUM(ROYALTIES) + SUM(ADVANCE) AS 'profits' FROM
(SELECT titles.title_id AS 'TITLE', au_id AS 'AUTHOR',
  (titles.advance * titleauthor.royaltyper / 100) AS 'ADVANCE',
  (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'ROYALTIES'
  FROM titleauthor
  JOIN titles ON titles.title_id = titleauthor.title_id
  JOIN sales ON sales.title_id = titles.title_id) AS CALCULATIONS

GROUP BY AUTHOR;
