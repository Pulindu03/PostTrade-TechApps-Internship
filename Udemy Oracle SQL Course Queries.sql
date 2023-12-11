--Udemy Orcale SQL Course
--Candidate: Pulindu Samarawickrema


SELECT * FROM employee;

SELECT * FROM department;


SELECT employee_id, first_name, last_name, hire_date
FROM employee;

SELECT product_id, product_name, price
FROM product;



SELECT employee_id, first_name, last_name, salary 
FROM employee
WHERE first_name = 'Jessica';

SELECT employee_id, first_name, last_name, salary 
FROM employee
WHERE last_name = 'Butler';

SELECT department_id, department_name
FROM department


--NOT EQUAL Operators:
--<>, !=

SELECT employee_id, first_name, last_name FROM employee
WHERE last_name <> 'Jones';

SELECT employee_id, first_name, last_name FROM employee
WHERE last_name != 'Jones';

SELECT employee_id, first_name, last_name 
FROM employee
WHERE employee_id >= 5;


--Partial Filtering:
--LIKE (%- multiple) (_- before)


SELECT employee_id, first_name, last_name 
FROM employee
WHERE last_name LIKE 'Bu%';

SELECT employee_id, first_name, last_name 
FROM employee
WHERE first_name LIKE 'Ann_';

SELECT employee_id, first_name, last_name 
FROM employee
WHERE first_name LIKE '%o%';



--Date Filter:

SELECT employee_id, first_name, last_name, hire_date
FROM employee
WHERE hire_date = '03-OCT-2010';


--How to find the Date type:

SELECT value
FROM SYS.NLS_DATABASE_PARAMETERS
WHERE parameter = 'NLS_DATE_FORMAT'

--= DD-MON-RR

SELECT employee_id, first_name, last_name, hire_date
FROM employee
WHERE hire_date > '03-OCT-2010';



--Multiple Conditions:
--AND / OR

SELECT employee_id, first_name, last_name, salary 
FROM employee
WHERE first_name = 'Jessica' AND last_name = 'Elliott';

SELECT employee_id, first_name, last_name, salary 
FROM employee
WHERE first_name = 'John' OR last_name = 'Butler';

--More than 2 Filters:
--AND / OR / ()

SELECT employee_id, first_name, last_name, hire_date, salary
FROM employee
WHERE (first_name = 'Ann'
AND hire_date > '01-JAN-2010')
OR salary < 70000;

SELECT employee_id, first_name, last_name, hire_date, salary
FROM employee
WHERE first_name = 'Barbara'
AND (hire_date > '01-DEC-2014'
OR salary < 70000);



--How to Find NULL values and NOT NULL values:
--- IS NULL / IS NOT NULL

SELECT first_name, salary
FROM employee
WHERE salary IS NULL;

SELECT first_name, salary
FROM employee
WHERE salary IS NOT NULL;


--Removing Duplicate Rows:
--SELECT DISTINCT

SELECT first_name, last_name
FROM employee
WHERE last_name = 'Williams';

SELECT last_name
FROM employee;

SELECT DISTINCT last_name
FROM employee;



--IN and NOT IN:

SELECT employee_id, first_name, last_name, hire_date
FROM employee
WHERE last_name = 'Foster'
OR last_name = 'Elliott'
OR last_name = 'Perry'
OR last_name = 'Lawson'
OR last_name = 'Mitchell';

SELECT employee_id, first_name, last_name, hire_date
FROM employee
WHERE last_name IN ('Foster', 'Elliott', 'Perry', 'Lawson', 'Mitchell');

SELECT employee_id, first_name, last_name, hire_date
FROM employee
WHERE last_name NOT IN ('Foster', 'Elliott', 'Perry', 'Lawson', 'Mitchell');



--BETWEEN and NOT BETWEEN:

SELECT employee_id, first_name, last_name, hire_date
FROM employee
WHERE hire_date >= '01-JAN-2016'
AND hire_date <= '01-DEC-2016';

--Using BETWEEN keyword:
SELECT employee_id, first_name, last_name, hire_date
FROM employee
WHERE hire_date BETWEEN '01-JAN-2016' AND '01-DEC-2016';

SELECT employee_id, first_name, last_name, hire_date
FROM employee
WHERE employee_id BETWEEN 10 AND 15;

SELECT employee_id, first_name, last_name, hire_date
FROM employee
WHERE hire_date NOT BETWEEN '01-JAN-2016' AND '01-DEC-2016';


--Using ALL keyword:

SELECT employee_id, first_name, last_name, salary
FROM employee
WHERE salary >= 30000
AND salary >= 40000
AND salary >= 50000;

