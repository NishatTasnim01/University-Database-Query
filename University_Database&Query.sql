-- Create the 'University' database
Go
create database University;
Go

-- Switch to the 'University' database
use University;

-- Create the 'department' table
go
create table department
(
dept_name varchar(50),
building nvarchar(28),
budget int,
constraint dept_d_n_pk primary key(dept_name)
);

-- Create the 'instructor' table
go
create table instructor
(
id int primary key,
name char(50),
dept_name varchar(50),
constraint inst_d_n_fk foreign key (dept_name) references [dbo].[department] ([dept_name]),
salary int,
);

-- Insert data into the 'department' table
go
insert into department values ('Biology', 'Watson', 90000);
insert into department values ('Comp. Sci.', 'Taylor', 100000);
insert into department values ('Elec. Eng.', 'Taylor', 85000);
insert into department values ('Finance', 'Painter', 120000);
insert into department values ('History', 'Painter', 50000);
insert into department values ('Music', 'Packard', 80000);
insert into department values ('Physics', 'Watson', 70000);

-- Insert data into the 'instructor' table
go
insert into instructor values ('10101', 'Srinivasan', 'Comp. Sci.', 65000);
insert into instructor values ('12121', 'Wu', 'Finance', 90000);
insert into instructor values ('15151', 'Mozart', 'Music', 40000);
insert into instructor values ('22222', 'Einstein', 'Physics', 95000);
insert into instructor values ('32343', 'El Said', 'History', 60000);
insert into instructor values ('33456', 'Gold', 'Physics',87000);
insert into instructor values ('45565', 'Katz', 'Comp. Sci.', 75000);
insert into instructor values ('58583', 'Califieri', 'History', 62000);
insert into instructor values ('76543', 'Singh', 'Finance', 80000);
insert into instructor values ('76766', 'Crick', 'Biology', 72000);
insert into instructor values ('83821', 'Brandt', 'Comp. Sci.', 92000);
insert into instructor values ('98345', 'Kim', 'Elec. Eng.', 80000);

-- Select data from the 'department' and 'instructor' tables
go
select * from department;
select * from instructor;

-- Create the 'student' table
create table student
(
id int primary key,
name char(50),
dept_name varchar(50) foreign key (dept_name) references [dbo].[department] ([dept_name]),
tot_cred int,
);

-- Insert data into the 'student' table
insert into student values ('00128', 'Zhang', 'Comp. Sci.', '102');
insert into student values ('12345', 'Shankar', 'Comp. Sci.', '32');
insert into student values ('19991', 'Brandt', 'History', '80');
insert into student values ('23121', 'Chavez', 'Finance', '110');
insert into student values ('44553', 'Peltier', 'Physics', '56');
insert into student values ('45678', 'Levy', 'Physics', '46');
insert into student values ('54321', 'Williams', 'Comp. Sci.', '54');
insert into student values ('55739', 'Sanchez', 'Music', '38');
insert into student values ('70557', 'Snow', 'Physics', '0');
insert into student values ('76543', 'Brown', 'Comp. Sci.', '58');
insert into student values ('76653', 'Aoi', 'Elec. Eng.', '60');
insert into student values ('98765', 'Bourikas', 'Elec. Eng.', '98');
insert into student values ('98988', 'Tanaka', 'Biology', '120');

-- Select data from the 'student' table
select * from student;

-- Create the 'adviser' table
create table adviser
(
s_id int,
i_id int,
constraint ad_s_id_PK primary key(s_id),
constraint ad_s_id_FK foreign key(s_id) references [dbo].[student] (id),
constraint ad_i_id_FK foreign key(i_id) references [dbo].[instructor] (id)
);

-- Insert data into the 'adviser' table
insert into adviser values ('00128', '45565');
insert into adviser values ('12345', '10101');
insert into adviser values ('23121', '76543');
insert into adviser values ('44553', '22222');
insert into adviser values ('45678', '22222');
insert into adviser values ('76543', '45565');
insert into adviser values ('76653', '98345');
insert into adviser values ('98765', '98345');
insert into adviser values ('98988', '76766');

