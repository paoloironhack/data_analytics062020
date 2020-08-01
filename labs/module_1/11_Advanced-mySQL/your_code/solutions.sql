
# Challenge 1 

#Step 1

SELECT titleauthor.au_id AS `AUTHOR ID` , titles.title_id AS `TITLE ID` , (titles.advance* titleauthor.royaltyper)/100 AS `ADVANCE` , (titles.price * sales.qty * titles.royalty/ 100 * titleauthor.royaltyper)/100 as `SALES ROYALTY`
FROM titleauthor
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id;




#step 2

SELECT DISTINCT `TITLE ID`,`AUTHOR ID`,Sum(`SALES ROYALTY`) AS `AGGREGATED ROYALTIES`,SUM(`ADVANCE`) AS `AGGREGATED ADVANCES`
FROM (SELECT titleauthor.au_id AS `AUTHOR ID` , titles.title_id AS `TITLE ID` , (titles.advance* titleauthor.royaltyper)/100 AS `ADVANCE` , (titles.price * sales.qty * titles.royalty/ 100 * titleauthor.royaltyper)/100 as `SALES ROYALTY`
FROM titleauthor
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id) AS SUMMARY
GROUP BY `AUTHOR ID`,`TITLE ID` ;

#step 3

SELECT `AUTHOR ID`, SUM(`AGGREGATED ROYALTIES`+ `AGGREGATED ADVANCES`) AS `PROFIT`
FROM (SELECT DISTINCT `TITLE ID`,`AUTHOR ID`,Sum(`SALES ROYALTY`) AS `AGGREGATED ROYALTIES`,SUM(`ADVANCE`) AS `AGGREGATED ADVANCES`  FROM (SELECT titleauthor.au_id AS `AUTHOR ID` , titles.title_id AS `TITLE ID` , (titles.advance* titleauthor.royaltyper)/100 AS `ADVANCE` , (titles.price * sales.qty * titles.royalty/ 100 * titleauthor.royaltyper)/100 as `SALES ROYALTY`
FROM titleauthor
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id) AS Summary
GROUP BY `AUTHOR ID`,`TITLE ID`) AS SUMMARY2
GROUP BY `AUTHOR ID`
ORDER BY `PROFIT` DESC
LIMIT 3;

#Challenge 2 - Alternative Solution

#step 1

CREATE TEMPORARY TABLE `ROYALTY SUMMARY`
SELECT titleauthor.au_id AS `AUTHOR ID` , titles.title_id AS `TITLE ID` , (titles.advance* titleauthor.royaltyper)/100 AS `ADVANCE` , (titles.price * sales.qty * titles.royalty/ 100 * titleauthor.royaltyper)/100 as `SALES ROYALTY`
FROM titleauthor
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id;

#STEP 2
CREATE TEMPORARY TABLE `AGGREGATED ROYALTIES SUMMARY`
SELECT DISTINCT `TITLE ID`,`AUTHOR ID`,Sum(`SALES ROYALTY`) AS `AGGREGATED ROYALTIES`,SUM(`ADVANCE`) AS `AGGREGATED ADVANCES` 
FROM `ROYALTY SUMMARY`
GROUP BY `AUTHOR ID`,`TITLE ID` ;


#STEP 3
CREATE TEMPORARY TABLE `PROFIT SUMMARY`
SELECT `AUTHOR ID`, SUM(`AGGREGATED ROYALTIES`+ `AGGREGATED ADVANCES`) AS `PROFIT`
FROM `AGGREGATED ROYALTIES SUMMARY`
GROUP BY `AUTHOR ID`
ORDER BY `PROFIT` DESC
LIMIT 3;

CREATE TABLE most_profiting_authors
SELECT `AUTHOR ID` , SUM(`AGGREGATED ROYALTIES`+ `AGGREGATED ADVANCES`) AS 'PROFIT'
FROM `AGGREGATED ROYALTIES SUMMARY`
GROUP BY `AUTHOR ID` ;

#Check table
SELECT *
FROM most_profiting_authors;