SELECT employee_id, first_name, last_name, salary
FROM employee
WHERE salary >= ALL (30000, 40000, 50000);

SELECT employee_id, first_name, last_name, salary
FROM employee
WHERE salary < ALL (30000, 40000, 50000);



--Using ANY Keyword:

SELECT employee_id, first_name, last_name, salary
FROM employee
WHERE salary >= ANY (30000, 40000, 50000);

SELECT employee_id, first_name, last_name, salary
FROM employee
WHERE salary < ANY (30000, 40000, 50000);

SELECT employee_id, first_name, last_name, salary
FROM employee
WHERE salary = ANY (30000, 40000, 50000);



--Sorting records with ORDER:

SELECT employee_id, first_name, last_name, salary, hire_date
FROM employee
ORDER BY last_name ASC

SELECT employee_id, first_name, last_name, salary, hire_date
FROM employee
ORDER BY first_name ASC

SELECT employee_id, first_name, last_name, salary, hire_date
FROM employee
ORDER BY hire_date DESC

SELECT employee_id, first_name, last_name, salary, hire_date
FROM employee
ORDER BY salary DESC


SELECT employee_id, first_name, last_name, salary, hire_date
FROM employee
ORDER BY hire_date DESC

SELECT employee_id, first_name, last_name, salary, hire_date
FROM employee
ORDER BY salary DESC



--Sorting with ORDER BY for multiple values:

SELECT employee_id, first_name, last_name, salary, hire_date
FROM employee
ORDER BY last_name ASC, first_name ASC, salary DESC;

SELECT employee_id, first_name, last_name, salary, hire_date
FROM employee
ORDER BY employee_id DESC, hire_date DESC, first_name ASC;




--SET Operators:
--UNION Operator (Remove Duplicates)
--Combining 2 Tables

--Adding a Column to Identify (Employee or Customer)
SELECT 'Employee', first_name, last_name
FROM employee
UNION
SELECT 'Customer', first_name, last_name
FROM customer
ORDER BY first_name, last_name;

--Adding (2,3) for ordering with columns (Second Column and Third Column)
SELECT 'Employee', first_name, last_name
FROM employee
UNION
SELECT 'Customer', first_name, last_name
FROM customer
ORDER BY 2, 3;



--UNION ALL Operator:
--(with the Duplicates)

SELECT first_name, last_name
FROM employee
UNION
SELECT first_name, last_name
FROM customer
ORDER BY 1, 2;

SELECT first_name, last_name
FROM employee
UNION ALL
SELECT first_name, last_name
FROM customer
ORDER BY 1, 2;


--INTERSECT Operator:
--(Common entries among the 2 Tables)

SELECT first_name, last_name
FROM employee
INTERSECT
SELECT first_name, last_name
FROM customer;


--MINUS Operator:
--(Only the unique entries of the Query 1)

SELECT first_name, last_name
FROM employee
MINUS
SELECT first_name, last_name
FROM customer;


--3 or More Set Operators at Once:

SELECT employee_id, first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 30000 AND 40000
UNION
SELECT employee_id, first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 20000 AND 30000
INTERSECT
SELECT employee_id, first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 30000 AND 35000
MINUS
SELECT employee_id, first_name, last_name, salary
FROM employee
WHERE salary BETWEEN 20000 AND 23000;


--Functions & Groupings
--COUNT Function:
--(Counting the records of tables)

SELECT COUNT(*)
FROM employee;

--Verifying it
SELECT *
FROM employee;

SELECT COUNT(1)
FROM customer;

SELECT COUNT(*)
FROM department;


--Using COUNT function in other ways:

SELECT *
FROM employee
WHERE first_name = 'Barbara';

SELECT COUNT(*)
FROM employee
WHERE first_name = 'Barbara';

SELECT COUNT(salary)
FROM employee;

SELECT *
FROM employee
WHERE salary IS NULL;

SELECT COUNT(*)
FROM employee
WHERE salary IS NULL;

SELECT COUNT (DISTINCT last_name)
FROM employee;


--Counting Data within Groups Using GROUP BY:

SELECT last_name, COUNT(*)
FROM employee
GROUP BY last_name 
ORDER BY last_name ASC;

SELECT *
FROM product;

SELECT department_id, COUNT(*)
FROM product
GROUP BY department_id;


--Filtering data before GROUP BY 

SELECT last_name, COUNT(*)
FROM employee
WHERE last_name LIKE 'B%'
GROUP BY last_name;