-- Select data from the 'adviser' table
select * from adviser;

-- Create the 'classroom' table
create table classroom
(
building varchar(50),
room_no int,
capacity int,
constraint clsrm_building_room_PK primary key(building, room_no)
);

-- Insert data into the 'classroom' table
insert into classroom values ('Packard', 101, 500);
insert into classroom values ('Painter', 514, 10);
insert into classroom values ('Taylor', 3128, 70);
insert into classroom values ('Watson', 100, 30);
insert into classroom values ('Watson', 120, 50);

-- Select data from the 'classroom' table
select * from classroom;

-- Create the 'course' table
create table course
(
course_id varchar(50),
title varchar(50),
dept_name varchar(50),
credits varchar(50),
constraint course_PK primary key(course_id),
constraint course_FK foreign key(dept_name) references [dbo].[department] ([dept_name])
);

-- Insert data into the 'course' table
insert into course values ('BIO-101', 'Intro. to Biology', 'Biology', '4');
insert into course values ('BIO-301', 'Genetics', 'Biology', '4');
insert into course values ('BIO-399', 'Computational Biology', 'Biology', '3');
insert into course values ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4');
insert into course values ('CS-190', 'Game Design', 'Comp. Sci.', '4');
insert into course values ('CS-315', 'Robotics', 'Comp. Sci.', '3');
insert into course values ('CS-319', 'Image Processing', 'Comp. Sci.', '3');
insert into course values ('CS-347', 'Database System Concepts', 'Comp. Sci.', '3');
insert into course values ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3');
insert into course values ('FIN-201', 'Investment Banking', 'Finance', '3');
insert into course values ('HIS-351', 'World History', 'History', '3');
insert into course values ('MU-199', 'Music Video Production', 'Music', '3');
insert into course values ('PHY-101', 'Physical Principles', 'Physics', '4');

-- Select data from the 'course' table
select * from course;

-- Create the 'section' table
create table section
(
    course_id varchar(50),
    sec_id varchar(10),
    semester varchar(10),
    year int,
    building varchar(50),
    room_no int,
   
    constraint sctn_PK primary key(course_id, sec_id, semester, year),
    constraint sctn_building_room_FK foreign key(building, room_no) references [dbo].[classroom] ([building],[room_no]),
    constraint sctn_course1_id_FK foreign key (course_id) references [dbo].[course] ([course_id]),
);

-- Insert data into the 'section' table
insert into section values ('BIO-101', '1', 'Summer', '2017', 'Painter', '514');
insert into section values ('BIO-301', '1', 'Summer', '2018', 'Painter', '514');
insert into section values ('CS-101', '1', 'Fall', '2017', 'Packard', '101');
insert into section values ('CS-101', '1', 'Spring', '2018', 'Packard', '101');
insert into section values ('CS-190', '1', 'Spring', '2017', 'Taylor', '3128');
insert into section values ('CS-190', '2', 'Spring', '2017', 'Taylor', '3128');
insert into section values ('CS-315', '1', 'Spring', '2018', 'Watson', '120');
insert into section values ('CS-319', '1', 'Spring', '2018', 'Watson', '100');
insert into section values ('CS-319', '2', 'Spring', '2018', 'Taylor', '3128');
insert into section values ('CS-347', '1', 'Fall', '2017', 'Taylor', '3128');
insert into section values ('EE-181', '1', 'Spring', '2017', 'Taylor', '3128');
insert into section values ('FIN-201', '1', 'Spring', '2018', 'Packard', '101');
insert into section values ('HIS-351', '1', 'Spring', '2018', 'Painter', '514');
insert into section values ('MU-199', '1', 'Spring', '2018', 'Packard', '101');
insert into section values ('PHY-101', '1', 'Fall', '2017', 'Watson', '100');

-- Select data from the 'section' table
select * from section;

-- Create the 'takes' table
create table takes
(
id int,
course_id varchar(50),
sec_id varchar(10),
semester varchar(10),
year int,
constraint takes_PK primary key(id, course_id, sec_id, semester, year),
constraint takes_id_FK foreign key(id) references [dbo].[student] ([id]),
constraint takes_FK foreign key(course_id, sec_id, semester, year) references [dbo].[section] ([course_id],[sec_id],[semester],[year]),
grade varchar(50)
);

