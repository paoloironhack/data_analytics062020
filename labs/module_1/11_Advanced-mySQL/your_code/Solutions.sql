-- ## Challenge 1 - Most Profiting Authors

USE publications;

-- Step 1
SELECT 	titleauthor.title_id, 
		titleauthor.au_id, 
		titles.advance * titleauthor.royaltyper / 100 as advance, 
		titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) as sales_royalty
	
		FROM titleauthor
			LEFT JOIN titles ON titleauthor.title_id =titles.title_id
				LEFT JOIN sales ON titles.title_id = sales.title_id

-- Step 2
SELECT 	titleauthor.title_id, 
		titleauthor.au_id, 
		subquery1.advance,
		sum(subquery1.sales_royalty) as sum_royalty
		
		FROM titleauthor
			LEFT JOIN (/**step 1**/ SELECT 	titleauthor.title_id, 
		titleauthor.au_id, 
		titles.advance * titleauthor.royaltyper / 100 as advance, 
		titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
	
		FROM titleauthor
			LEFT JOIN titles ON titleauthor.title_id =titles.title_id
				LEFT JOIN sales ON titles.title_id = sales.title_id) as subquery1
					ON titleauthor.au_id = subquery1.au_id
						GROUP BY titleauthor.title_id, titleauthor.au_id

-- Step 3
SELECT 	titleauthor.au_id,
		SUM(titleauthor.advance) + SUM(titleauthor.sum_royalty) as profits

		FROM (SELECT 	titleauthor.title_id, 
		titleauthor.au_id, 
		subquery1.advance,
		sum(subquery1.sales_royalty) as sum_royalty
		
		FROM titleauthor
			LEFT JOIN (/**step 1**/ SELECT 	titleauthor.title_id, 
		titleauthor.au_id, 
		titles.advance * titleauthor.royaltyper / 100 as advance, 
		titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
	
		FROM titleauthor
			LEFT JOIN titles ON titleauthor.title_id =titles.title_id
				LEFT JOIN sales ON titles.title_id = sales.title_id) as subquery1
					ON titleauthor.au_id = subquery1.au_id
						GROUP BY titleauthor.title_id, titleauthor.au_id) as titleauthor

		GROUP BY titleauthor.au_id
		ORDER BY profits DESC
		LIMIT 3

-- ## Challenge 2 - Alternative Solution (temp table)

CREATE TEMPORARY TABLE profits

SELECT 	titleauthor.title_id, 
		titleauthor.au_id, 
		subquery1.advance,
		sum(subquery1.sales_royalty) as sum_royalty
		
		FROM titleauthor
			LEFT JOIN (/**step 1**/ SELECT 	titleauthor.title_id, 
		titleauthor.au_id, 
		titles.advance * titleauthor.royaltyper / 100 as advance, 
		titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
	
		FROM titleauthor
			LEFT JOIN titles ON titleauthor.title_id =titles.title_id
				LEFT JOIN sales ON titles.title_id = sales.title_id) as subquery1
					ON titleauthor.au_id = subquery1.au_id
						GROUP BY titleauthor.title_id, titleauthor.au_id

SELECT	profits.au_id,
		SUM(profits.advance) + SUM(profits.sum_royalty) as sum_profits
		
        FROM profits
			GROUP BY profits.au_id
				ORDER BY sum_profits DESC
					LIMIT 3

-- ## Challenge 3

CREATE table most_profiting_authors
SELECT 	titleauthor.au_id,
		SUM(titleauthor.advance) + SUM(titleauthor.sum_royalty) as profits

		FROM (SELECT 	titleauthor.title_id, 
		titleauthor.au_id, 
		subquery1.advance,
		sum(subquery1.sales_royalty) as sum_royalty
		
		FROM titleauthor
			LEFT JOIN (/**step 1**/ SELECT 	titleauthor.title_id, 
		titleauthor.au_id, 
		titles.advance * titleauthor.royaltyper / 100 as advance, 
		titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
	
		FROM titleauthor
			LEFT JOIN titles ON titleauthor.title_id =titles.title_id
				LEFT JOIN sales ON titles.title_id = sales.title_id) as subquery1
					ON titleauthor.au_id = subquery1.au_id
						GROUP BY titleauthor.title_id, titleauthor.au_id) as titleauthor

		GROUP BY titleauthor.au_id
		ORDER BY profits DESC