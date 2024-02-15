create database university5;
use university5;

create table Classroom(
Building varchar(50),
Room_number int,
capacity varchar(30),
constraint pk_Classroom PRIMARY KEY( Building)
);
show tables;
describe Classroom;
alter table Classroom
add FOREIGN key(Building,Room_number) references section(Building,Room_number);

create table department(
dept_name varchar(30),
Building varchar(50),
budget int,
constraint pk_dept_name PRIMARY KEY(dept_name)
);
insert into department(dept_name,Building,budget)
values('Comp.Sci','Taylor',100000);
insert into department(dept_name,Building,budget)
values('Biology','Watson',90000);
insert into department(dept_name,Building,budget)
values('Elec. Eng','Taylor',85000);
insert into department(dept_name,Building,budget)
values('Music','Packard ',80000);
insert into department(dept_name,Building,budget)
values('Finance', 'Painter', 120000);
insert into department(dept_name,Building,budget)
values('History', 'Painter', 50000);
insert into department(dept_name,Building,budget)
values('Physics', 'Watson', 70000);
insert into department(dept_name,Building,budget)
values('Materials','Fox',80000);
insert into department(dept_name,Building,budget)
values('Control.Engg','House',40000);
insert into department(dept_name,Building,budget)
values('Civil','Construction',75000);
insert into department(dept_name,Building,budget)
values('Automobile','Cars',50000);
insert into department(dept_name,Building,budget)
values('Aeronautical','Rocket',100000);
insert into department(dept_name,Building,budget)
values('Biotechnology','Medi',110000);
insert into department(dept_name,Building,budget)
values('Geotechnical','Mountain',30000);
insert into department(dept_name,Building,budget)
values('Chemical','Lab',60000);
insert into department(dept_name,Building,budget)
values('Nuclear','Desert',25000);
insert into department(dept_name,Building,budget)
values('Petroleum','Station',65000);
select *from department;
describe department;
show tables;

select dept_name,strcmp('Comp.Sci',dept_name)
from department;

create view B_Budget as
select Building, sum(budget) 
from department
group by Building;

select* from B_Budget;



create table course(
course_id varchar(40),
title varchar(50),
dept_name varchar(30),
credits float,
constraint pk_course primary key(course_id)
);
delete from course where course_id='BIO=1111';
insert into course values
('BIO-301','Genetics','Biology',4),
('Bio-399','Computantional Biology','Biology',3),
('CS-101','Intro. to Computer Science','Comp.Sci.',4),
('CS-190','Game Design','Comp.Sci.',4),
('CS-315','Robotics','Comp.Sci.',3),
('CS-319','Image Processing','Comp.Sci.',3),
('CS-347','Database System Concepts','Comp.Sci.',3),
('EE-181','Intro.to Digital Systems','Elec. Eng.',3),
('FIN-201','Investment Banking','Finance',3),
('HIS-351','World History','History',3),
('MU-199','Music Video Production','Music',3),
('Phy-101','Physical Principles','Physics',4),
('AM-110','Engineering Mechanics','Aeronautical',4),
('CY-100','Chemistry I ','Chemical',3),
('ME-148','Engineering Drawing','Physics',2),
('PH-101','Physics I','Physics',2),
('PH-103','Physics Lab I','Physics',3),
('GN-110','Life Skills','Finance',3),
('ID-120','Ecology and Environment','Biotechnology',2),
('CY-120','Chemistry II ','Chemical',3),
('PH-105','Physics Lab II','Physics',3),
('AS-201','Basic Strength of Materials','Materials',3);
insert into course values
('BIO-101','Intro. to Biology','Biology',4);
select *from course where dept_name='Comp.Sci.';
select* from course where dept_name='Comp.Sci.' and credits=4;
select* from course where title like '%ro%';
select* from course where title like '% % %';
select *from course;
describe course;

create view CSE as
select course_id, title, credits
from course;

select* from CSE;
SET SQL_SAFE_UPDATES = 0;
delete from CSE where title="Database System Concepts";

insert into CSE values('CSL362', 'Database Managment System', 4); 

drop view B_Budget;
drop view CSE;






create table instructor(
ID varchar(20),
name varchar(30),
dept_name varchar(30),
salary float,
constraint pk_instructor primary key(ID)
);
alter table instructor
add FOREIGN key(ID) references teaches(ID);
delete from instructor where ID=58583;
insert into instructor values
('22222','Einstein', 'Physics',95000),
('12121', 'Wu', 'Finance', 90000),
('32343','El Said', 'History', 60000),
('45565', 'Katz', 'Comp. Sci.', 75000),
('98345', 'Kim', 'Elec. Eng', 80000),
('76766','Crick', 'Biology', 72000),
('10101', 'Srinivasan', 'Comp. Sci.', 65000),
('58583', 'Califieri', 'History', 62000),
('83821', 'Brandt', 'Comp. Sci.', 92000),
('15151', 'Mozart', 'Music', 40000),
('33456', 'Gold', 'Physics', 87000),
('76543', 'Singh','Finance',80000),
('10000', 'MSD', 'Physics',96000),
('20000', 'Virat','Finance',85000),
('30000','DK','History',45000),
('40000','Rohit','Music',78000),
('50000','Messi','Finance',95000),
('60000','Bumrah','History',9000),
('70000','Natarajan','Music',50000),
('80000','Ronaldo','Music',79000),
('90000','Dhawan','Physics',67000),
('100000','Sachin','Finance',100000);
select * from instructor;
describe instructor;

