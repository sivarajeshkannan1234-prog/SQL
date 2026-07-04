-- SCD (slowly change dimension) is a method used in database to track and preserve historical change in data over time.
-- Why We Use SCD
-- Track Historical Data: We want to retain older versions of our data for accurate historical analysis and trend reporting (e.g., how many sales happened when the customer had a different address).
 
-- Data Accuracy: Ensures that updates to dimension data (like a last name change) won't override previous valid data in a way that confuses analysis.
 
-- Simplify Reporting and Analytics: Makes it easier for analysts to query the data, knowing they can trust the historical records.
 
-- Main Types of SCD
-- Type 1: Overwrite
-- Type 2: Add New Record
-- Type 3: Add New Attribute

## tyep1
use company;
create table dim_product_type1(
product_id int primary key,
product_title varchar(100),
category varchar(100),
brand varchar(100));

insert into dim_product_type1 (product_id, product_title, category, brand)
values (101, 'amazon echo dot 3rd gen', 'smart speckers','amazon');

select *from dim_product_type1;

update dim_product_type1
set product_title='amazon echo dot(3rd gen)'
where product_id=101;

## type 2
create table dim_seller_type2(
seller_key int primary key,
seller_id int,
seller_name varchar (255),
store_location varchar(255),
effective_date date,
end_date date,
is_current boolean);

insert into dim_seller_type2(seller_key,seller_id,seller_name,store_location,effective_date,end_date,is_current)
values (1,501,'best seller inc.','seattle , WA','2022-01-01',null,true);

select  *from dim_seller_type2;

update dim_seller_type2
set end_date ='2023-01-15',
is_current =false
where seller_id =501 and is_current=true;

insert into dim_seller_type2(seller_key,seller_id,seller_name,store_location,effective_date,end_date,is_current)
values (2,501,'best seller inc.','los angeles, CA','2023-01-15',null,true);

select  *from dim_seller_type2 where seller_id=501;


## type 3
create table dim_product_type3(
product_id int primary key,
product_title varchar(100),
current_category varchar(100),
previous_category varchar(100));

insert into dim_product_type3 (product_id,product_title,current_category,previous_category)
values
(201,'amazon fire TV stick','streaming devices', null);

update dim_product_type3
set previous_category=current_category,
current_category='media players'
where product_id =201;

select * from dim_product_type3;