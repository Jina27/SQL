-- Creating a staff table
create table staff (

Staff_name int not null,
StaffID int not null,
phone_no int not null,
Address int not null,
primary key (StaffID)
);

describe staff
drop table staff

-- creating a students table 
create table student (
student_id int primary key,
name varchar(40),
major varchar(40)
-- primary key(student_id)
);


-- inserting data
insert into student values(1, 'Jack', 'Biology');
insert into student values (2, 'Kate', 'Sociology');

insert into student (student_id, name) values(3, 'Claire');
insert into student values (4, 'Jack', 'Biology');
insert into student values (5, 'Mike', 'Computer science');
 

select * from  student; 
-- updating tables 
update student 
set name = 'kate', major='Geology'
where name = 'Glory'

select student.name, student.major from student; 
select * from student where name ='Jack';
select * from student where student_id > 2;
select * from student where major = 'Biology' and student_id > 1;
drop table student 

create table employee(
employee_id int primary key,
first_name varchar(40),
last_name varchar(40),
birth_day Date,
sex Varchar(1),
salary int,
super_id int,
branch_id int 
);
select * from employee


-- branch b
drop table client;

-- creating table
create table branch(
branch_id int primary key,
branch_name varchar(40),
mgr_id int,
mgr_start_date date,
foreign key (mgr_id) references employee(emp_id)on delete set null 
);
select * from branch 

alter table employee add primary key(branch_id);

-- drop table client ;
alter table employee 
add foreign key (super_id)
references employee (employee_id)
on delete set null; 
select * from employee 

create table client (
client_id int primary key,
client_name varchar(40),
branch_id int, 
foreign key(branch_id) references branch(branch_id) on delete set null 
);

-- alter table client  add foreign key(client_id)
references branch(branch_id)
on delete set null 
select * from employee e;
 create table works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

alter table works_with 
add foreign key (client_id)
references client  (client_id)
on delete cascade ; 
 
 create table branch_supplier (
 branch_id int,
 supplier_name varchar(40),
 supply_type varchar(40),
 primary key(branch_id, supplier_name),
 foreign key (branch_id) references branch(branch_id)
 on delete cascade 
 );
 select * from branch_supplier 
 
 
 
-- inserting values 
-- corporate 
 insert into employee values (100, 'David', 'Wallace', '1967-11-17', 'M', 250000, null, null);

insert into  branch values (1, 'corporate', 100, '2006-02-09');


 update employee 
 set branch_id = 1
 where emp_id = 100;

insert into employee values (101, 'Jan', 'Levinson','1961-05-11','F', 110000, 100, 1);
select * from employee 

 -- scrantton 
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

update employee 
set branch_id = 2
where employee_id  = 102;
select * from employee 

-- Stamford 
insert into employee values (106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);
insert into branch values (3, 'Stamford', 106, '1998-02-13');

update employee 
set branch_id = 3 
where employee_id = 106;
select * from employee 

insert into employee values(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3); 
insert into employee values(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

-- branch supplier
insert into branch_supplier values(2, 'Hammer Mill', 'Paper'); 
insert into branch_supplier values(2, 'Uni-ball', 'Writing Utensils'); 
insert into branch_supplier values(3, 'Patriot Paper', 'Paper'); 
insert into branch_supplier values(2, 'J.T. Forms & Labels', 'Custom Forms'); 
insert into branch_supplier values(3, 'Uni-ball', 'Writing Utensils'); 
insert into branch_supplier values(3, 'Hammer Mill', 'Paper'); 
insert into branch_supplier values(3, 'Stamford Lables', 'Custom Forms'); 

select * from branch_supplier 

-- client 
insert into client values(400, 'Dunmore Highschool', 2); 
insert into client values(401, 'Lackawana Country', 2); 
insert into client values(402, 'FedEx', 3); 
insert into client values(403, 'John Daly Law, LLC', 3); 
insert into client values(404, 'Scranton Whitepages', 2); 
insert into client values(405, 'Times Newspaper', 3); 
insert into client values(406, 'FedEx', 2); 
select * from client 

drop table client;

-- works with 
insert into works_with (emp_id ,client_id, total_sales) values(100,400, 55000); 
insert into works_with values(102, 401, 267000); 
insert into works_with values(108, 402, 22500); 
insert into works_with values(107, 403, 5000); 
insert into works_with values(108, 403, 12000); 
insert into works_with values(105, 404, 33000); 
insert into works_with values(107, 405, 26000); 
insert into works_with values(102, 406, 15000); 
insert into works_with values(105, 406, 130000);
select * from works_with 

-- find all employees
select * from 
employee;

-- find all clients 
select * from 
clients;

-- find all employees ordered by salary 
select * from employee 
order by salary asc; 

-- find all employees ordered by sex then name 
select * from employee 
order by sex, name ;

-- find the first 5 employees on the table 
select * from 
employee 
limit 5;

-- find the first and last names of all employees 
select first_name, employee.last_name,
from employee;

-- find forename and surname of all employees 
select first_name as forename, employee.last_name as surname 
from employee;

-- find out all different gender 
select distinct sex 
from employee;

-- find all male employees 
select * from employee 
where sex = 'm';

-- find all employees from branch 2 
select * from employee 
where branch_id = 2 

-- Find all employees id's and names who were born after 1969
SELECT emp_id, first_name, last_name
FROM employee
WHERE birth_day >= 1970-01-01;

-- find all female employees at branch 2
select * from employee 
where branch_id= 2 and sex ='f';


-- total_salary 
select sum(salary) as total_salary from  employee;

-- average_salary 
select avg(salary) as average_salary,sum(salary) as total_salary  from  employee;
-- find employees who are female and born after 1961 and make over 80000
select * from employee 
where (birth_day >= 1970-01-01 and sex= 'f'  ) 
and salary > 80000;

-- Find all employees born between 1970 and 1975
select * from employee 
where (birth_day between '1970-01-01' and '1975-01-01');

-- Find all employees named Jim, Michael, Johnny or David
SELECT *
FROM employee
WHERE first_name IN ('Jim', 'Michael', 'Johnny', 'David');


-- Find the number of employees
SELECT COUNT(super_id) 
FROM employee;

-- Find out how many males and females there are
SELECT COUNT(sex),sex
FROM employee
group by sex;
describe employee; 

-- 
SELECT employee.first_name, branch.branch_name
FROM employee INNER JOIN branch ON employee.branch_id  = branch.branch_id
select frwhere salary = ;

SELECT employee.first_name AS Employee_Branch_Names
FROM employee
UNION
SELECT branch.branch_name
FROM branch;

-- Find a list of all clients & branch suppliers' names
SELECT client.client_name AS Non_Employee_Entities, client.branch_id AS Branch_ID
FROM client
UNION
SELECT branch_supplier.supplier_name, branch_supplier.branch_id
FROM branch_supplier;

SELECT employee.first_name, employee.last_name, works_with.total_sales
FROM employee
INNER JOIN works_with  ON employee.employee_id = works_with.emp_id 
WHERE employee.employee_id  IN (SELECT works_with.emp_id
                          FROM works_with
                          WHERE works_with.total_sales > 50000);
