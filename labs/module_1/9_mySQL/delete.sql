show databases;
SET SQL_SAFE_UPDATES = 0;
use lab_mysql;
show tables;
select * from cars;

### DELETE FROM cars where ID = 5;    I believe this one will delete entire row, but we only want to delete Vehicle_ID as far as I understood..
UPDATE cars SET vehicle_ID = "" where ID = 5;