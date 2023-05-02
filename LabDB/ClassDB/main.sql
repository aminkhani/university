-- CREATE TABLE spec( 
-- 	emp_no int PRIMARY KEY, 
-- 	fname nvarchar(20) not null,
-- 	lname nvarchar(30) not null,
-- 	C_id char(20) null,
-- 	mellicode char(10),
-- 	birthDate datetime null,
-- 	marry bit not null,
-- 	course nvarchar(50),
-- 	grade nvarchar(20),
-- 	phon char(11) null,
-- -- 	constraint prim_spec primary key(emp_no)
-- ) 
-- Create index idx on spec(lname)
-- CREATE TABLE department(
-- 	dept_no int PRIMARY KEY,
-- 	Dname nvarchar(20) null,
-- 	Dphon nchar(11) null,
-- 	DAddress nvarchar(60) null,
-- -- 	Constraint uniq_dept unique (dept_no)
-- ) 
-- CREATE TABLE groupp(
-- 	group_no int PRIMARY KEY,
-- 	Base_Salary float null,
-- 	check (group_no <= 20)
-- )
-- CREATE TABLE project(
-- 	proj_no int PRIMARY KEY,
-- 	Pname nvarchar(20),
-- 	Psubject nvarchar(100),
-- 	Price money,
-- -- 	constraint prim_proj primary key(proj_no)
-- ) 
-- CREATE TABLE works( 
-- 	emp_no int PRIMARY KEY FOREIGN KEY REFERENCES spec(emp_no),
-- 	begin_date datetime null,
-- 	end_date datetime null,
-- 	account nchar(20) null,
-- 	bime_no int null, 
-- 	job nvarchar(50) null,
-- 	Overtime float null,
-- 	absent float null,
-- 	tax float null,
-- -- 	constraint foriegn_work1 foreign key (emp_no) references spec(emp_no) On delete Cascade
-- )
-- CREATE TABLE Datald( 
-- 	emp_no int PRIMARY KEY,
-- 	group_no int not null,
-- 	proj_no int not null,
-- 	dept_no int not null,
-- 	constraint fk1_Data foreign key (group_no) references groupp(group_no) On delete Cascade,
-- 	constraint fk2_Data foreign key (proj_no) references project(proj_no) On delete Cascade,
-- 	constraint fk3_Data foreign key (dept_no) references department(dept_no) On delete Cascade
-- )
-- CREATE TABLE child(
-- 	child_no int PRIMARY KEY,
-- 	Emp_no int not null,
-- 	chname varchar(20) not null,
-- 	chbirthdate datetime not null,
-- 	constraint fk1_child foreign key (emp_no) references spec(emp_no) On delete Cascade,
-- )
-- CREATE TABLE wife(
-- 	Emp_no int PRIMARY KEY,
-- 	wife_name varchar(20) not null,
-- 	wife_lname varchar(20) not null,
-- 	constraint fk1_wife foreign key (emp_no)
-- 	references spec(emp_no) On delete Cascade,
 )
SELECT emp_no, fname, lname, birthDate FROM spec
	WHERE birthDate <= 1993 OR marry IS NOT NULL
SELECT * FROM spec 
	WHERE RIGHT(rtrim(phon), 2) = '21'
SELECT * FROM spec ORDER BY lname, fname
SELECT * FROM spec, works
	WHERE spec.emp_no=works.emp_no
SELECT fname, lname, phon, job, begin_date FROM spec INNER JOIN works
	ON spec.emp_no = works.emp_no
		WHERE phon LIKE '55%'
SELECT fname, lname, job, begin_date INTO Spwk FROM spec INNER JOIN works
	ON spec.emp_no = works.emp_no
		SELECT * FROM Spwk
SELECT SUM(price) AS SumPriec FROM project
	WHERE COUNT(price) > 10000000