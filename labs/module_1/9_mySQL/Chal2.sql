SELECT 
	a.au_id 'AUTHOR ID',    
    a.au_lname 'LAST NAME',
    a.au_fname 'FIRST NAME',
    p.pub_name 'PUBLISHER',
    COUNT(t.title) 'TITLE'
FROM
	titleauthor ta
    INNER JOIN authors a
    ON ta.au_id = a.au_id
    INNER JOIN titles t
    ON ta.title_id = t.title_id
    INNER JOIN publishers p
    ON t.pub_id = p.pub_id
GROUP BY
	a.au_id,    
    a.au_lname,
    a.au_fname,
    p.pub_name
ORDER BY 5 DESC, 1 DESC