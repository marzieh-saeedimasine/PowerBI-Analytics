UPDATE bike_share_yr_0 SET dteday= str_to_date(dteday, '%d/%m/%Y');
ALTER TABLE bike_share_yr_0 MODIFY column dteday DATE;

UPDATE bike_share_yr_1 SET dteday= str_to_date(dteday, '%d/%m/%Y');
ALTER TABLE bike_share_yr_1 MODIFY column dteday DATE;

WITH bike_cte as (
SELECT * FROM bike_share_yr_0
union
SELECT * FROM bike_share_yr_1)
SELECT dteday,season,bt.yr,mnth,hr,holiday,workingday,rider_type,riders,
ct.price, ct.COGS, 
riders* ct.price as revenue, riders* ct.price -riders* ct.COGS as profit  
FROM bike_cte bt
left join cost_table ct ON bt.yr=ct.yr;