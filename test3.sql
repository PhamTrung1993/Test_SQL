create database test3;
use test3;
create table Class(
ClassID int not null auto_increment primary key,
ClassName nvarchar(255) not null,
StarDate date not null default (CURRENT_DATE),
Status bit
);
create table Student
(
StudentId int not null auto_increment primary key,
StudentName nvarchar(30),
Address nvarchar(50),
Phone varchar(20),
Status bit default 1,
ClassId int not null,
foreign key(ClassId) references Class (ClassID)
);
create table Subject
(
SubId int not null auto_increment primary key,
SubName varchar(30) not null,
Credit tinyint not null default 1 check( Creadit >= 1),
Status bit default 1
);
create table Mark
(
MarkId int not null auto_increment primary key,
SubId int not null,
StudentId int not null,
Mark float default 0 check ( Mark between 0 and 100),
ExamTimes tinyint default 1,
unique (SubId, StudentId),
foreign key(SubId) references Subject(SubId),
foreign key(StudentId) references student(StudentId)
);

insert into Class(ClassName, StartDate, Status)
			values ('A1','01/22/2022',1),
				   ('A2','2023-01-05',1);
INSERT INTO class(ClassName, StarDate, Status) 
			VALUES ('A1', '2008-12-20', 1),
				   ('A2', '2008-12-22', 1);
insert into Class(ClassName,  Status)	
			values ('B3', 0);		

insert into Student(StudentName, Address, Phone, Status, ClassId)
			values ('Hung', 'Ha Noi', '0912113113', 1, 1),
				   ('Hoa', 'Hai Phong', ' ', 1, 1),
				   ('Manh', 'HCM', '', 0, 2);
insert into Subject(SubName, Credit)
			values ('CF',5),
				   ('C',6),
				   ('HDJ',5),
				   ('RDBMS',10);
                   
insert into Mark(SubId, StudentId, Mark, ExamTime)
			values (1,1,8,1),
			       (1,2,10,2),
			       (2,1,12,1);