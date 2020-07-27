USE publications;
SELECT titleauthor.title_id, authors.au_lname, authors.au_fname, sum(sales.qty) as total
	FROM titleauthor
		LEFT JOIN sales ON titleauthor.title_id = sales.title_id
			LEFT JOIN authors ON titleauthor.au_id = authors.au_id
				GROUP BY au_fname
					ORDER BY total DESC
						LIMIT 3