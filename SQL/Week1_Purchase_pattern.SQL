--Week1: Purchase Pattern Analysis
--Tool: MySQL

select database();

show databases;

show tables;

select * from mytable;

select count(*) AS total_rows from mytable;

-- Unique bills
select count(distinct billno) AS total_bills from mytable;

-- unique items
select count(distinct itemname) AS total from mytable;

-- sample rows 
select* from mytable
limit 50;

-- top-selling items by quantity

select itemname, sum(Quantity) AS total_qty
from mytable
group by itemname
order by  total_qty DESC
limit 20;

select
sum(CASE WHEN billno IS NULL THEN 1 ELSE 0 END) AS missing_bills,
sum(CASE WHEN itemname IS NULL THEN 1 ELSE 0 END) AS missing_items,
sum(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS missing_qty
from mytable;

select count(*)  invalid_rows
from mytable
where Quantity <=0;

select billno, count(distinct itemname) AS items_per_bill
from
mytable
group by BillNo
order by items_per_bill DESC
limit 20;

select 
   avg(quantity) AS
avg_qty,
min(quantity) AS min_qty,
max(quantity) AS max_qty
from mytable;

select itemname, sum(quantity * price) AS total_sales
from mytable
group by
itemname
order by total_sales DESC
limit 10;
