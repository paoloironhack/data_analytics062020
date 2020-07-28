USE publications;
select * from authors;
select * from publishers;
select * from titles;
select * from titleauthor;
Select * from Sales;

#Challenge1
Select authors.au_id as Author_ID , authors.au_fname as FIRST_NAME , authors.au_lname as LAST_NAME , titles.title as TITLE , publishers.pub_name as PUBLISHER  from publications.authors 
LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN publications.titles ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id ORDER BY AUTHOR_ID asc;

#Challenge2
Select authors.au_id as Author_ID , authors.au_fname as FIRST_NAME , authors.au_lname as LAST_NAME , publishers.pub_name as PUBLISHER, count(titles.title) as TITLECOUNT from publications.authors
LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN publications.titles ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id 
GROUP BY AUTHOR_ID , LAST_NAME , FIRST_NAME , PUBLISHER
ORDER BY AUTHOR_ID DESC;

#Check if the above output is correct
Select sum(TITLECOUNT) from (Select authors.au_id as Author_ID , authors.au_fname as FIRST_NAME , authors.au_lname as LAST_NAME , publishers.pub_name as PUBLISHER, count(titles.title) as TITLECOUNT from publications.authors
LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN publications.titles ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id 
GROUP BY AUTHOR_ID , LAST_NAME , FIRST_NAME , PUBLISHER
ORDER BY AUTHOR_ID DESC) TOTAL ;
Select count(*) from publications.titleauthor ;

#Challenge 3
Select authors.au_id as Author_ID , authors.au_fname as FIRST_NAME , authors.au_lname as LAST_NAME , sum(qty) as TOTAL from publications.authors
LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN publications.sales ON titleauthor.title_id = sales.title_id
GROUP BY LAST_NAME , FIRST_NAME 
ORDER BY TOTAL DESC LIMIT 3 ;

#Challenge4
Select Author_ID , FIRST_NAME , LAST_NAME ,coalesce(TOTAL,0) as TOT from
(Select authors.au_id as Author_ID , authors.au_fname as FIRST_NAME , authors.au_lname as LAST_NAME , sum(qty) as TOTAL from publications.authors
LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN publications.sales ON titleauthor.title_id = sales.title_id
GROUP BY LAST_NAME , FIRST_NAME 
ORDER BY TOTAL DESC ) as Totaal ;