-- Insert data into the 'takes' table
insert into takes values ('00128', 'CS-101', '1', 'Fall', '2017', 'A');
insert into takes values ('00128', 'CS-347', '1', 'Fall', '2017', 'A-');
insert into takes values ('12345', 'CS-101', '1', 'Fall', '2017', 'C');
insert into takes values ('12345', 'CS-190', '2', 'Spring', '2017', 'A');
insert into takes values ('12345', 'CS-315', '1', 'Spring', '2018', 'A');
insert into takes values ('12345', 'CS-347', '1', 'Fall', '2017', 'A');
insert into takes values ('19991', 'HIS-351', '1', 'Spring', '2018', 'B');
insert into takes values ('23121', 'FIN-201', '1', 'Spring', '2018', 'C+');
insert into takes values ('44553', 'PHY-101', '1', 'Fall', '2017', 'B-');
insert into takes values ('45678', 'CS-101', '1', 'Fall', '2017', 'F');
insert into takes values ('45678', 'CS-101', '1', 'Spring', '2018', 'B+');
insert into takes values ('45678', 'CS-319', '1', 'Spring', '2018', 'B');
insert into takes values ('54321', 'CS-101', '1', 'Fall', '2017', 'A-');
insert into takes values ('54321', 'CS-190', '2', 'Spring', '2017', 'B+');
insert into takes values ('55739', 'MU-199', '1', 'Spring', '2018', 'A-');
insert into takes values ('76543', 'CS-101', '1', 'Fall', '2017', 'A');
insert into takes values ('76543', 'CS-319', '2', 'Spring', '2018', 'A');
insert into takes values ('76653', 'EE-181', '1', 'Spring', '2017', 'C');
insert into takes values ('98765', 'CS-101', '1', 'Fall', '2017', 'C-');
insert into takes values ('98765', 'CS-315', '1', 'Spring', '2018', 'B');
insert into takes values ('98988', 'BIO-101', '1', 'Summer', '2017', 'A');
insert into takes values ('98988', 'BIO-301', '1', 'Summer', '2018', null);

-- Select data from the 'takes' table
select * from takes;

-- Create the 'teaches' table
create table teaches
(
id int,
course_id varchar(50),
sec_id varchar(10),
semester varchar(10),
year int,
constraint teaches_PK primary key(id, course_id, sec_id, semester, year),
constraint teaches_id_FK foreign key(id) references [dbo].[instructor] ([id]),
constraint teaches_FK foreign key(course_id, sec_id, semester, year) references [dbo].[section] ([course_id],[sec_id],[semester],[year])
);

-- Insert data into the 'teaches' table
insert into teaches values ('10101', 'CS-101', '1', 'Fall', '2017');
insert into teaches values ('10101', 'CS-315', '1', 'Spring', '2018');
insert into teaches values ('10101', 'CS-347', '1', 'Fall', '2017');
insert into teaches values ('12121', 'FIN-201', '1', 'Spring', '2018');
insert into teaches values ('15151', 'MU-199', '1', 'Spring', '2018');
insert into teaches values ('22222', 'PHY-101', '1', 'Fall', '2017');
insert into teaches values ('32343', 'HIS-351', '1', 'Spring', '2018');
insert into teaches values ('45565', 'CS-101', '1', 'Spring', '2018');
insert into teaches values ('45565', 'CS-319', '1', 'Spring', '2018');
insert into teaches values ('76766', 'BIO-101', '1', 'Summer', '2017');
insert into teaches values ('76766', 'BIO-301', '1', 'Summer', '2018');
insert into teaches values ('83821', 'CS-190', '1', 'Spring', '2017');
insert into teaches values ('83821', 'CS-190', '2', 'Spring', '2017');
insert into teaches values ('83821', 'CS-319', '2', 'Spring', '2018');
insert into teaches values ('98345', 'EE-181', '1', 'Spring', '2017');

