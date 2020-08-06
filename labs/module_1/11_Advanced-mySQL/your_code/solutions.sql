/* Lab Advanced, Step 1 */
SELECT titleauthor.au_id AS 'Author ID', titles.title_id AS 'Title ID', (titles.advance * titleauthor.royaltyper / 100) AS 'advance', (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'sales_royalty'
FROM titles
INNER JOIN titleauthor
on titles.title_id = titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id;

/* Lab Advanced, Step 2 */
USE Publications;

SELECT Author, Title, SUM(sales_royalty) as 'Aggregated_Royalties'
FROM (SELECT titleauthor.au_id AS 'Author', titles.title_id AS 'Title', (titles.advance * titleauthor.royaltyper / 100) AS 'advance', (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'sales_royalty'
FROM titles
INNER JOIN titleauthor
on titles.title_id = titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id) as summary
GROUP BY Author, Title
ORDER BY 'Aggregated_Royalties' DESC;

/* Lab Advanced step 3 */
SELECT Author, SUM(Aggregated_Royalties) + SUM(advance) AS 'Profits'
From (SELECT Author, Title, SUM(sales_royalty) as 'Aggregated_Royalties', advance
FROM (SELECT titleauthor.au_id AS 'Author', titles.title_id AS 'Title', (titles.advance * titleauthor.royaltyper / 100) AS 'advance', (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'sales_royalty'
FROM titles
INNER JOIN titleauthor
on titles.title_id = titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id) as summary
GROUP BY Author, Title) as summary
GROUP BY Author, Title
ORDER BY Profits DESC
LIMIT 3;

/* Lab Advanced, Challenge 2, Step 1*/

USE Publications;
CREATE TEMPORARY TABLE royalties_info
SELECT titleauthor.au_id AS 'Author ID', titles.title_id AS 'Title ID', (titles.advance * titleauthor.royaltyper / 100) AS 'advance', (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'sales_royalty'
FROM titles
INNER JOIN titleauthor
on titles.title_id = titleauthor.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id;
SELECT * FROM royalties_info;


/* Lab Advanced, Challenge 2, Step 2 */
CREATE TEMPORARY TABLE aggregation_of_royalties
SELECT Author, Title, SUM(sales_royalty) as 'Aggregated_Royalties', SUM(Advance) as 'Aggregated_Advances'
FROM royalties_info
GROUP BY Author, Title;

/* Lab Advanced, Challenge 2, Step 3 */
CREATE TEMPORARY TABLE final_royalties
SELECT Author, Title, SUM(Aggregated_Royalties) + SUM(Aggregated_Advances) AS 'Profits'
FROM aggregation_of_royalties
GROUP BY Author, Title
ORDER BY Profits DESC
LIMIT 3;
SELECT * FROM final_royalties;

/* Lab Advanced, Challenge 3*/
CREATE TABLE most_profitable_authors
SELECT Author, SUM(Aggregated_Royalties) + SUM(Aggregated_Advances) AS 'Profit'
FROM final_royalties
GROUP BY Author;
SELECT * FROM most_profitable_authors;