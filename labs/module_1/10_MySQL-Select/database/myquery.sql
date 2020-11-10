SELECT 
	a.au_id 'AUTHOR ID',    
    a.au_lname 'LAST NAME',
    a.au_fname 'FIRST NAME',
    t.title 'TITLE',
    p.pub_name 'PUBLISHER'
FROM
	titleauthor ta
    INNER JOIN authors a
    ON ta.au_id = a.au_id
    INNER JOIN titles t
    ON ta.title_id = t.title_id
    INNER JOIN publishers p
    ON t.pub_id = p.pub_id
ORDER BY 1 ASC