CREATE TABLE products (
  product_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  sku_code CHAR(8),
  price NUMERIC(10,2),        -- ✅ number → numeric
  stock_quantity INT CHECK(stock_quantity >= 0),
  is_available BOOLEAN DEFAULT TRUE,
  category TEXT NOT NULL,
  added_on DATE DEFAULT CURRENT_DATE,
  last_update TIMESTAMP DEFAULT NOW()
);


insert into products(name,sku_code,price,stock_quantity,is_available,category)
values  ('HP Laptop',     'SKU00001', 55000.00,  15, TRUE,  'Electronics'),
  ('Dell Monitor',  'SKU00002', 18000.50,  8,  TRUE,  'Electronics'),
  ('Apple MacBook', 'SKU00003', 125000.00, 5,  TRUE,  'Electronics'),
  ('Gaming Chair',  'SKU00004', 12000.75,  20, TRUE,  'Furniture'),
  ('USB Hub',       'SKU00005', 1500.00,   50, TRUE,  'Accessories'),
  ('Mechanical KB', 'SKU00006', 4500.00,   30, TRUE,  'Accessories'),
  ('Sony Headset',  'SKU00007', 8999.99,   12, TRUE,  'Audio'),
  ('Logitech Mouse','SKU00008', 2500.00,   25, FALSE, 'Accessories'),
  ('Webcam HD',     'SKU00009', 3200.00,   0,  FALSE, 'Electronics'),
  ('LED Desk Lamp', 'SKU00010', 950.50,    40, TRUE,  'Furniture');



  
select name,price from products;

select * from products where category='Electronics';

select category, count(*) from products
group by category 
having count(*)>=1 ;

select name,price from products  order by price desc;

select name,price from products  order by price desc limit 3;

select name as item_name , price as item_price from products;

SELECT DISTINCT category 
FROM products;

select * from products where price between 5000 and 20000;

select * from products where category in ('Furniture','Electronics')  -- ham (condition or condition or condition ) ye baar baar likhne ki jagah in ka use kar sakte hai.

select * from products where category != ‘Electronics’;
select name , price from product where price>=20000;

select * from product where sku_code like ‘_9%’;    --yaha wild card ki jagah kuch bhi le lo but second place pe 9 rahna chhiye and uske baad jo bhi chrecter ya number hai le lega.

select * from product where sku_code like ‘%9%’;     --start se kuch bhi lo and end se kuch bhi lo bas beech me 9 rahna chhiye

select * from product where sku_code like ‘9%’;     --start me 9 and uske baad kuch bhi le lo jo hai sab aa jayega 

select * from product where sku_code like ‘%9’;  --start se kuch bhi le lo lekin last me 9 rahna chahiye    
  
select * from product where sku_code like ‘%9_’;  --start se kuch bhi le lo lekin last se  2nd last charectar 9 hona chahiye and last wala kuch bhi ho.


--Clauses with aggregation function or oprators
select name,price from products  order by price asc limit 1;     

select name, avg(price) from products 
where category in ('Furniture','Electronics') 
group by name;

select name,stock_quantity from  products where stock_quantity>=20 and price != 1500;
select category, max(price) as max_price from products group by category;

select distinct upper(category) as upper_cat from products;



