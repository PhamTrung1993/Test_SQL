create database test2;
use test2;
create table Classes(
ClassID int(4) not null auto_increment primary key,
ClassName nvarchar(50)
);
create table Students
(
StudentID int(4) not null auto_increment primary key,
StudentName nvarchar(50),
Age int(4),
Email varchar(100),
Status bit default 1,
CHECK (Age between 15 and 50)
);

create table Subjects
(
SubjectID int not null auto_increment primary key,
SubjectName nvarchar(50) not null
);
create table ClassStudent
(
StudentID int,
ClassID int,
foreign key(StudentID) references Students(StudentID),
foreign key(ClassID) references Classes(ClassID)
);
create table Mark
(
Mark int not null,
SubjectID int not null,
StudentID int not null,
foreign key(SubjectID) references Subjects(SubjectID),
foreign key(StudentID) references Students(StudentID)
);

insert into Classes(ClassName)
values ('C0706L');
insert into Classes(ClassName)
values ('C0708G');

insert into Students(StudentName,Age,Email)
			values  ('Nguyen Quang An', 18, 'an@yahoo.com'),
					('Nguyen Cong Vinh', 20, 'vinh@gmail.com'),
					('Nguyen Van Quyen', 19, 'quyen'),
					('Nguyen Quang An', 25, 'binh@com'),
					('Nguyen Van Tai Em', 30, 'taiem@sport.vn');
insert into ClassStudent
values (1,1),
	   (2,1),
	   (3,2),
	   (4,2),
	   (5,2);
insert into Subjects
values (1,'SQL'),
	   (2,'JAVA'),
	   (3,'C'),
	   (4,'Visual Basic');
insert into Mark
values (8,1,1),
	   (4,2,1),
	   (9,1,1),
	   (7,1,3),
	   (3,2,4),
	   (5,2,5),
	   (8,3,3),
	   (1,3,5),
	   (3,2,4);
       
select * from Students;
SELECT * FROM Subjects;

select S.StudentID, S.StudentName, avg(Mark)
from Students S join Mark M on S.StudentID = M.StudentID
group by S.StudentID, S.StudentID;

select S.SubjectName, Max(mark) as maxPoint
from Subjects S join Mark M on S.SubjectID = M.SubjectID
group by S.SubjectID, S.SubjectID
having max(mark) >= all (select max(mark) from  Mark M group by M.SubjectID);

select Mark 
from Mark
order by Mark desc;

ALTER TABLE Subjects 
CHANGE COLUMN SubjectName SubjectName VARCHAR(255) NOT NULL ;

UPDATE subjects SET SubjectName = 'Day la mon hoc SQL' WHERE (SubjectID = 1);
UPDATE subjects SET SubjectName = 'Day la mon hoc JAVA' WHERE (SubjectID = 2);
UPDATE subjects SET SubjectName = 'Day la mon hoc C' WHERE (SubjectID = 3);
UPDATE subjects SET SubjectName = 'Day la mon hoc Visual basic' WHERE (SubjectID = 4);

ALTER TABLE classstudent Drop CONSTRAINT classstudent_ibfk_1;
ALTER TABLE classstudent Drop CONSTRAINT classstudent_ibfk_2;

ALTER TABLE mark Drop CONSTRAINT mark_ibfk_1;
ALTER TABLE mark Drop CONSTRAINT mark_ibfk_2;

DELETE FROM students WHERE (StudentID = 1);

UPDATE students SET Status = 0 WHERE (StudentID = 1);
UPDATE students SET Status = 0 WHERE (StudentID = 2);
UPDATE students SET Status = 0 WHERE (StudentID = 3);
UPDATE students SET Status = 0 WHERE (StudentID = 4);
UPDATE students SET Status = 0 WHERE (StudentID = 5);

       