SELECT salary, COUNT(*)
FROM employee
WHERE salary > 100000
GROUP BY salary;

--Using ORDER BY for Filtering with GROUP BY

SELECT last_name, COUNT(*)
FROM employee
WHERE last_name LIKE 'B%'
GROUP BY last_name
ORDER BY COUNT(*);

SELECT salary, COUNT(*)
FROM employee
WHERE salary > 100000
GROUP BY salary
ORDER BY salary DESC;


--GROUP BY with Multiple Columns

SELECT first_name, last_name, COUNT(*)
FROM employee
GROUP BY first_name, last_name
ORDER BY COUNT(*) DESC;

SELECT first_name, last_name, department_id, COUNT(*)
FROM employee
GROUP BY first_name, last_name, department_id
ORDER BY first_name, last_name;


--GROUP BY with HAVING

SELECT last_name, COUNT(*)
FROM employee
GROUP BY last_name
HAVING COUNT(*) > 1;

SELECT first_name, last_name, COUNT(*)
FROM employee
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;


--Using SUM Function:

SELECT SUM(salary)
FROM employee;

SELECT *
FROM product;

SELECT SUM(price)
FROM product;

SELECT department_id, SUM(salary)
FROM employee
GROUP BY department_id
ORDER BY SUM(salary) DESC;


--Using MIN and MAX Functions:

SELECT MIN(salary), MAX(salary)
FROM employee;

SELECT MIN(hire_date), MAX(hire_date)
FROM employee;

SELECT department_id, MIN(salary), MAX(salary)
FROM employee
GROUP BY department_id
ORDER BY department_id;

SELECT MIN(last_name), MAX(last_name)
FROM employee;


--AVG Function:

SELECT AVG(salary)
FROM employee;

SELECT department_id, AVG(salary)
FROM employee
GROUP BY department_id
ORDER BY AVG(salary) DESC;


--Table Aliases:

SELECT employee_id, first_name, last_name, e.salary
FROM employee e;

SELECT employee_id, first_name, last_name, e.salary
FROM employee e
WHERE e.salary < 30000;


--Column Aliases:

SELECT employee_id, first_name, last_name, e.salary AS annual_salary
FROM employee e;

SELECT employee_id, first_name, last_name, e.salary AS annual_salary, e.salary/12 AS monthly_salary
FROM employee e;

SELECT department_id, COUNT(*) AS employee_count
FROM employee
GROUP BY department_id
ORDER BY department_id;


--Adding Inner Join:

SELECT employee_id, 
first_name, 
last_name, 
department_name
FROM employee
JOIN department ON employee.department_id = department.department_id;

--Adding Qualifier:

SELECT employee_id,
first_name,
last_name,
department_name,
department.department_id
FROM employee
JOIN department ON employee.department_id = department.department_id;

--Adding Tabel Aliases:

SELECT e.employee_id,
e.first_name,
e.last_name,
d.department_name,
d.department_id,
e.salary
FROM employee e
JOIN department d ON e.department_id = d.department_id
WHERE e.salary > 60000;



--LEFT OUTER JOIN or LEFT JOIN:
--(Shows all records in the Left section and otherwise a NULL value)

SELECT c.customer_id,
c.first_name,
c.last_name,
co.order_date
FROM customer c
LEFT JOIN customer_order co ON c.customer_id = co.customer_id;
--WHERE co.order_date IS NULL;

SELECT d.department_id,
d.department_name,
e.first_name,
e.last_name
FROM department d
LEFT JOIN employee e ON e.department_id = d.department_id
ORDER BY d.department_id;


--RIGHT OUTER JOIN or RIGHT JOIN:
--(Shows all records in the Right section and otherwise a NULL value)

SELECT d.department_id,
d.department_name,
e.first_name,
e.last_name,
e.hire_date
FROM employee e
RIGHT JOIN department d ON d.department_id = e.department_id
ORDER BY d.department_id;

--(Employees with no departments)

SELECT d.department_id,
d.department_name,
e.first_name,
e.last_name,
e.hire_date
FROM department d
RIGHT JOIN employee e ON e.department_id = d.department_id
ORDER BY d.department_id;


--FULL OUTER JOIN or FULL JOIN
--(Combining both LEFT JOIN and RIGHT JOIN)

SELECT d.department_id,
d.department_name,
e.employee_id,
e.first_name,
e.last_name,
e.hire_date
FROM department d
FULL JOIN employee e ON e.department_id = d.department_id
ORDER BY d.department_id, e.employee_id;


--NATURAL JOIN:

