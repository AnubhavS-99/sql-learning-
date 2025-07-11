CREATE TABLE EMP_DET101(
        					
	employee_id		SERIAL	PRIMARY KEY	,
	first_name		VARCHAR(50)   NOT NULL	,	
	last_name		VARCHAR(50)   NOT NULL	,	
	department		VARCHAR(50)   NOT NULL	,	
	salary		NUMERIC(10,2)   NOT NULL,		
	joining_date		DATE   NOT NULL	,	
	age		NUMERIC(3)   NOT NULL		

);
SELECT *FROM EMP_DET101;

COPY
EMP_DET101(employee_id, first_namE, last_name, department, salary, joining_date, age
)
FROM 'C:\Users\anubh\OneDrive\Documents\sql\employee_data.csv'
DELIMITER','
CSV HEADER;


select*from EMP_DET101
WHERE AGE>=60 OR salary >9000000 ;


SELECT *from EMP_DET101
WHERE first_name LIKE 'A%';

SELECT * FROM EMP_DET101 

ORDER BY salary desc 

limit 10;

SELECT COUNT (DISTINCT age)FROM EMP_DET101;



















-----aggregate functions 
DROP TABLE IF EXISTS products;
 CREATE TABLE products(
     product_id SERIAL primary key,
	 product_name varchar(50)   not null,
	 category varchar(50),
	 price numeric(10,2),
	 quantity INT,
	 added_date DATE,
	 discount_rate numeric(5,2)
	 
 );
  INSERT INTO products (product_name,category,price,quantity,added_date,discount_rate)
     VALUES('laptop','electronics',75000.50,10,'2024-01-15',10.00),
	 ('smartphone','electronics',45000.99,25,'2024-02-20',5.00),
	 ('headphone','accessories',1500.75,50,'2024-03-05',15.00),
	 ('office chair ','furniture',55000.00,20,'2023-12-01',20.00),
	 ('desk','furniture',80000.00,15,'2023-11-20',12.00),
	 ('monitor ','electronics',12000.00,8,'2024-01-10',08.00),
	 ('printer','electronics',9500.50,5,'2024-02-01',7.50),
	('mouse','electronics',750.50,40,'2024-03-18',10.00),
	 ('keyboared','accessories',1250.00,35,'2024-03-18',10.00),
	 ('tablet','electronics',30000.00,12,'2024-02-28',5.00)


select*from products;

----now() for date and time 
SELECT NOW() AS DATEANDTIME ;
-----DATE DISPLAY
SELECT CURRENT_DATE  AS  todays_date;

SELECT added_date,current_date,(CURRENT_DATE-added_date) AS DAYS_DIFF
FROM products;

----EXTRACT() FUNCTION 
SELECT product_name,
     EXTRACT( YEAR FROM added_date )AS YEAR_ADDED,
	   EXTRACT( MONTH FROM added_date )AS MONTH_ADDED,
	     EXTRACT( DAY FROM added_date )AS DAY_ADDED

		 FROM products;
		 
SELECT product_name,
age(CURRENT_DATE,added_date) AS AGE_SINCE_ADDED
FROM products;

SELECT product_name,
TO_CHAR(added_date,'DD-MON-YYYY') AS FORMATED_DATE
FROM products;

SELECT product_name,added_date,
      added_date + INTERVAL '2 months ' AS new_date
	  FROM products;

-----CASE FUNCTION
SELECT product_name,price,
       CASE 
	      WHEN price >=50000.00 then 'EXPENSIVE'
		  WHEN  price>=10000.00 AND price<=49999 THEN 'MODERATE'
		  ELSE 'AFFORDABLE'
		  END AS price_category
		  FROM products;

----question 

SELECT product_name ,quantity ,
           CASE 
		   WHEN quantity >=10 then 'IN STOCK'
		   WHEN quantity >=5 AND quantity <=9 THEN 'LIMITED STOCK'
		   ELSE 'OUT OF STOCK SOON'
		   END AS STOCK_QUANTITY
		   FROM products;

		   
SELECT product_name,category,
           CASE 
		     WHEN category LIKE 'electronics%' THEN 'electronic_item'
		    WHEN category LIKE 'furniture%' THEN 'furniture_item'
			ELSE 'accesories_item '
			END AS CATEGORY_ITEMS
			FROM products;

select*from products;
			
ALTER TABLE products
ADD COLUMN discount_price NUMERIC(10,2);

UPDATE products
SET discount_price = price*0.8
WHERE product_name NOT IN ('laptop','smartphone');

SELECT  product_id,product_name,category,price,quantity,added_date,discount_rate,discount_price,
  COALESCE(discount_price,price) AS final_price
  FROM products;




	

			
ALTER TABLE products
ADD COLUMN final__price NUMERIC(10,2);
 
SELECT product_name,category,price,
       ROW_NUMBER() OVER(PARTITION BY category ORDER BY price  DESC)AS row_num
	   FROM products;

 
SELECT product_name,category,price,
       DENSE_RANK() OVER(PARTITION BY category ORDER BY price  DESC)AS DENSE_num
	   FROM products;


SELECT *FROM EMP_DET101;
	select*from products;   
   


