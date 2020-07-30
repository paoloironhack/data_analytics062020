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

# [tjerk]
# wauw, flawless Archana!!
#
# small code guideline tip: you should write asc as ASC
# to make your query a bit more compact you could also do:
SELECT a.au_id AS AuthorID, a.au_lname AS LastName, a.au_fname AS FirstName, t.title AS Title, p.pub_name AS Publisher
FROM publications.authors a
INNER JOIN publications.titleauthor ta ON ta.au_id = a.au_id
INNER JOIN publications.titles t ON ta.title_id = t.title_id
INNER JOIN publications.publishers p ON p.pub_id = t.pub_id
ORDER BY AuthorID ASC;


#Challenge2
Select authors.au_id as Author_ID , authors.au_fname as FIRST_NAME , authors.au_lname as LAST_NAME , publishers.pub_name as PUBLISHER, count(titles.title) as TITLECOUNT from publications.authors
LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN publications.titles ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id 
GROUP BY AUTHOR_ID , LAST_NAME , FIRST_NAME , PUBLISHER
ORDER BY AUTHOR_ID DESC;

#[tjerk]
# again very nice job!!
# write Select as SELECT




#Check if the above output is correct
Select sum(TITLECOUNT) from (Select authors.au_id as Author_ID , authors.au_fname as FIRST_NAME , authors.au_lname as LAST_NAME , publishers.pub_name as PUBLISHER, count(titles.title) as TITLECOUNT from publications.authors
LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN publications.titles ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id 
GROUP BY AUTHOR_ID , LAST_NAME , FIRST_NAME , PUBLISHER
ORDER BY AUTHOR_ID DESC) TOTAL ;
Select count(*) from publications.titleauthor ;

#[tjerk]
# nice check query
# do not enter a space before ;

#Challenge 3
Select authors.au_id as Author_ID , authors.au_fname as FIRST_NAME , authors.au_lname as LAST_NAME , sum(qty) as TOTAL from publications.authors
LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
INNER JOIN publications.sales ON titleauthor.title_id = sales.title_id
GROUP BY LAST_NAME , FIRST_NAME 
ORDER BY TOTAL DESC LIMIT 3 ;

# [tjerk]
# your left join should be an inner join, can you understand why?

#Challenge4
Select Author_ID , FIRST_NAME , LAST_NAME ,coalesce(TOTAL,0) as TOT from
(Select authors.au_id as Author_ID , authors.au_fname as FIRST_NAME , authors.au_lname as LAST_NAME , sum(qty) as TOTAL from publications.authors
LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id 
LEFT JOIN publications.sales ON titleauthor.title_id = sales.title_id
GROUP BY LAST_NAME , FIRST_NAME 
ORDER BY TOTAL DESC ) as Totaal ;

# [tjerk] great job, flawless
# small thing: you can order on AuthorID as a second ordering


# [tjerk]
# I am very impressed by this lab, you show that you really understand joins and sql, i am proud of you and hope you are also very proud on yourself, keep on going like this Archana!

