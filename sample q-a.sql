SELECT*FROM emp_details2 ORDER BY emp_id ;
INSERT INTO emp_details2(department,salary,hired_date,location)
      VALUES('HR MANAGER',85000.00,'15/2/20217','BANGLORE'),
	         ('DATA ANALYSIST',75000.00,'25/5/2019','NOIDA'),
			 ('web dev',80000.00,'15/5/20217','BANGLORE'),
			 ('software dev',83000.00,'15/11/20217','BANGLORE'),
			 ('ux designer',85000.00,'15/12/20217','BANGLORE')
			 
UPDATE  emp_details2
SET location='chennai'
where emp_id= 3;



UPDATE emp_details2
set salary=salary+10000
where  department ='HR MANAGER';


---- report data------
CREATE TABLE PROJECT_REPORT (
	PROJECT_NO SERIAL PRIMARY KEY,
	ALLOTED_TEAM VARCHAR(50),
	TEAM_MEMBERS NUMERIC(10),
	ISSUED_DATE DATE
);

SELECT
	*
FROM
	PROJECT_REPORT
ORDER BY
	PROJECT_NO ASC;

INSERT INTO
	PROJECT_REPORT (
		PROJECT_NO,
		ALLOTED_TEAM,
		TEAM_MEMBERS,
		ISSUED_DATE
	)
VALUES
	(1, 'alpha', 5, '15/2/17'),
	(2, 'beta', 6, '10/2/17'),
	(3, 'gamma', 10, '16/2/17'),
	(4, 'delta', 9, '6/2/17')
UPDATE PROJECT_REPORT
SET	TEAM_MEMBERS = 8
WHERE
	PROJECT_NO = 3;


ALTER  TABLE project_report
ALTER COLUMN team_members type  integer;




---CREATE A TABLE 
DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
           employees_id SERIAL PRIMARY KEY ,
		   first_name varchar(50) not null,
		   last_name  varchar(50)not null ,
		   department varchar(50),
		   salary DECIMAL(10,2) CHECK(salary>0),
		   joining_date DATE NOT NULL,
		   age INT CHECK(age>18)
 );  

 -----insert some data 
  INSERT INTO employees (first_name,last_name,department,salary,joining_date ,age)
  VALUES
      ( 'Amit','sharma','IT',60000.00,'2022-05-01',29),
	   ( 'Neha','Patel','HR',55000.00,'2021-08-15',32),
	    ( 'Ravi','Kumar','Finanace',70000.00,'2020-03-10',35),
		 ( 'Anjali','Verma','IT',65000.00,'2019-11-22',28),
		  ( 'Suresh','Reddy','Operations',50000.00,'2023-01-10',26);
		  

------QUERY QUESTIONS

 SELECT * FROM employees order by employees_id asc ;

 ----RETRIEVE ALL EMPLOYEES FIRST NAME AND DEPARTMENTS

SELECT first_name,department  FROM employees;

----UPDATE SALARY OF ALL EMPLOYEES IN 'IT' BY INC 10%

UPDATE employees
set salary=salary+ (salary*0.1)
where department = 'IT';


----DELETE ALL EMPLOYEE WHO ARE OLDER THAN 34

DELETE FROM employees
where age >=34;


---add new column 'email' to the 'employees' table 

ALTER TABLE employees
ADD COLUMN Email varchar(50);

---RENAME DEPARTMENT COLUMN TO DEPT_NAME 

ALTER TABLE employees
RENAME COLUMN department TO dept_name;



--RETRIEVE DATA OF ALL EMPLOYEES WHO JOINED 	AFTER JANUARY 1,2021.

SELECT *FROM employees
where joining_date > '2021-01-01';

---ALTER DATA TYPE OF SALARY TO INTEGER 

ALTER TABLE employees
ALTER COLUMN  salary type integer using salary::integer;


---list all the employees with their age and salary in descending orderof salary


SELECT first_name,last_name,age,salary FROM employees
 order by  salary  desc;

 ---INSERT A NEW EMPLOYEE WITH FOLLOWING DETAILS ;
 ---('RAJ','SINGH','MARKETING',60000,'2023-09-15',30)

INSERT INTO employees(first_name,last_name,department,salary,joining_date,age)
VALUES('RAJ','SINGH','MARKETING',60000,'2023-09-15',30);


---UPDATE AGE OF EMPLOYEES TO AGE+1 TO EVERY EMPLOYEES
update employees
set age=age+1;





			 