create view IITJMU as
select ID,name,dept_name,salary
from instructor
where dept_name='Physics' or dept_name='Comp. Sci.' or dept_name='Elec. Eng' or dept_name='Biology';

select* from IITJMU;

update IITJMU
set name='Goldy'
where name='Gold';

insert into IITJMU values('1111' , 'Pankaj', 'Biology', 100000);

update IITJMU
set name=null
where dept_name='Physics';

update IITJMU
set dept_name='Chemical' 
where dept_name='Biology';

select name, length(salary) as 'figure count' 
from instructor;

select concat(substr(dept_name,1,3),"-",name) 
from instructor;

select concat(ucase(name),'-',building) 
from instructor
join
department on instructor.dept_name=department.dept_name;

select substring(name,2,1)
from instructor;

select where salary>60000 
from instructor;



create table section(
course_id varchar(40),
sec_id varchar(30),
semester int,
year int,
Building varchar(50),
Room_number int,
time_slot_id varchar(20),
constraint pk_section primary key(course_id,sec_id,semester,year)
);
alter table section modify semester varchar(20);
alter table section modify sec_id int;
alter table section
add foreign key (course_id) references course(course_id);
insert into section values
('BIO-101', 1, 'Summer', 2017, 'Painter', 514, 'B'),
('BIO-301', 1, 'Summer', 2018, 'Painter', 514, 'A'),
('CS-101', 1, 'Fall', 2017, 'Packard', 101, 'H'),
('CS-101', 1, 'Spring', 2018, 'Packard', 101, 'F'),
('CS-190', 1, 'Spring', 2017, 'Taylor', 3128, 'E'),
('CS-190', 2, 'Spring', 2017, 'Taylor', 3128, 'A'),
('CS-315', 1, 'Spring', 2018, 'Watson', 120, 'D'),
('CS-319', 1, 'Spring', 2018, 'Watson', 100, 'B'),
('CS-319', 2, 'Spring', 2018, 'Taylor', 3128, 'C'),
('CS-347', 1, 'Fall', 2017, 'Taylor', 3128, 'A'),
('EE-181', 1, 'Spring', 2017, 'Taylor', 3128, 'C'),
('FIN-201', 1, 'Spring', 2018, 'Packard', 101, 'B'),
('HIS-351', 1, 'Spring', 2018, 'Painter', 514, 'C'),
('MU-199', 1, 'Spring', 2018, 'Packard', 101, 'D'),
('PHY-101', 1, 'Fall', 2017, 'Watson', 100, 'A'),
('PHY-102', 1,'Fall', 2018,'Msdhoni',101,'A'),
('PHY-103', 2,'Spring',2017,'Virat',102,'D'),
('PHY-104', 2,'Spring',2017,'Bumrah',102,'D'),
('PHY-105', 1,'Spring',2017,'Vijay',102,'E'),
('PHY-106', 2,'Spring',2019,'Taylor',105,'A'),
('PHY-107', 2,'Spring',2017,'Virat',102,'D'),
('FIN-108', 1, 'Fall', 2019, 'Taylor', 145, 'U'),
('FIN-109', 2, 'Spring', 2018, 'Painter', 101, 'B'),
('FIN-110', 1, 'Fall', 2020, 'Packard', 201, 'P'),
('FIN-111', 1, 'Spring', 2018, 'Packard', 108, 'B');
insert into section values
('CS-190', 2, 'Spring', 2017, 'Taylor', 3128, 'A'),
('CS-190', 1, 'Spring', 2017, 'Taylor', 3128, 'E');
select course_id from section where Room_number between 100 and 500;
select course_id, Room_number from section 
Order by Room_number;
select* from section where Building like '%ant%';
select* from section where Building like '%son%';
select course_id from section where (semester='Summer' or semester='Spring') and year=2009;
select *from section;
describe section;

