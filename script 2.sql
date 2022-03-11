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

-- creating table
create table branch(
branch_id int primary key,
branch_name varchar(40),
mgr_id int,
mgr_start_date date 
foreign key (mgr_id) references employee(emp_id)on delete set null 
);
select * from branch 

alter table employee add foreign key(branch_id)
references branch(branch_id)
on delete set null 

alter table employee 
add foreign key (super_id)
references employee (employee_id)
on delete set null 

create table client (
emp_id int primary key,
client_name varchar(40),
branch_id int, 
foreign key(branch_id) refernces branch(branch_id)
on delete set null 
);
select * from client 

 create table works_with (
 emp_id int, 
 client_id int,
 total_sales int,
 primary key (emp_id, client_id),
 foreign key (emp_id) references employee (emp_id) on delete cascade,
 foreign key (client_id) references client (client_id) on delete cascade 
 );
 select * from works_with 
 
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

 insert into branch values (1, 'corporate', 100, '2006-02-09');
 update employee 
 set branch_id = 1
 where 