-- Select data from the 'teaches' table
select * from teaches;

-- Create the 'time_slot' table
create table time_slot
(
time_slot_id int primary key,
day varchar(10),
start_time time,
end_time time
);

-- Insert data into the 'time_slot' table
insert into time_slot values (1, 'Monday', '08:00:00', '09:30:00');
insert into time_slot values (2, 'Monday', '09:45:00', '11:15:00');
insert into time_slot values (3, 'Monday', '11:30:00', '13:00:00');
insert into time_slot values (4, 'Tuesday', '08:00:00', '09:30:00');
insert into time_slot values (5, 'Tuesday', '09:45:00', '11:15:00');
insert into time_slot values (6, 'Wednesday', '08:00:00', '09:30:00');
insert into time_slot values (7, 'Wednesday', '09:45:00', '11:15:00');
insert into time_slot values (8, 'Wednesday', '11:30:00', '13:00:00');
insert into time_slot values (9, 'Thursday', '08:00:00', '09:30:00');
insert into time_slot values (10, 'Thursday', '09:45:00', '11:15:00');
insert into time_slot values (11, 'Friday', '08:00:00', '09:30:00');
insert into time_slot values (12, 'Friday', '09:45:00', '11:15:00');

-- Select data from the 'time_slot' table
select * from time_slot;

-- Create the 'prereq' table
create table prereq
(
course_id varchar(50),
preq_id varchar(50),
constraint prereq_PK primary key(course_id, preq_id),
constraint prereq_course_id_FK foreign key(course_id) references [dbo].[course] ([course_id]),
constraint prereq_preq_id_FK foreign key(preq_id)
references [dbo].[course] ([course_id])
)

-- Insert data into the 'prereq' table
insert into prereq values ('BIO-301', 'BIO-101');
insert into prereq values ('BIO-399', 'BIO-101');
insert into prereq values ('CS-190', 'CS-101');
insert into prereq values ('CS-315', 'CS-101');
insert into prereq values ('CS-319', 'CS-101');
insert into prereq values ('CS-347', 'CS-101');
insert into prereq values ('EE-181', 'PHY-101');

-- Select data from the 'prereq' table
select * from prereq;

-- Select instructors whose names start with '....'
select name, id
from instructor
where name like 'Cal%';

-- Select distinct instructor pairs with different salaries in the 'Comp. Sci.' department
select distinct *
from instructor as T, instructor as S
where T.salary > S.salary and S.dept_name = 'Comp. Sci.';

-- Drop All Tables
drop table adviser;
drop table prereq;
drop table time_slot;
drop table teaches;
drop table instructor;
drop table takes;
drop table student;
drop table section;
drop table classroom;
drop table course;
drop table department;

-- Chapter 3 --
-- The Select Clause --
select name
from instructor

select distinct dept_name
from instructor

select all dept_name
from instructor

select *
from instructor

select '437'

select '437' as FOO

select 'A'
from instructor

select ID, name, salary/12
from instructor


select ID, name, salary/12 as monthly_salary
from instructor

--Where Clause--
select name
from instructor
where dept_name = 'Comp. Sci.'

select name
from instructor
where dept_name = 'Comp. Sci.' and salary > 70000

--From Clause --
select *
from instructor, teaches

-- Example --

select name, course_id
from instructor , teaches
where instructor.ID = teaches.ID

select name, course_id
from instructor , teaches
where instructor.ID = teaches.ID
and instructor. dept_name = 'Art'

-- Rename --
select distinct T.name
from instructor as T, instructor as S
where T.salary > S.salary and S.dept_name = 'Comp. Sci.'

-- String Opetaion --
select name
from instructor
where name like '%niva%'

select * 
from department
where department name like '---'

-- Ordering The Display of Tuples --

select distinct name
from instructor
order by name

select distinct name
from instructor
order by name desc

select distinct dept_name, name
from instructor
order by dept_name, name

-- Clause Predictions --

select name
from instructor
where salary between 90000 and 100000

select name, course_id
from instructor, teaches
where instructor.ID = teaches.ID
and dept_name = 'Biology';