SELECT department_id,
d.department_name,
e.employee_id,
e.first_name,
e.last_name,
e.hire_date
FROM employee e
NATURAL JOIN department d;

SELECT product_id,
product_name,
department_id,
department_name
FROM department
NATURAL JOIN product;


--Cartesian Join or CROSS JOIN:

SELECT employee_id, first_name, department_name
FROM employee, department; 

SELECT employee_id, first_name, department_name
FROM employee
CROSS JOIN department;


--SELF JOIN:

SELECT emp.employee_id,
emp.first_name,
emp.last_name,
emp.manager_id,
mgr.first_name,
mgr.last_name
FROM employee emp
LEFT JOIN employee mgr ON emp.employee_id = mgr.employee_id;


--Joining MANY TABLES:

SELECT c.customer_id,
c.first_name,
c.last_name,
c.address_state,
co.order_date,
co.order_id
FROM customer c
JOIN customer_order co ON c.customer_id = co.customer_id;

--Joining 3 Tables:

SELECT c.customer_id,
c.first_name,
c.last_name,
c.address_state,
co.order_date,
co.order_id,
p.price,
p.product_name
FROM customer c
JOIN customer_order co ON c.customer_id = co.customer_id
JOIN product p ON co.product_id = p.product_id
ORDER BY c.customer_id, co.order_id;


--Adding LEFT JOIN:

SELECT c.customer_id,
c.first_name,
c.last_name,
c.address_state,
co.order_date,
co.order_id,
p.price,
p.product_name,
d.department_name
FROM customer c
LEFT JOIN customer_order co ON c.customer_id = co.customer_id
LEFT JOIN product p ON co.product_id = p.product_id
LEFT JOIN department d ON p.department_id = d.department_id
ORDER BY c.customer_id, co.order_id;


--Alternative JOIN Syntax (+):

--LEFT JOIN
SELECT employee_id,
first_name,
last_name
department_id,
department_name
FROM employee, department
WHERE employee.department_id = department.department_id(+);

--RIGHT JOIN
SELECT employee_id,
first_name,
last_name
department_id,
department_name
FROM employee, department
WHERE employee.department_id(+) = department.department_id;

--Adding Mutiple WHERE conditions

SELECT employee_id,
first_name,
last_name
department_id,
department_name,
salary,
hire_date
FROM employee, department
WHERE salary > 50000
AND hire_date > '01-JAN-2012'
AND employee.department_id = department.department_id;


--STRIN Function:

SELECT customer_id,
first_name,
last_name,
address_state,
email_address,
INSTR (email_address, '@'),
LENGTH (address_state)
FROM customer;

--Adding WHERE condition

SELECT customer_id,
first_name,
last_name,
address_state,
email_address,
INSTR (email_address, '@'),
LENGTH (address_state)
FROM customer
WHERE INSTR (email_address, '@') > 0
AND LENGTH (address_state) = 2 
ORDER BY email_address DESC;



--Nesting Functions within Functions:
--SUBSTR (Sub String)

SELECT customer_id,
first_name,
last_name,
address_state,
email_address,
INSTR (email_address, '@'),
LENGTH (address_state),
SUBSTR (email_address, INSTR (email_address, '@'), LENGTH (email_address)) AS email_domain
FROM customer;

--If want to remove the '@'

SELECT customer_id,
first_name,
last_name,
address_state,
email_address,
INSTR (email_address, '@'),
LENGTH (address_state),
SUBSTR (email_address, INSTR (email_address, '@')+1, LENGTH (email_address)) AS email_domain
FROM customer;



--NUMBER Function:

SELECT product_id,
product_name,
price,
ROUND (price), --nearest Decimal Point
ROUND (price, 1), --specific Decimal Point
CEIL (price), --nearest whole number
FLOOR (price) --show number
FROM product;


SELECT product_id,
product_name,
price,
price * 9 * 0.85 AS discount_price,
ROUND (price * 9 * 0.85),
ROUND (price * 9 * 0.85, 2),
CEIL (price * 9 * 0.85),
FLOOR (price * 9 * 0.85)
FROM product
WHERE product_id = 1;



--DATE Function:

SELECT employee_id,
first_name,
last_name,
hire_date,
SYSDATE
FROM employee;

--Adding Months

SELECT employee_id,
first_name,
last_name,
hire_date,
SYSDATE,
ADD_MONTHS (hire_date, 60) AS five_years
FROM employee;

--Adding MONTHS_BETWEEN keyword

