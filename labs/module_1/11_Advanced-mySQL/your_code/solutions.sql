USE Publications;

select * from sales;
select * from titles;
select * from titleauthor;

#Step 1- Challenge 1
select titleauthor.au_id AS AUTHOR_ID , titles.title_id AS TITLE_ID , (titles.advance* titleauthor.royaltyper)/100 as advance , (titles.price * sales.qty * titles.royalty/ 100 * titleauthor.royaltyper)/100 as sales_royalty
from titleauthor LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id;

#Step2 - Challenge 1
Select au_id as AUTHOR_ID , title_id as TITLE_ID ,sum(advance) , sum(sales_royalty) from (select titleauthor.au_id , titles.title_id , (titles.advance* titleauthor.royaltyper)/100 as advance , (titles.price * sales.qty * titles.royalty/ 100 * titleauthor.royaltyper)/100 as sales_royalty
from titleauthor LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id) as Summary GROUP BY au_id, title_id;

#Step3 - Challenge 1
Select au_id as AUTHOR_ID , sum(Profit) as Total_Profit from (
Select title_id as TITLE_ID , au_id as AUTHOR_ID , sum(advance) + sum(sales_royalty) as Profit from ( select titleauthor.au_id , titleauthor.title_id , (titles.advance* titleauthor.royaltyper)/100 as advance , (titles.price * sales.qty * titles.royalty/ 100 * titleauthor.royaltyper)/100 as sales_royalty
from titleauthor LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id) as Summary GROUP BY au_id, title_id) as Final
left join authors ON Final.AUTHOR_ID = authors.au_id 
GROUP BY authors.au_fname ,authors.au_lname 
ORDER BY Total_Profit DESC LIMIT 3 ;

#Challenge 2
create temporary table publications.Query1
select titleauthor.au_id AS AUTHOR_ID , titles.title_id AS TITLE_ID , (titles.advance* titleauthor.royaltyper)/100 as advance , (titles.price * sales.qty * titles.royalty/ 100 * titleauthor.royaltyper)/100 as sales_royalty
from titleauthor LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id;
select * from Query1;

create temporary table publications.Query2 
Select AUTHOR_ID , TITLE_ID, sum(advance) + sum(sales_royalty) as Totaal from Query1 GROUP BY AUTHOR_ID , TITLE_ID;
select * from Query2;
#drop temporary table Query1;
#drop temporary table Query2;
select AUTHOR_ID , sum(Totaal) as Total_Profit from Query2 left join authors on Query2.AUTHOR_ID = authors.au_id 
group by authors.au_id order by Totaal DESC limit 3;

#Challenge 3
create table most_profiting_authors
select authors.au_id as AUTHOR_ID , sum(Totaal) as PROFITS from Query2 left join authors ON Query2.AUTHOR_ID = authors.au_id 
group by authors.au_id order by PROFITS DESC ;
select * from most_profiting_authors;

#DROP TABLE most_profiting_authors;