-- Set Operation --
(select course_id from section where semester = 'Fall' and year = 2017)
union
(select course_id from section where semester = 'Spring' and year = 2018)

(select course_id from section where semester = 'Fall' and year = 2017)
intersect
(select course_id from section where semester = 'Spring' and year = 2018)

(select course_id from section where semester = 'Fall' and year = 2017)
except
(select course_id from section where semester = 'Spring' and year = 2018)

-- Null Values --
select name
from instructor
where salary is null

insert into instructor values ('10109', 'Srinivasan', 'Comp. Sci.', Null);

-- Aggregate Functions --
select avg (salary)
from instructor
where dept_name= 'Comp. Sci.';

select count (distinct ID)
from teaches
where semester = 'Spring' and year = 2018;

select count (*)
from course;

select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name;

select avg (salary) as Average_salary
from instructor
Where dept_name = 'Biology';

select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name
having avg (salary) > 42000;

-- Set Memebership --

select distinct course_id
from section
where semester = 'Fall' and year= 2017 and
course_id in (select course_id
from section
where semester = 'Spring' and year= 2018);

select distinct course_id
from section
where semester = 'Fall' and year= 2017 and
course_id not in (select course_id
from section
where semester = 'Spring' and year= 2018);

select distinct name
from instructor
where name not in ('Mozart', 'Einstein')

select count (distinct ID)
from takes
where (course_id, sec_id, semester, year) in
(select course_id, sec_id, semester, year
from teaches
where teaches.ID= 10101); -- An expression of non-boolean type specified in a context where a condition is expected, near ','.

SELECT COUNT(DISTINCT t.ID)
FROM takes t
JOIN teaches s ON t.course_id = s.course_id
             AND t.sec_id = s.sec_id
             AND t.semester = s.semester
             AND t.year = s.year
WHERE s.ID = 10101;

select distinct T.name
from instructor as T, instructor as S
where T.salary > S.salary and S.dept_name = 'Biology';

select name
from instructor
where salary > some (select salary
from instructor
where dept_name = 'Biology');

select name
from instructor
where salary > all (select salary
from instructor
where dept_name = 'Biology');

select course_id
from section as S
where semester = 'Fall' and year = 2017 and
exists (select *
from section as T
where semester = 'Spring' and year= 2018
and S.course_id = T.course_id);

select distinct S.ID, S.name
from student as S
where not exists ( (select course_id
from course
where dept_name = 'Biology')
except
(select T.course_id
from takes as T
where S.ID = T.ID));

SELECT DISTINCT T.course_id
FROM course AS T
WHERE T.course_id IN
    (SELECT R.course_id
     FROM section AS R
     WHERE R.year = 2017);

-- Subquery --
select dept_name, avg_salary
from ( select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name) as nishat
where avg_salary > 42000;

select dept_name, avg_salary
from ( select dept_name, avg (salary)
from instructor
group by dept_name)
as dept_avg (dept_name, avg_salary)
where avg_salary > 42000;

with max_budget (value) as
(select max(budget) as max_budget
from department)
select department.dept_name
from department, max_budget
where department.budget = max_budget.value;

select dept_name,
( select count(*)
from instructor
where department.dept_name = instructor.dept_name)
as num_instructors
from department;

-- Deletion

delete from instructor

delete from instructor
where dept_name= 'Finance';

delete from instructor
where dept_name in (select dept_name
from department
where building = 'Watson');

delete from instructor
where salary < (select avg (salary)
from instructor);

-- Insertion --
insert into course
values ('CS-437', 'Database Systems', 'Comp. Sci.', 4);

insert into student
values ('3003', 'Green', 'Finance', null);

-- Update
update instructor
set salary = salary + salary * (5/100)

update instructor
set salary = salary * 1.05
where salary < 70000;

update instructor
set salary = salary * 1.05
where salary < (select avg (salary)
from instructor);

update instructor
set salary = salary * 1.03
where salary > 100000;
update instructor
set salary = salary * 1.05
where salary <= 100000;

update instructor
set salary = case
when salary <= 100000 then salary * 1.05
else salary * 1.03
end