SELECT employee_id,
first_name,
last_name,
hire_date,
SYSDATE,
MONTHS_BETWEEN (SYSDATE, hire_date)/12 AS current_years,
ROUND (MONTHS_BETWEEN (SYSDATE, hire_date)/12) AS current_years
FROM employee;



--Data Types and Converstion Functions:

SELECT employee_id,
first_name,
last_name,
hire_date,
TO_CHAR (hire_date, 'YYYY-MM-DD')
FROM employee;

--Convert TO_DATE

SELECT TO_DATE ('2023_12_06', 'YYYY_MM_DD')
FROM dual;

--Covert TO_NUM

SELECT TO_NUMBER('200')
FROM dual;


--CASE Statement:

SELECT product_id,
product_name,
price,
CASE WHEN price > 200 THEN 'Larger than 200'
WHEN price > 100 AND price <= 200 THEN 'Between 200-100'
WHEN price > 50 AND price <= 100 THEN 'BETWEEN 100-50'
ELSE 'Below 50'
END price_group
FROM product;

--If Multiple WHEN statements

SELECT customer_id,
first_name
last_name,
address_state,
CASE
WHEN address_state IN ('NY', 'SC', 'FL', 'IN') THEN 'EAST'
WHEN address_state IN ('CA', 'OR', 'TX') THEN 'WEST'
ELSE 'Unknown'
END address_group
FROM customer;


--Single Row Subqueries:

SELECT employee_id,
first_name,
last_name,
salary
FROM employee
WHERE salary > (
    SELECT AVG (salary)
    FROM employee)
ORDER BY salary;


--Multi Row Subqueries:

SELECT employee_id,
first_name,
last_name,
department_id
FROM employee
WHERE department_id IN (
    SELECT department_id
    FROM department
    WHERE department_name IN ('Finance', 'Sales')
);



--Inserting Data:

INSERT INTO employee (employee_id, first_name, last_name, department_id)
VALUES (300, 'John', 'Smith', 3);

--Verifying the data

SELECT *
FROM employee
WHERE employee_id = 300;

--Inserting Data with INSERT ALL

INSERT ALL
INTO employee (employee_id, first_name, last_name, department_id) VALUES (301, 'Mark', 'Spencer', 4)
INTO employee (employee_id, first_name, last_name, department_id) VALUES (302, 'Alison', 'Smith', 5)
SELECT * FROM dual;

SELECT *
FROM employee
WHERE employee_id IN (301, 302);


--Inserting Data from another Table:

INSERT INTO employee (employee_id, first_name, last_name)
SELECT 303, first_name, last_name 
FROM customer
WHERE customer_id = 1;


SELECT first_name, last_name 
FROM customer
WHERE customer_id = 1;

SELECT * 
FROM employee
WHERE employee_id = 303;


--Updating Data:

SELECT * FROM employee
WHERE employee_id = 100;

UPDATE employee
SET salary = salary + 10000
WHERE employee_id = 100;


--Updating Multiple Columns

SELECT *
FROM employee
WHERE employee_id IN (150, 60, 70);


UPDATE employee
SET manager_id = 30,
salary = salary + 10000
WHERE employee_id IN (150, 60, 70);



--Deleting Data:

SELECT *
FROM employee
WHERE employee_id = 150;

DELETE FROM employee
WHERE employee_id = 150;


--Deleting Multiple Rows

SELECT *
FROM employee
WHERE last_name = 'Larson';

DELETE FROM employee
WHERE last_name = 'Larson';



--COMMIT and ROLLBACK:

SELECT * FROM product;

INSERT INTO product (product_id, product_name, price, department_id)
VALUES (9, 'Large Table', 250.12, 4);

COMMIT;

INSERT INTO product (product_id, product_name, price, department_id)
VALUES (12, 'Red Chair', 100.45, 5);

ROLLBACK;



--Truncating Data:

TRUNCATE FROM customer_order; --ROLLBACK is not ALLOWED


--Create a TABLE:

CREATE TABLE job_role (
job_role_id NUMBER(10),
job_role_name VARCHAR2(50),
role_created_date DATE
);

SELECT * FROM job_role;


--ALTER TABLE:

--Adding a Column

SELECT * FROM job_role;

ALTER TABLE job_role
ADD job_description VARCHAR2(100);

--Deleting a Column

ALTER TABLE job_role
DROP COLUMN job_description;

--Rename Column

ALTER TABLE job_role
RENAME COLUMN job_role_name TO job_titile;

--Rename a Table

ALTER TABLE job_role
RENAME TO job_types;

SELECT *
FROM job_types;


--DROP a Table:

DROP TABLE job_types;

SELECT *
FROM job_types;

ROLLBACK;