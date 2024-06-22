CREATE database airbnb;

use airbnb;

create table airbnb_listings(
	id int,
    name varchar(255),
    host_id int,
    host_name varchar(255),
    neighbourhood_group varchar(255),
    neighbourhood varchar(255),
    latitude decimal(10,8),
    longitude decimal(11,8),
    room_type varchar(50),
    price int,
    minimum_nights int,
    number_of_reviews int,
    last_review date,
    reviews_per_month decimal(4,2),
    calculated_host_listings_count int,
    availability_365 int
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/airbnb_table.csv'
INTO TABLE airbnb_listings
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows
(@id, @name, @host_id, @host_name, @neighbourhood_group, @neighbourhood, @latitude, @longitude, @room_type, @price, @minimum_nights, @number_of_reviews, @last_review, @reviews_per_month,@calculated_host_listings_count,@availability_365)
set 
	id = nullif(@id, ''),
    name = nullif(@name, ''),
    host_id = nullif(@host_id, ''),
    host_name = nullif(@host_name, ''),
    neighbourhood_group = nullif(@neighbourhood_group, ''),
    neighbourhood = nullif(@neighbourhood, ''),
    latitude = nullif(@latitude, ''),
    longitude = nullif(@longitude, ''),
    room_type = nullif(@room_type, ''),
    price = nullif(@price, ''),
    minimum_nights = nullif(@minimum_nights, ''),
    number_of_reviews = nullif(@number_of_reviews, ''),
    last_review = case 
		when @last_review = '' then null
        when @last_review regexp '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' then str_to_date(@last_review, '%d-%m-%Y')
        when @last_review regexp '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' then str_to_date(@last_review, '%Y-%m-%d')
        else null
	end,
    reviews_per_month = nullif(@reviews_per_month, ''),
    calculated_host_listings_count = nullif(@calculated_host_listings_count, ''),
    availability_365 = nullif(@availability_365, '');
    
select * from airbnb_listings;    

delete from airbnb_listings
where id in ( 
	select id from(
		select
			id,
            row_number() over (partition by id,name,host_id,host_name,neighbourhood_group,neighbourhood,latitude,longitude,room_type,price,minimum_nights,number_of_reviews,last_review,reviews_per_month,calculated_host_listings_count,availability_365)
		from 
			airbnb_listings
		)as subquery
        where row_number > 1
	);

delete from airbnb_listings
where host_name is null;

-- 
update airbnb_listings 
set last_review = '2000-01-01'
where last_review is null;

--
create temporary table mean_reviews as
select avg(reviews_per_month) as mean_reviews_per_month
from airbnb_listings
where reviews_per_month is not null;

--
update airbnb_listings
set reviews_per_month = (select mean_reviews_per_month from mean_reviews)
where reviews_per_month is null;

--
alter table airbnb_listings
add column last_review_null int default 0,
add column reviews_per_month_null int default 0;

--
update airbnb_listings
set last_review_null = 1
where last_review = '2000-01-01';

--
update airbnb_listings
set reviews_per_month_null=1
where reviews_per_month = (
	select mean_reviews_per_month 
    from mean_reviews);
    
-- Host info Analysis
select 
	host_name,
    count(id) as listing_counts,
    round(avg(number_of_reviews),2) as avg_reviews,
    round(avg(reviews_per_month),2) as avg_reviews_per_month
from
	airbnb_listings
group by
	host_name
order by
	count(*) desc;
    
-- Area info Analysis
select 
	neighbourhood_group,
    neighbourhood,
    count(id) as listings_count,
    avg(price) as avg_price,
    avg(number_of_reviews) as avg_reviews
from
	airbnb_listings
group by
	neighbourhood_group,
    neighbourhood
order by
	count(*) desc,neighbourhood_group desc;
    
-- Distribution of Rooms
select
	room_type,
    count(*) as rooms
from
	airbnb_listings
group by
	room_type
order by
	rooms desc;

-- Busiest host
select
	host_name,
    avg(reviews_per_month) as avg_reviews_per_month
from
	airbnb_listings
group by
	host_name
order by
	avg_reviews_per_month desc;
    
-- Highest traffic neighbourhood
select
	neighbourhood,
    avg(reviews_per_month) as avg_reviews
from
	airbnb_listings
group by
	neighbourhood
order by
	avg_reviews desc;
    
select * from airbnb_listings;
    








        
    

