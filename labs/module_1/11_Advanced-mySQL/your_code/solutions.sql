USE sql7356949;

-- Challenge 1
#1

SELECT 	titleauthor.title_id, 
		titleauthor.au_id, 
		titles.advance * titleauthor.royaltyper / 100 AS advance, 
		titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS sales_royalty
FROM titleauthor
LEFT JOIN titles ON titleauthor.title_ID = titles.title_id
LEFT JOIN sales ON titleauthor.title_ID = sales.title_id;

#2

SELECT title_id, au_id, SUM(sales_royalty) AS total_royalty, advance
FROM (
	SELECT 	titleauthor.title_id, 
			titleauthor.au_id,
			titles.advance * titleauthor.royaltyper / 100 AS advance,
			titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS sales_royalty
	FROM titleauthor
	LEFT JOIN titles ON titleauthor.title_ID = titles.title_id
	LEFT JOIN sales ON titleauthor.title_ID = sales.title_id
	) titles_authors_royalties
	GROUP BY title_id, au_id;

#3

SELECT au_id, SUM(total_royalty+advance) AS profits
FROM(
	SELECT title_id, au_id, SUM(sales_royalty) AS total_royalty, advance
	FROM (
		SELECT 	titleauthor.title_id, 
				titleauthor.au_id,
				titles.advance * titleauthor.royaltyper / 100 AS advance,
				titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS sales_royalty
		FROM titleauthor
		LEFT JOIN titles ON titleauthor.title_ID = titles.title_id
		LEFT JOIN sales ON titleauthor.title_ID = sales.title_id
		) titles_authors_royalties
	GROUP BY title_id, au_id
	) authors_profits
GROUP BY au_id
ORDER BY profits DESC
LIMIT 3;

-- Challenge 2

#1

CREATE TEMPORARY TABLE titles_authors_royalties_temp
SELECT 	titleauthor.title_id, 
		titleauthor.au_id,
		titles.advance * titleauthor.royaltyper / 100 AS advance,
		titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS sales_royalty
FROM titleauthor
LEFT JOIN titles ON titleauthor.title_ID = titles.title_id
LEFT JOIN sales ON titleauthor.title_ID = sales.title_id;

#2

CREATE TEMPORARY TABLE authors_profits_temp
SELECT title_id, au_id, SUM(sales_royalty) AS total_royalty, advance
FROM titles_authors_royalties_temp
GROUP BY title_id, au_id, advance;

#3

SELECT au_id, SUM(total_royalty + advance) AS profits
FROM authors_profits_temp
GROUP BY au_id
ORDER BY profits DESC
LIMIT 3;

-- Challenge 3

CREATE TABLE most_profiting_authors
SELECT au_id, SUM(total_royalty+advance) AS profits
FROM(
	SELECT title_id, au_id, SUM(sales_royalty) AS total_royalty, advance
	FROM (
		SELECT 	titleauthor.title_id, 
				titleauthor.au_id,
				titles.advance * titleauthor.royaltyper / 100 AS advance,
				titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 AS sales_royalty
		FROM titleauthor
		LEFT JOIN titles ON titleauthor.title_ID = titles.title_id
		LEFT JOIN sales ON titleauthor.title_ID = sales.title_id
		) titles_authors_royalties
	GROUP BY title_id, au_id
	) authors_profits
GROUP BY au_id
ORDER BY profits DESC;