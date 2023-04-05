-- restaurant database 
-- 5 tables 
-- write 3-5 query 
--1 with clause 
--1 subquery 

.open restaurant.db

  --1st table
create table res_menus(
  menu_id int, 
  menu_name text,
  menu_price int
);

insert into res_menus values
  (1, 'Pepperoni', 500),
  (2, 'Margherita', 300),
  (3, 'Veggie', 380),
  (4, 'Hawaiian', 450),
  (5, 'Panacotta', 200),
  (6, 'Creme brulee', 270),
  (7, 'Chardonnay', 550),
  (8, 'Cabernet Sauvignon', 650),
  (9, 'Riesling', 550);

.mode column 
select * from res_menus;

--2nd table 
 res_employee
employee_id (INT)
employee_name (Text)
employee_lastname (Text)
employee_position (Text) 
customers_salary (INT)

select * from res_employee;

--3rd table 
create table raws (
  raw_id int,
  raw_name text, 
  raw_cost int, 
  raw_unit int
);
insert into raws values
(1, 'flour', 20000, 50 ), 
(2, 'cheese', 20000, 20),
(3, 'ketchup', 15000, 100),
(4, 'oregano' ,3000, 10 ), 
(5, 'onion', 1000, 50 ), 
(6, 'tomato', 15000, 30),
(7, 'wine', 33000, 30);

--4th table 
create table res_orders(
  orders_id int,
  customers_name text,
  menu_id int,
  payment_date text,
  quantity int
  );
insert into res_orders values
(1,'san', 1, '2023-02-02', 2),
(2, 'wan', 3, '2023-02-02', 10), 
(3, 'pan', 2, '2023-02-04', 3),
(4, 'lan', 4, '2023-02-05', 2), 
(5, 'van', 5, '2023-02-02', 3),
(6, 'van', 6, '2023-02-02', 4),
(7, 'san', 7, '2023-02-16', 5),
(8, 'lan', 8,'2023-02-18', 4),
(9, 'wan', 9, '2023-02-20', 2),
(10, 'pan', 9, '2023-02-21', 4),
(11, 'lan', 5, '2023-02-22', 2),
(12, 'van', 3, '2023-02-28', 5),
(13, 'san', 2, '2023-02-28', 8),
(14, 'wan', 9, '2023-02-28', 4),
(15, 'pan', 3, '2023-02-28', 1),
(16, 'gan', 4, '2023-02-13', 4 ),
(17, 'ban', 5, '2023-02-13', 2 );

--5th table
create table res_customers (
  customers_name text,
  customers_gender text, 
  customers_city text,
  customers_email text
);
insert into res_customers values
('san', 'female', 'Paris', 'san@gmail.com'),
('wan', 'male', 'London', 'wan@gmail.com'),
('lan', 'female', 'Copenhagen', 'lan@yahoo.com'), 
('pan', 'female', 'Bangkok', 'pan@yahoo.com'),
('gan', 'male', 'Rio', 'gan@yahoo.com'),
('ban', 'male', 'Osaka', 'ban@gmail.com');

-- write 3-5 query 

--1st query To create employee email under the same email domain 'Peppina'
SELECT LOWER(employee_name) || "" || '@peppina.com' as employee_email from res_employee;

-- 2nd query What are avg, min, max cost of each raw material ?

SELECT 
	ROUND(AVG(raw_cost),2) as average_raw,
    MIN(raw_cost) as min_raw,
    MAX(raw_cost) as max_raw from raws;

--3rd How many orders does each customer ? 
SELECT customers_name, count(*) from res_orders
GROUP by customers_name;

--4th What is the total number of order on each menu? 
SELECT menu_name, count(*) as count_menu from res_menus, res_orders
where res_menus.menu_id = res_orders.menu_id
group by menu_name;

--5th How many regular order and promotion order are ordered by customers? 
SELECT customers_name, count(*),
	case 
    WHEN payment_date = '2023-02-02' THEN 'promotion_order' 
    else 'regular_order' 
END
from res_orders
GROUP by customers_name;


--sub query for alcohol order 
SELECT * from (
SELECT 
* 
from res_menus
JOIN res_orders on res_menus.menu_id = res_orders.menu_id
  )
  WHERE menu_id between 7 and 9 ;

--comon table expression (with clause)
with sub as (
	SELECT 
customers_name,
menu_name
from res_menus
JOIN res_orders on res_menus.menu_id = res_orders.menu_id
  )
SELECT menu_name, COUNT(*) from sub
where menu_name = 'Riesling';
