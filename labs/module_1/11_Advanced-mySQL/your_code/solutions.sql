SHOW DATABASES;
USE PUBLICATIONS;
SHOW TABLES;
SELECT * FROM SALES;
SELECT * FROM roysched;

#STEP 1 - Calculate the royalty of each sale for each author and the advance for each author and publication
SELECT titleauthor.au_id,titleauthor.title_id, ((titles.advance*titleauthor.royaltyper) / 100) AS advance, ((titles.price * sales.qty * titles.royalty / 100) * (titleauthor.royaltyper / 100)) AS royalty_each_sale FROM
publications.titleauthor

LEFT JOIN publications.titles
ON titles.title_id = titleauthor.title_id

LEFT JOIN publications.sales
ON sales.title_id = titleauthor.title_id;

#Step 2 - Aggregate the total royalties for each title and author

SELECT title_id as TITLE_ID ,au_id as AUTHOR_ID , SUM(advance) as ADVANCE, SUM(royalty_each_sale) AS SALES_ROYALTY FROM (SELECT titleauthor.au_id,titleauthor.title_id, ((titles.advance*titleauthor.royaltyper) / 100) AS advance, ((titles.price * sales.qty * titles.royalty / 100) * (titleauthor.royaltyper / 100)) AS royalty_each_sale FROM
publications.titleauthor

LEFT JOIN publications.titles
ON titles.title_id = titleauthor.title_id

LEFT JOIN publications.sales
ON sales.title_id = titleauthor.title_id) AS total_royalties_for_each
GROUP BY AUTHOR_ID,TITLE_ID;

#STEP 3 - Calculate the total profits of each author

SELECT AUTHOR_ID, (SUM(ADVANCE)+SUM(SALES_ROYALTY)) AS TOTAL_PROFIT FROM (SELECT title_id as TITLE_ID ,au_id as AUTHOR_ID , SUM(advance) as ADVANCE, SUM(royalty_each_sale) AS SALES_ROYALTY FROM (SELECT titleauthor.au_id,titleauthor.title_id, ((titles.advance*titleauthor.royaltyper) / 100) AS advance, ((titles.price * sales.qty * titles.royalty / 100) * (titleauthor.royaltyper / 100)) AS royalty_each_sale
FROM publications.titleauthor

LEFT JOIN publications.titles
ON titles.title_id = titleauthor.title_id

LEFT JOIN publications.sales
ON sales.title_id = titleauthor.title_id) AS total_royalties_for_each
GROUP BY AUTHOR_ID,TITLE_ID	) AS final_values
GROUP BY AUTHOR_ID
ORDER BY TOTAL_PROFIT DESC
LIMIT 3;

#------------------------------------------------------------------------------------------

# CHALLENGE 2 - Alternative Solution with TEMP Tables
# CHALLANGE 2 - STEP 1
CREATE TEMPORARY TABLE AUTHOR_TITLE_ADVANCE_LOYALTY 
SELECT titleauthor.au_id,titleauthor.title_id, ((titles.advance*titleauthor.royaltyper) / 100) AS advance, ((titles.price * sales.qty * titles.royalty / 100) * (titleauthor.royaltyper / 100)) AS royalty_each_sale FROM
publications.titleauthor

LEFT JOIN publications.titles
ON titles.title_id = titleauthor.title_id

LEFT JOIN publications.sales
ON sales.title_id = titleauthor.title_id;

SELECT * FROM AUTHOR_TITLE_ADVANCE_LOYALTY;

# CHALLENGE 2 - STEP 2

CREATE TEMPORARY TABLE AGGREATIONS
SELECT title_id as TITLE_ID ,au_id as AUTHOR_ID , SUM(advance) as ADVANCE, SUM(royalty_each_sale) AS SALES_ROYALTY 
FROM AUTHOR_TITLE_ADVANCE_LOYALTY
GROUP BY AUTHOR_ID,TITLE_ID;

SELECT * FROM AGGREATIONS;

# CHALLENGE 2 - STEP 3

CREATE TEMPORARY TABLE FINAL
SELECT AUTHOR_ID, (SUM(ADVANCE)+SUM(SALES_ROYALTY)) AS TOTAL_PROFIT 
FROM AGGREATIONS
GROUP BY AUTHOR_ID
ORDER BY TOTAL_PROFIT DESC
LIMIT 3;
SELECT * FROM FINAL;

#--------------------------------------------------------------------------------

# CHALLENGE 3 

CREATE TABLE most_profiting_authors  
SELECT author_id,total_profit FROM FINAL;

SELECT * FROM most_profiting_authors;