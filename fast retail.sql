use restaurants;
CREATE TABLE Products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
low_fats ENUM('Y', 'N'),
recyclable ENUM('Y', 'N'),
category varchar(40));

INSERT INTO Products (product_id, product_name, low_fats, recyclable, category)
VALUES
(1, 'ProductA', 'Y', 'Y', 'Dairy'),
(2, 'ProductB', 'N', 'Y', 'Beverage'),
(3, 'ProductC', 'Y', 'N', 'Dairy'),
(4, 'ProductD', 'Y', 'Y', 'Beverage'),
(5, 'Product', 'N', 'N', 'Dairy'),
(6, 'Product', 'Y', 'N', 'Snacks'),
(7, 'ProductG', 'N', 'Y', 'Snacks'),
(8, 'ProductH', 'Y', 'Y', 'Frozen'),
(9, 'ProductI', 'N', 'Y', 'Frozen'),
(10, 'Product', 'Y', 'N', 'Dairy');

select *from products;

select count(*)/(select count(*) from products)*100 from products where low_fats='Y';

## total number recyclable product with category
select category, count(*) from products where recyclable='Y' group by category

## product that are low_fat or recyclable
select  count(*) from products where low_fats='Y' or recyclable='Y'