#Challenge 1 - Most Profiting Authors

#Step 1

SELECT titles.title_id as 'Title', titleauthor.au_id as 'Author', titles.advance * titleauthor.royaltyper / 100 as 'Advance', titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as 'Sales_Royalty'
FROM titles
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id;

#Step 2

SELECT Title, Author, SUM(Sales_Royalty) as 'Aggregated_royalties'
FROM (SELECT titles.title_id as 'Title', titleauthor.au_id as 'Author', titles.advance * titleauthor.royaltyper / 100 as 'Advance', titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as 'Sales_Royalty'
FROM titles
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id) as summary
GROUP BY Author, Title;

#Step 3

SELECT Author, SUM(Aggregated_advances + Aggregated_royalties) as 'Profit'
FROM (SELECT Title, Author, SUM(Sales_Royalty) as 'Aggregated_royalties', SUM(Advance) as 'Aggregated_advances'
FROM (SELECT titles.title_id as 'Title', titleauthor.au_id as 'Author', titles.advance * titleauthor.royaltyper / 100 as 'Advance', titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as 'Sales_Royalty'
FROM titles
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id) as summary
GROUP BY Author, Title) as summary2
GROUP BY Author
ORDER BY Profit DESC
LIMIT 3;

#Challenge 2 - Alternative Solution

CREATE TEMPORARY TABLE royalty_summary
SELECT titles.title_id as 'Title', titleauthor.au_id as 'Author', titles.advance * titleauthor.royaltyper / 100 as 'Advance', titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as 'Sales Royalty'
FROM titles
INNER JOIN titleauthor
ON titles.title_id = titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id;

#Check table
SELECT * 
FROM royalty_summary;

CREATE TEMPORARY TABLE aggregated_royalties_summary
SELECT Title, Author, SUM(Sales_Royalty) as 'Aggregated_royalties', SUM(Advance) as 'Aggregated_advances'
FROM royalty_summary
GROUP BY Author, Title;

#Check temporary table
SELECT * 
FROM aggregated_royalties_summary;

SELECT Author, SUM(Aggregated_advances + Aggregated_royalties) as 'Profit'
FROM aggregated_royalties_summary
GROUP BY Author
ORDER BY Profit DESC
LIMIT 3;

#Challenge 3

CREATE TABLE most_profiting_authors
SELECT Author, SUM(Aggregated_advances + Aggregated_royalties) as 'Profit'
FROM aggregated_royalties_summary
GROUP BY Author;

#Check table
SELECT *
FROM most_profiting_authors;