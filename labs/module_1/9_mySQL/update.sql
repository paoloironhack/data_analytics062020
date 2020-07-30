use lab_mysql;

update Salespersons
set Store = 'Miami'
where Store = 'Mimia';

update Customers
set `Email` = case `Name`
when 'Pablo Picasso' then 'ppicasso@gmail.com'
when 'Abraham Lincoln' then 'lincoln@us.gov'
when 'Napoléon Bonaparte' then 'hello@napoleon.me'
end;
