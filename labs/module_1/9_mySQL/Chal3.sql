SELECT
	a.au_id 'AUTHOR ID',    
    a.au_lname 'LAST NAME',
    a.au_fname 'FIRST NAME',
    SUM(t.ytd_sales) 'TOTAL'
FROM
	titleauthor ta
    INNER JOIN authors a
    ON ta.au_id = a.au_id
    INNER JOIN titles t
    ON ta.title_id = t.title_id
GROUP BY
	a.au_id,    
    a.au_lname,
    a.au_fname
ORDER BY 4 DESC 
LIMIT 3