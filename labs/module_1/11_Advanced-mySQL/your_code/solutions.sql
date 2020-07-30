########====Step 1, Challenge 1======#######
select auti.`au_id`,# as 'Author ID',
auti.`title_id`,# as 'Title ID',
(tit.advance * auti.royaltyper / 100) as advance,
(tit.price * sales.qty * tit.royalty / 100 * auti.royaltyper) / 100 as sales_royalty
from titleauthor as auti
left join sales
on auti.`title_id` = sales.`title_id`
left join titles as tit
on auti.`title_id` = tit.`title_id`;

########====Step 2, Challenge 3======#######
select au_id as 'Author ID',
`title_id` as 'Title ID',
sum(advance) as advance,
sum(sales_royalty) as sales_royalty
from (select
auti.`au_id`,# as 'Author ID',
auti.`title_id`,# as 'Title ID',
(tit.advance * auti.royaltyper / 100) as advance,
(tit.price * sales.qty * tit.royalty / 100 * auti.royaltyper) / 100 as sales_royalty
from titleauthor as auti
left join sales
on auti.`title_id` = sales.`title_id`
left join titles as tit
on auti.`title_id` = tit.`title_id`) as summary
group by au_id,title_id;


########=======Step 3, Challenge 1=============#######
select
authors.au_fname as '`First Name',
authors.au_lname as 'Last Name',
sum(total_profit) as profit
from (
select au_id ,
`title_id`,
sum(advance) + sum(sales_royalty) as total_profit

from (select
auti.`au_id`,# as 'Author ID',
auti.`title_id`,# as 'Title ID',
(tit.advance * auti.royaltyper / 100) as advance,
(tit.price * sales.qty * tit.royalty / 100 * auti.royaltyper) / 100 as sales_royalty
from titleauthor as auti
left join sales
on auti.`title_id` = sales.`title_id`
left join titles as tit
on auti.`title_id` = tit.`title_id`) as summary
group by au_id,title_id
) as aggr
left join authors
on aggr.au_id = authors.au_id
group by authors.au_fname,
authors.au_lname
order by profit desc
limit 3
;


########=======Challenge 2, temp tables=============#######

create temporary table `publications`.Summary
select auti.`au_id`,# as 'Author ID',
auti.`title_id`,# as 'Title ID',
(tit.advance * auti.royaltyper / 100) as advance,
(tit.price * sales.qty * tit.royalty / 100 * auti.royaltyper) / 100 as sales_royalty
from titleauthor as auti
left join sales
on auti.`title_id` = sales.`title_id`
left join titles as tit
on auti.`title_id` = tit.`title_id`;

create temporary table publications.aggr
select au_id ,
`title_id`,
sum(advance) + sum(sales_royalty) as total_profit
from
Summary
group by au_id,title_id;

drop temporary table Summary;


select authors.au_fname as 'First Name',
authors.au_lname as 'Last Name',
sum(total_profit) as profit
from aggr
left join authors
on aggr.`au_id` = authors.au_id
group by authors.au_fname, authors.au_lname
order by profit desc
limit 3
;



#######=======Challenge 3 ===========#####

create table most_profiting_authors
select authors.au_fname as 'First Name',
authors.au_lname as 'Last Name',
sum(total_profit) as profit
from aggr
left join authors
on aggr.`au_id` = authors.au_id
group by authors.au_fname, authors.au_lname;

drop temporary table aggr;



