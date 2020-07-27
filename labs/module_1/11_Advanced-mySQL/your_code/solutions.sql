Challenge 1 and 2

USE publications;
CREATE TEMPORARY TABLE advancevalues
SELECT titleauthor.royaltyper, titles.title_id, titleauthor.au_id, titles.advance
FROM titleauthor
RIGHT JOIN titles
ON titleauthor.title_id = titles.title_id;
CREATE TEMPORARY TABLE advancetotal
SELECT advancevalues.royaltyper, advancevalues.title_id, advancevalues.au_id, advancevalues.advance,  (advancevalues.advance*advancevalues.royaltyper/100) AS Advance_total
FROM advancevalues;
CREATE TEMPORARY TABLE royaltyvalues
SELECT titles.title_id, sales.qty, titles.royalty, titles.price
FROM sales
RIGHT JOIN titles
ON titles.title_id = sales.title_id;
CREATE TEMPORARY TABLE royaldata
SELECT royaltyvalues.title_id, royaltyvalues.qty, royaltyvalues.royalty, royaltyvalues.price, advancetotal.royaltyper, advancetotal.Advance_total
FROM royaltyvalues
RIGHT JOIN advancetotal
ON royaltyvalues.title_id = advancetotal.title_id;
CREATE TEMPORARY TABLE advandroyalty
SELECT royaldata.qty, royaldata.royalty, royaldata.price, royaldata.royaltyper,royaldata.Advance_total, (royaldata.price*royaldata.qty*royaldata.royalty/100*royaldata.royaltyper/100) AS Sales_royalty
FROM royaldata;
SELECT * FROM advandroyalty
USE publications;
CREATE TEMPORARY TABLE AggregRoy
SELECT advandroyalty.au_id, advandroyalty.title_id, (advandroyalty.Sales_royalty +  advandroyalty.Advance_total) AS AggregateRoyalties
FROM advandroyalty
GROUP BY au_id, title_id
SELECT * FROM AggregRoy
USE publications;
SELECT *
FROM AggregRoy
ORDER BY AggregRoy.AggregateRoyalties DESC
LIMIT 3




Challenge 3 - add data from temp table to permanent table

USE publications;
INSERT INTO most_profiting_authors (au_id, profits)
SELECT au_id, AggregateRoyalties
FROM publications.AggregRoy
ORDER BY AggregateRoyalties DESC;