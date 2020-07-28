
/* Change to lab_mysql database */
USE lab_mysql;

/* Update typo in store*/
UPDATE salespersons SET store='Miami' WHERE name='Paige Turner';

/*Add email addresses to customers*/
UPDATE customers SET email='ppicasso@gmail.com' WHERE name='Pablo Picasso';
UPDATE customers SET email='lincoln@us.gov' WHERE name='Abraham Lincoln';
UPDATE customers SET email='hello@napoleon.me' WHERE name='Napoléon Bonaparte';