select 

au.au_id as 'Author ID'
,au.au_lname as 'Last Name'
,au.au_fname as 'First Name'
,ti.`title` as 'Title'
,pub.`pub_name` as 'Publisher'
/* ,tit.title as 'Title' */

-- ,pub.`pub_name` as 'Publisher'


from 
publications.authors as au
left join publications.titleauthor as tit
on au.au_id = tit.au_id
left join publications.titles as ti
on tit.title_id = ti.title_id
inner join `publications`.`publishers` as pub
on ti.`pub_id` = pub.`pub_id`
order by au.au_id asc;


select 
au.au_id as 'Author ID'
,au.au_lname as 'Last Name'
,au.au_fname as 'First Name'
,pub.`pub_name` as 'Publisher'
,count(au.`au_id`) as count
from 
publications.authors as au
left join publications.titleauthor as tit
on au.au_id = tit.au_id
left join publications.titles as ti
on tit.title_id = ti.title_id
inner join `publications`.`publishers` as pub
on ti.`pub_id` = pub.`pub_id`
group by au.au_id, au.`au_fname`,au.`au_lname`,pub.`pub_name`
order by au.au_id desc
;


select  
au.au_id as 'Author ID',
au.au_lname as 'Last Name',
au.au_fname as 'First Name',
sum(sales.qty) as 'Total'
from 
publications.authors as au
left join publications.titleauthor as tit
on au.au_id = tit.au_id
left join publications.titles as ti
on tit.title_id = ti.title_id
inner join `publications`.`publishers` as pub
on ti.`pub_id` = pub.`pub_id`
left join publications.sales as sales
on tit.`title_id` = sales.`title_id`
group by au.au_id,au.au_lname,au.au_fname
order by Total desc limit 3
;

/* First solution to question 4 with temporary List*/

create temporary table publications.sales_by_writer
select  
au.au_id,
au.au_lname,
au.au_fname,
sum(sales.qty) as 'qty'
from 
publications.authors as au
left join publications.titleauthor as tit
on au.au_id = tit.au_id
left join publications.titles as ti
on tit.title_id = ti.title_id
inner join `publications`.`publishers` as pub
on ti.`pub_id` = pub.`pub_id`
left join publications.sales as sales
on tit.`title_id` = sales.`title_id`
group by au.au_id,au.au_lname,au.au_fname
order by qty desc
;

select au.`au_id` as 'AUTHOER ID',
au.`au_lname` as 'LAST NAME',
au.`au_fname` as 'FIRST NAME',
COALESCE(qty,0) as 'Total'
from authors as au
left join publications.sales_by_writer as sales 
on au.`au_id` = sales.`au_id`;

/* Second solution to question 4 with left Join*/

select au.`au_id` as 'AUTHOER ID',
au.`au_lname` as 'LAST NAME',
au.`au_fname` as 'FIRST NAME',
COALESCE(summary.qty,0) as 'Total'
from (select  
au.au_id,
au.au_lname,
au.au_fname,
sum(sales.qty) as 'qty'
from 
publications.authors as au
left join publications.titleauthor as tit
on au.au_id = tit.au_id
left join publications.titles as ti
on tit.title_id = ti.title_id
inner join `publications`.`publishers` as pub
on ti.`pub_id` = pub.`pub_id`
left join publications.sales as sales
on tit.`title_id` = sales.`title_id`
group by au.au_id,au.au_lname,au.au_fname
order by qty desc) as summary
right join publications.authors as au
on summary.au_id = au.au_id
order by summary.qty desc;

/*
well done Lukas, please use capital letters for all sql commands, example:
e.g.:
# Challenge 4
SELECT a.au_id AS AuthorID, a.au_lname AS LastName, a.au_fname AS FirstName, IFNULL(SUM(s.qty),0) AS Total
FROM publications.authors a
LEFT JOIN publications.titleauthor ta ON ta.au_id = a.au_id
LEFT JOIN publications.sales s ON s.title_id = ta.title_id
GROUP BY AuthorID
ORDER BY Total DESC, AuthorID DESC;
*/
