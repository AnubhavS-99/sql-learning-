 CREATE TABLE emp_details2(
         EMP_id SERIAL PRIMARY KEY,
		 DEPARTMENT VARCHAR(50),
		 SALARY NUMERIC(10,2),
		 HIRED_DATE date,
		 LOCATION VARCHAR(50)
		 



 );


CREATE TABLE Employees3(
  employee_id SERIAL PRIMARY KEY,
  first_name varchar(50),
  last_name varchar(50),
  department_id INT
);
INSERT INTO Employees3(first_name,last_name, department_id)
VALUES('Rahul','sharma',101),
       ('priya','mehta',102),
	   ('ankit','verma',103),
	   ('simran','kaur',104),
	   ('aman','singh',105);
SELECT*FROM Employees3;	   

	CREATE TABLE Departments(
department_id INT PRIMARY KEY,
department_name varchar(50)
	);

INSERT INTO Departments(department_id,department_name)
VALUES(101,'SALES'),
(102,'MARKETING'),
(103,'IT'),
(104,'HR');
SELECT*FROM Departments;


SELECT e.employee_id,e.first_name,e.last_name,d.department_id,d.department_name
 FROM employees3 e
cross join 
 departments d;

 SELECT e1.first_name AS employees_name1,
        e2.first_name AS employees_name2
from employees3 e1 join employees3 e2 
on e1.department_id=e2.department_id AND e1.employee_id!= e2.employee_id;
 
 