
SELECT
	titleauthor.title_id,
    titleauthor.au_id,
    SUM(AggregatedRoyalties.advance + AggregatedRoyalties.sales_royalty) as 'Aggregated Royalties'
FROM
	titleauthor
    INNER JOIN (select 
	titles.title_id,
    titleauthor.au_id,
    titles.advance * titleauthor.royaltyper / 100 as 'advance',
    titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as 'sales_royalty'
FROM
	sales 
    INNER JOIN titles 
    ON sales.title_id = titles.title_id
    INNER JOIN titleauthor
    ON sales.title_id = titleauthor.title_id) AggregatedRoyalties
ON
	titleauthor.title_id = AggregatedRoyalties.title_id AND titleauthor.au_id = AggregatedRoyalties.au_id
    
    GROUP BY 
    titleauthor.title_id,
    titleauthor.au_id
    


    