create table teaches(
ID varchar(20),
course_id varchar(30),
sec_id varchar(20),
semester int,
year int,
constraint pk_teaches primary key(ID,course_id,sec_id,semester,year)
);
delete from teaches where ID='12121';
alter table teaches modify semester varchar(20);
insert into teaches values
('10101', 'CS-101', '1', 'Fall', 2009),
('10101', 'CS-315', '1', 'Spring', 2010),
('10101', 'CS-347', '1', 'Fall', 2009),
('12121', 'FIN-201', '1', 'Spring', 2010),
('15151', 'MU-199', '1', 'Spring', 2010),
('22222', 'PHY-101', '1', 'Fall', 2009),
('32343', 'HIS-351', '1', 'Spring', 2010),
('45565', 'CS-101', '1', 'Spring', 2010),
('45565', 'CS-319', '1', 'Spring', 2010),
('76766', 'BIO-101', '1', 'Summer', 2009),
('76766', 'BIO-301', '1', 'Summer', 2010),
('83821', 'CS-190', '1', 'Spring', 2009),
('83821', 'CS-190', '2', 'Spring', 2009),
('83821', 'CS-319', '2', 'Spring', 2010),
('98345', 'EE-181', '1', 'Spring', 2009),
('10000', 'EE-182', '1', 'Fall', 2010),
('20000', 'EE-183', '1', 'Spring', 2009),
('30000', 'EE-184', '1', 'Summer', 2009),
('40000', 'EE-185', '1', 'Spring', 2009),
('50000', 'EE-186', '1', 'Spring', 2009),
('60000', 'EE-187', '1', 'Spring', 2009),
('70000', 'EE-188', '1', 'Spring', 2009),
('80000', 'EE-189', '1', 'Spring', 2009),
('90000', 'EE-190', '1', 'Spring', 2009),
('100000', 'EE-191', '1', 'Spring', 2009);
insert into teaches values('10102','CS-201',1,'Fall',2010);
select *from teaches;
describe teaches;

create table student(
ID varchar(20) primary key,
name varchar(25),
dept_name varchar(30),
tot_credits varchar(10)
);
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
describe student;
select* from student;
alter table student
add FOREIGN key(dept_name) references instructor(dept_name);
delete from student where dept_name="History";

create table takes(
ID varchar(20),
course_id varchar(30),
sec_id varchar(20),
semester varchar(10),
year varchar(20),
grade varchar(10),
constraint pk_takes primary key(ID,course_id,sec_id,semester,year)
);
describe takes;
select* from takes;
insert into takes values ('00128', 'CS-101', '1', 'Fall', '2009', 'A');
insert into takes values ('00128', 'CS-347', '1', 'Fall', '2009', 'A-');
insert into takes values ('12345', 'CS-101', '1', 'Fall', '2009', 'C');
insert into takes values ('12345', 'CS-190', '2', 'Spring', '2009', 'A');
insert into takes values ('12345', 'CS-315', '1', 'Spring', '2010', 'A');
insert into takes values ('12345', 'CS-347', '1', 'Fall', '2009', 'A');
insert into takes values ('19991', 'HIS-351', '1', 'Spring', '2010', 'B');
insert into takes values ('23121', 'FIN-201', '1', 'Spring', '2010', 'C+');
insert into takes values ('44553', 'PHY-101', '1', 'Fall', '2009', 'B-');
insert into takes values ('45678', 'CS-101', '1', 'Fall', '2009', 'F');
insert into takes values ('45678', 'CS-101', '1', 'Spring', '2010', 'B+');
insert into takes values ('45678', 'CS-319', '1', 'Spring', '2010', 'B');
insert into takes values ('54321', 'CS-101', '1', 'Fall', '2009', 'A-');
insert into takes values ('54321', 'CS-190', '2', 'Spring', '2009', 'B+');
insert into takes values ('55739', 'MU-199', '1', 'Spring', '2010', 'A-');
insert into takes values ('76543', 'CS-101', '1', 'Fall', '2009', 'A');
insert into takes values ('76543', 'CS-319', '2', 'Spring', '2010', 'A');
insert into takes values ('76653', 'EE-181', '1', 'Spring', '2009', 'C');
insert into takes values ('98765', 'CS-101', '1', 'Fall', '2009', 'C-');
insert into takes values ('98765', 'CS-315', '1', 'Spring', '2010', 'B');
insert into takes values ('98988', 'BIO-101', '1', 'Summer', '2009', 'A');
insert into takes values ('98988', 'BIO-301', '1', 'Summer', '2010', null);

select student.ID, name,replace(grade,'C','S') as grade
from student
join
takes on student.ID=takes.ID;

create table advisor(
s_ID varchar(20) primary key,
i_ID varchar(20)
);
describe advisor;

create table time_slot(
time_slot_id varchar(20),
day varchar(15),
start_time time,
end_time time,
constraint pk_time_slot primary key(time_slot_id,day,start_time)
);
describe time_slot;

create table prereq(
course_id varchar(20),
prereq_id varchar(20),
constraint pk_prereq primary key(course_id,prereq_id)
);
describe prereq;

create table Accounts(
receipt_no int primary key,
receipt_desc varchar(25),
payment_mode varchar(20),
amount int,
status varchar(20)
);


















