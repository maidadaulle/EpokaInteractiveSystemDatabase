CREATE DATABASE EpokaInteractiveSystem;
USE EpokaInteractiveSystem;
CREATE TABLE Student(epokaID INT NOT NULL UNIQUE,StudentName VARCHAR(20) NOT NULL, FatherName VARCHAR(20),
surname VARCHAR(20) NOT NULL ,  title VARCHAR(10), gender VARCHAR(7),
birthday DATE NOT NULL, country VARCHAR(20), city VARCHAR(20), citizenship VARCHAR(20),
passportNo VARCHAR(15) NOT NULL UNIQUE, IDCardNo VARCHAR(15) NOT NULL UNIQUE,
primaryEmil VARCHAR(40) NOT NULL UNIQUE, secondaryEmail VARCHAR(40) NOT NULL UNIQUE,
phoneNr BIGINT NOT NULL, matrialStatus VARCHAR(10), 
bloodGroup VARCHAR(10), englishLevel VARCHAR(3) NOT NULL,
PRIMARY KEY(epokaID));

INSERT INTO Student(epokaID, StudentName, FatherName, surname, gender, birthday, country, city,citizenship,
passportNo, IDCardNo, primaryEmil, secondaryEmail, phoneNr, matrialStatus, bloodGroup, englishLevel,programID)
VALUES("020522110","Michael","Jack","Smith","Male","2004-05-04","Albania","Fier,ALB","Albanian","K12343908K",
"1234K908","msmith22@epoka.edu.al","michaelsmith54@gmail.com","0693375758","single","0+","B2","SWE");
INSERT INTO Student(epokaID, StudentName, FatherName, surname, gender, birthday, country, city,citizenship,
passportNo, IDCardNo, primaryEmil, secondaryEmail, phoneNr, matrialStatus, bloodGroup, englishLevel,programID)
VALUES("020321090","Ana","Besmir","Hoxha","Female","2002-11-04","Albania","Tirane,ALB","Albanian","K18743908E",
"K18743908E","ahoxha21@epoka.edu.al","annahoxha@gmail.com","0693355858","single","A+","B2","CEN");
INSERT INTO Student(epokaID, StudentName, FatherName, surname, gender, birthday, country, city,citizenship,
passportNo, IDCardNo, primaryEmil, secondaryEmail, phoneNr, matrialStatus, bloodGroup, englishLevel,programID)
VALUES("02052286","Maida","Idris","Daulle","Female","2004-3-14","Albania","Lushnje,ALB","Albanian","K1154908E",
"K1154908E","mdaulle22@epoka.edu.al","maidadaulle04@gmail.com","0693623672","single","0+","B2","SWE");
INSERT INTO Student(epokaID, StudentName, FatherName, surname, gender, birthday, country, city,citizenship,
passportNo, IDCardNo, primaryEmil, secondaryEmail, phoneNr, matrialStatus, bloodGroup, englishLevel,programID)
VALUES("01042055","Ema","Ilir","Lika","Female","2002-5-14","Albania","Shkoder,ALB","Albanian","K1154458P",
"K1154458P","elika20@epoka.edu.al","emalika14@gmail.com","0693488672","single","0+","B2","BINF"),
("01032201","Arben","Shpetim","Dervishi","Male","2003-12-30","Albania","Tirane,ALB","Albanian","K0002908E",
"K0002908E","adervishi22@epoka.edu.al","arbendervishi@gmail.com","069364499","single","B-","B2","BAF");


CREATE TABLE StudentCourses(epokaID INT NOT NULL, courseID VARCHAR(6) NOT NULL, letterGrade VARCHAR(2) NOT NULL,
grade NUMERIC(3,2),
FOREIGN KEY(epokaID) REFERENCES Student(epokaID),
FOREIGN KEY(courseID) REFERENCES Course(courseID));
INSERT INTO StudentCourses(epokaID,courseID,lettergrade,grade) VALUES("02052286","SWE101","AA","4"),("02052286","CEN109","BA","3.5"),
("02052286","CEN215","AA","4"),("02052286","MTH207","DC","1.5"),("01042055","BUS101","CC","2"),("01032201","BAF101","BB","3"),
("020522110","SWE101","DD","1"),("020321090","MTH207","CC","2");
INSERT INTO StudentCourses(epokaID,courseID,lettergrade,grade) VALUES("02052286","CEN219","AA","4");
INSERT INTO StudentCourses(epokaID,courseID,lettergrade) VALUES("020522110","CEN109","NA");

CREATE TABLE StudentRole(epokaID INT NOT NULL UNIQUE, unit VARCHAR(10),
pPosition VARCHAR(10), project VARCHAR(20), pRole VARCHAR(10), 
startDate DATE NOT NULL, endDate DATE NOT NULL, pStatus VARCHAR(10),
FOREIGN KEY(epokaID) REFERENCES Student(epokaID));
INSERT INTO StudentRole(epokaID, unit, pPosition,project,startDate,endDate,pStatus)
VALUES("020522110","9","member","GDSC","2023-12-01","2024-06-10","active"),("020321090","5","member","AI","2022-10-01","2024-05-22","active");
INSERT INTO StudentRole(epokaID, unit, pPosition,project,startDate,endDate,pStatus)
VALUES("020321090","5","member","GDSC","2023-5-01","2024-06-10","active");

CREATE TABLE StudentResidence(epokaID INT NOT NULL UNIQUE, assignedPermit VARCHAR(10),
expirationDate DATE, issuingAuthority VARCHAR(10), permitType VARCHAR(10),
entryDate DATE, exitDate DATE, additionalDetails VARCHAR(30),
FOREIGN KEY(epokaID) REFERENCES Student(epokaID));


CREATE TABLE StudentAddres(epokaID INT NOT NULL UNIQUE, street VARCHAR(20),
city VARCHAR(10), country VARCHAR(15), addresDetails VARCHAR(30),
FOREIGN KEY(epokaID) REFERENCES Student(epokaID));
INSERT INTO StudentAddres(epokaID,street,city,country) VALUES("020522110","Todi Shkurta","Fier","Albania");
INSERT INTO StudentAddres(epokaID,street,city,country) VALUES("020321090","Selite e Vjeter","Tirane","Albania");

CREATE TABLE StudentFamily(epokaID INT NOT NULL UNIQUE, fatherName VARCHAR(10),
Fsurname VARCHAR(15), fPhoneNo BIGINT, fWork VARCHAR(20), fProfession VARCHAR(20),
motherName VARCHAR(10), Msurname VARCHAR(15), mPhoneNo BIGINT, mWork VARCHAR(20),
mProfession VARCHAR(20),
FOREIGN KEY(epokaID) REFERENCES Student(epokaID));
INSERT INTO StudentFamily(epokaID,fatherName,Fsurname, fPhoneNo,fWork, motherName, Msurname, mPhoneNo,mProfession)
VALUES("020321090","Jack","Smith","0692342164","Bussisneman","Anna","Smith","0682543129","Economist");
INSERT INTO StudentFamily(epokaID,fatherName,Fsurname, fPhoneNo,fWork, fProfession,motherName, Msurname, mPhoneNo,mWork,mProfession)
VALUES("2052286","Idris","Daulle","069587598","Police","polica officer","Manjola","Daulle","069854667"," highschool","teacher");

CREATE TABLE Faculty ( facultyProfile VARCHAR(40), facultyID INT NOT NULL, 
PRIMARY KEY (facultyID));
INSERT INTO Faculty(facultyID,facultyProfile) VALUES("01","Economics and Administrative Sciences");
INSERT INTO Faculty(facultyID,facultyProfile) VALUES("03","Architecture and Engineering");
INSERT INTO Faculty(facultyID,facultyProfile) VALUES("02","Law and Social Sciences");

CREATE TABLE Program(programCode INT NOT NULL,programID VARCHAR(6) NOT NULL , programName VARCHAR(40),
pDescription VARCHAR(100),semester INT NOT NULL,nrOfCourses INT NOT NULL,
PRIMARY KEY (programID));
INSERT INTO Program(programCode, programID, programName,semester, nrOfCourses)
VALUES("05","SWE","Software Engineering","6","5"),("04","CEN","Computer Engineering","6","5"),
("03","ARCH","Architecture","10","6"),("01","BINF","Business Informatics","6","6"),("02","BAF","Banking and Finance","6","6");

ALTER TABLE Student ADD programID VARCHAR(6) NOT NULL,
ADD FOREIGN KEY(programID) REFERENCES Program(programID);

CREATE TABLE StudentGroup(epokaID INT NOT NULL, programID VARCHAR(6) NOT NULL,
yearOftudy INT, studentGroup VARCHAR(1), hourType VARCHAR(10),
FOREIGN KEY(epokaID) REFERENCES Student(epokaID),
FOREIGN KEY(programID) REFERENCES Program(programID));
INSERT INTO StudentGroup(epokaID,programID,yearOftudy,studentgroup,hourtype) VALUES("020522110","SWE","2","A","Lecture"),
("020321090","CEN","3","C","Laburatory"),("02052286","SWE","2","D","Laburatory"),("01042055","BINF","3","A","Seminar"),
("01032201","BAF","1","A","Lecture");


CREATE TABLE Department(facultyID INT NOT NULL, departmentID INT NOT NULL,
departamentName VARCHAR(20) NOT NULL, depDescription VARCHAR(100),
nrOfPrograms INT NOT NULL, programID VARCHAR(6) NOT NULL UNIQUE ,
FOREIGN KEY(facultyID) REFERENCES Faculty(facultyID),
FOREIGN KEY(programID) REFERENCES Program(programID));
INSERT INTO Department(facultyID,departmentID,departamentName,nrOfPrograms,programID)
VALUES("3","3","Computer Engineering","7","CEN");
INSERT INTO Department(facultyID,departmentID,departamentName,nrOfPrograms,programID)
VALUES("1","1","Banking and Finance","5","BAF"),("3","2","Architecture","3","ARCH"),("3","3","Computer Engineering","7","SWE");


CREATE TABLE Course( programID VARCHAR(6) NOT NULL,courseID VARCHAR(6) NOT NULL UNIQUE,courseName VARCHAR(40),
courseType VARCHAR(20), lecturerno INT,ECTS INT, Credits INT, noOfStudents INT, 
 averageGrades NUMERIC(4,2),
PRIMARY KEY (courseID),
FOREIGN KEY(programID) REFERENCES Program(programID));
INSERT INTO Course (programID,courseID, courseName, courseType, lecturerno, ECTS, Credits,noOfStudents)
VALUES("SWE","CEN109","Introduction to Algorithms","A","3","7","4","120"),("ARCH","MTH125","Bacis Mathematics","A","1","4","3","100");
INSERT INTO Course (programID,courseID, courseName, courseType, lecturerno, ECTS, Credits,noOfStudents)
VALUES("CEN","ENG102","ENGLISH II","E","1","5","4","110"),("SWE","CEN203","DATABASE MANAGEMENT SYSTEMS","B","2","7","4","135"),
("SWE","SWE101","INTRO TO SOFTWARE ENGINEERING","B","3","7","4","128"),("BINF","BUS101","MATH. FOR ECONOMICS AND BUSINESS I","A","1","5","4","89"),
("BAF","BAF101","INTRODUCTION TO ECONOMICS","A","1","5","3","30");
INSERT INTO Course(programID,courseID, courseName, courseType, lecturerno, ECTS, Credits,noOfStudents)
VALUES("SWE","MTH207","FUNDAMENTALS OF PROBABILITY","A","2","6","3","150"),("SWE","CEN219","COMPUTER ORGANISATION","C","1","6","3","120"),
("CEN","CEN215","OBJECT ORIENTED PROGRAMIMG","B","3","7","4","200");

CREATE TABLE Lecturer( lecturerID INT NOT NULL, lecturerName VARCHAR(20) NOT NULL,
fatherName VARCHAR(20),surname VARCHAR(20) NOT NULL, title VARCHAR(20) NOT NULL, gender VARCHAR(6),
passportNo VARCHAR(15) NOT NULL UNIQUE, IDCartNo VARCHAR(15) NOT NULL UNIQUE ,birthday DATE, birthplace VARCHAR(15),
citizenship VARCHAR(15),phoneNumber BIGINT NOT NULL,city VARCHAR(20),
country VARCHAR(20) ,matrialStatus VARCHAR(20),bloodGroup VARCHAR(20),
PRIMARY KEY (lecturerID));
INSERT INTO Lecturer(lecturerID,lecturerName,fatherName,surname,title,gender,passportNo,IDCartNo,birthday,birthplace,
citizenship,phoneNumber,city, country, matrialStatus,bloodGroup)
VALUES("1000","Arban","Arben","Uka","DR.","Male","P7869425K","P7869425K","1980-5-28","Tirane,ALB","Albanian","0684587624","Tirane","Albania","married","0+");
INSERT INTO Lecturer(lecturerID,lecturerName,fatherName,surname,title,gender,passportNo,IDCartNo,birthday,birthplace,
citizenship,phoneNumber,city, country, matrialStatus,bloodGroup)
VALUES("1001","Igli","Besmir","Drraci","M. SC.","Male","F7869425E","F7869425E","1994-5-8","Tirane,ALB","Albanian","0690087624","Tirane","Albania","single","A-"),
("1003","Redjola","Ilir","Manaj","M. SC.","Female","P7895567R","P7895567R","1992-12-01","Vlore,ALB","Albanian","0684578464","Tirane","Albania","single","0+"),
("1004","Florenc","Ilir","Skuka","M. SC.","Male","K7849562P","K7849562P","1985-01-19","Tirane,ALB","Albanian","0698758691","Tirane","Albania","married","B+"),
("1005","Sabrina","Gezim","Begaj","M. SC.","Female","P7859004K","P7859004K","1993-03-19","Tirane,ALB","Albanian","0698700241","Tirane","Albania","married","B+");
INSERT INTO Lecturer(lecturerID,lecturerName,fatherName,surname,title,gender,passportNo,IDCartNo,birthday,birthplace,
citizenship,phoneNumber,city, country, matrialStatus,bloodGroup)
VALUES("1006","Eriselda","Artan","Goga","DR.","Female","P7869004K","P7869004K","1992-7-2","Fier,ALB","Albanian","0690087624","Tirane","Albania","single","0+"),
("1007","Ari","Astrit","Gjerazi","DR.","Male","P7024580M","P7024580M","1994-9-12","Fier,ALB","Albanian","0690579842","Tirane","Albania","single","A+");
INSERT INTO Lecturer(lecturerID,lecturerName,fatherName,surname,title,gender,passportNo,IDCartNo,birthday,birthplace,
citizenship,phoneNumber,city, country, matrialStatus,bloodGroup)
VALUEs("2001","Chrysanthi","Jani","Balomenou","DR.","Female","47861021P","47861021P","1960-8-01","Athens,GR","Greek","0698749568","Tirane","Albania","married","B+");

CREATE TABLE LecturerEmail(lecturerID INT NOT NULL UNIQUE, primaryEmail VARCHAR(40) NOT NULL UNIQUE,
secondaryEmail VARCHAR(40) NOT NULL UNIQUE,
FOREIGN KEY(lecturerID) REFERENCES Lecturer(lecturerID));
INSERT INTO LecturerEmail(lecturerID,primaryEmail,secondaryEmail) VALUES("1000","auka@epoka.edu.al","arbanuka@gmail.com"),
("1001","idrraci@epoka.edu.al","iglidrraci@gmail.com"),("1003","rmanaj@epoka.edu.al","redjolamanaj@gmail.com"),
("1004","fskuka@epoka.edu.al","florenskuka@gmail.com"),("1005","sbegaj@epoka.edu.al","sabrinabegaj@gmail.com");
INSERT INTO LecturerEmail(lecturerID,primaryEmail,secondaryEmail) VALUES("1006","egoga@epoka.edu.al","eriseldagoga@gmail.com"),
("1007","agjerazi@epoka.edu.al","arigjerazi@gmail.com");

CREATE TABLE LecturerRole(lecturerID INT NOT NULL UNIQUE, lPosition VARCHAR(20),
lRole VARCHAR(20), startDate DATE, lstatus VARCHAR(15), 
departmentID INT NOT NULL,
FOREIGN KEY(lecturerID) REFERENCES Lecturer(lecturerID));
INSERT INTO LecturerRole(lecturerID,lPosition,lRole,startDate,lstatus,departmentID)
VALUES("1000","Head of Departament","lecturer","2015-10-01","active","3"),("1001","lecturer","lecturer","2019-10-20","active","3"),
("1006","lecture","assistant","2019-03-5","active","3");

CREATE TABLE LecturerResidence(lecturerID INT NOT NULL UNIQUE, assignedPermit VARCHAR(10),
expirationDate DATE, issuingAuthority VARCHAR(10), permitType VARCHAR(10),
entryDate DATE, exitDate DATE, additionalDetails VARCHAR(30),
FOREIGN KEY(lecturerID) REFERENCES Lecturer(lecturerID));
INSERT INTO LecturerResidence(lecturerID,assignedPermit,issuingAuthority,permitType,entryDate) VALUES("2001","Job","Epoka","10 years","2015-02-02");

CREATE TABLE LecturerAddres(lecturerID INT NOT NULL UNIQUE, street VARCHAR(20),
city VARCHAR(10), country VARCHAR(15), addresDetails VARCHAR(30),
FOREIGN KEY(lecturerID) REFERENCES Lecturer(lecturerID));

CREATE TABLE TeachedCourses(lecturerID INT NOT NULL, courseID VARCHAR(6) NOT NULL, semesterYear VARCHAR(10),
lecturerRole VARCHAR(10),
FOREIGN KEY(lecturerID) REFERENCES Lecturer(lecturerID),
FOREIGN KEY(courseID) REFERENCES Course(courseID));
INSERT INTO TeacheDCourses(lecturerID, courseID,semesterYear,lecturerRole) VALUES("1004","CEN109","1-2022","Main");
INSERT INTO TeacheDCourses(lecturerID, courseID,semesterYear,lecturerRole) VALUES("1001","CEN215","1-2023","Main"),("1004","CEN219","1-2023","Main"),
("1003","MTH207","1-2023","MAIN"),("1005","CEN215","1-2023","SECONDARY");
INSERT INTO TeacheDCourses(lecturerID, courseID,semesterYear,lecturerRole) VALUES("1007","CEN203","1-2023","Main"),("1006","MTH207","1-2023","SECONDARY");
INSERT INTO TeacheDCourses(lecturerID, courseID,semesterYear,lecturerRole) VALUES("1004","CEN109","1-2023","Main");

CREATE TABLE Office(lecturerID INT NOT NULL UNIQUE, officePhone INT, officeNumber VARCHAR(4),
FOREIGN KEY(lecturerID) REFERENCES Lecturer(lecturerid)); 
INSERT INTO Office(lecturerID,officePhone,officeNumber) VALUES("1004","1533","E007"),("1000","1560","A208"),("1001","1542","E008");
INSERT INTO Office(lecturerID,officePhone,officeNumber) VALUES("1006","1533","E007"),("1007","1542","E008");

CREATE TABLE Discipline(Dtype VARCHAR(20) NOT NULL UNIQUE, dDescription VARCHAR(100),
timeperiod VARCHAR(8),
PRIMARY KEY(Dtype));
INSERT INTO Discipline(Dtype, dDescription) VALUES("Warning"," warning him that is required to be more careful with her actions"),
("Reprimand ","student indicating that s/he has been reprimanded for an act of misconduct");
INSERT INTO Discipline(Dtype, dDescription,timeperiod) VALUES("Suspension WEEKS","suspended not be able to attend classes and exams during the period of suspension",
"1-2 WEEK");
CREATE TABLE StudentDiscipline(epokaID INT NOT NULL, Dtype VARCHAR(20),
Sstatus VARCHAR(10), startTime DATE, endTime DATE,
FOREIGN KEY(epokaID) REFERENCES Student(epokaID),
FOREIGN KEY(Dtype) REFERENCES Discipline(Dtype));
INSERT INTO StudentDiscipline(epokaID,Dtype,Sstatus) VALUES("020522110","Warning", "completed");


CREATE TABLE Advisor(advisorID INT NOT NULL, programID VARCHAR(6) NOT NULL, yearOftudy INT,noOfStudents INT,
FOREIGN KEY(advisorID) REFERENCES Lecturer(lecturerID),
FOREIGN KEY(programID) REFERENCES Program(programID));
INSERT INTO Advisor(advisorID, programID,yearOftudy, noOfStudents) VALUES("1001","SWE","1","128");
INSERT INTO Advisor(advisorID, programID,yearOftudy, noOfStudents) VALUES("1006","CEN","1","90");

CREATE TABLE BankInfo(bankName VARCHAR(20), accountName VARCHAR(30) NOT NULL,
accountNo BIGINT NOT NULL, accountCurrency VARCHAR(5), IBAN VARCHAR(30) NOT NULL,
swiftCode VARCHAR(10) NOT NULL, paymentDescription VARCHAR(30));
INSERT INTO bankInfo(bankName, accountName, accountNo, accountCurrency,IBAN, swiftCode, paymentDescription)
VALUES("Intesa Sanpaolo Bank","Turgut Ozal Education Sh.a","20099635306",
"EUR", "AL50208110080000020099635306","USALALTR",", Per Universitetin Epoka");
INSERT INTO bankInfo(bankName, accountName, accountNo, accountCurrency,IBAN, swiftCode, paymentDescription)
VALUES("Raiffeisen Bank","Turgut Ozal Education Sh.a","0071264111",
"EUR", "AL23202110060000000071264111","SGSBALTX",", Per Universitetin Epoka");


CREATE TABLE Finance(epokaID INT NOT NULL UNIQUE, academicYear INT NOT NULL, 
debt INT NOT NULL, currency VARCHAR(5), total INT NOT NULL,
FOREIGN KEY(epokaID) REFERENCES Student(epokaID));
INSERT INTO Finance(epokaID,academicYear,debt, currency,total) VALUES ("020321090","2023","1750","EUR","1750");

CREATE TABLE Document(records INT, numberCount INT AUTO_INCREMENT UNIQUE, 
epokaID INT NOT NULL,documentType VARCHAR(20),requestID INT NOT NULL UNIQUE,
 requestionDate DATE, copyRequested INT,price VARCHAR(10),
 payment VARCHAR(8), documentStatus VARCHAR(10),actions VARCHAR(40),
 PRIMARY KEY(requestID),
 FOREIGN KEY(epokaID) REFERENCES Student(epokaID));
INSERT INTO Document(records, epokaID, documentType,requestID, requestionDate, copyRequested, price, payment, documentStatus)
VALUES("2","020321090","GRADES TRANSCRIPT","1232","2023-11-10","1","500","DONE","Processing");

CREATE TABLE Grades(letterGrade VARCHAR(2), gpaValue NUMERIC(3,2),
points INT, gradeDescription VARCHAR(20), albGradeSystem INT, avgIncluded VARCHAR(3),
PRIMARY KEY(letterGrade));
ALTER TABLE Grades MODIFY COLUMN points VARCHAR(6);
INSERT INTO Grades(letterGrade, gpaValue, points, gradeDescription, albGradeSystem, avgIncluded)
VALUES("AA","4.00","90-100","Excellent","10","I");
INSERT INTO Grades(letterGrade, gpaValue, points, gradeDescription, albGradeSystem, avgIncluded)
VALUES("DC","1.50","65-69","ON PROBATION","6","I");
INSERT INTO Grades(letterGrade, gpaValue, points, gradeDescription, albGradeSystem, avgIncluded)
VALUES("BA","3.50","85-89","Excellent","9","I"), ("BB","3.00","80-84","SUCCESS","8","I"),
("CB","2.50","75-79","SUCCESS","8","I"), ("CC","2.00","70-74","SUCCESS","7","I");
INSERT INTO Grades(letterGrade, gpaValue, points, gradeDescription, albGradeSystem, avgIncluded)
VALUES("DD","1.00","60-64","ON PROBSCION","5","I"), ("FD","0.50","50-59","FAIL","4","I"),
("FF","0.00","0-49","FAIL","0","I"),("NA","0.00","0","FAIL","0","NI");

CREATE TABLE AcademicCalendar(eventName VARCHAR(40),peroidOfTime VARCHAR(20),
 eventdescription VARCHAR(60));
 INSERT INTO academiccalendar(eventName, peroidOfTime)
VALUES("Fall Semester Add and Drop","October 16-20, 2023");
INSERT INTO academiccalendar(eventName, peroidOfTime)
VALUES("Fall Semester FINAL EXAMS","Jan 22-Feb 3,2024");
INSERT INTO academiccalendar(eventName,peroidOfTime)
VALUES("Spring Break","February 05-18, 2024"),("Spring Semster Beginn","February 19,2024"),("National Day-SummerDay","March 14 2024");

 CREATE TABLE Transport(routeID INT NOT NULL , route VARCHAR(20) NOT NULL,
departureTime DATETIME NOT NULL, routeStatus VARCHAR(10),
busStation VARCHAR(20), stationTime TIME NOT NULL,
PRIMARY KEY (routeID));
ALTER TABLE TRANSPORT MODIFY COLUMN routestatus VARCHAR(15);
INSERT INTO Transport(routeID, route,departureTime, routeStatus, busStation, stationTime)
VALUES("001","Tirana-Campus","2023-11-15 7:30","Departed","Tirana Center","8:00");
INSERT INTO Transport(routeID, route,departureTime, routeStatus, busStation, stationTime)
VALUES("002","Campus-Durres","2024-01-09 12:30","NotDeparted","Campus","12:30");

CREATE TABLE TransportReservation(epokaID INT NOT NULL, routeID INT NOT NULL UNIQUE,
FOREIGN KEY(epokaID) REFERENCES Student(epokaID),
FOREIGN KEY(routeID) REFERENCES Transport(routeID));
INSERT INTO TransportReservation(epokaID,routeID) VALUES("020321090","001"),("02052286","002");

CREATE TABLE Company(companyID INT NOT NULL UNIQUE, companyName VARCHAR(20) NOT NULL,
companyDescription VARCHAR(100),
PRIMARY KEY(companyID));
INSERT INTO Company(companyID,companyName) VALUES("001","Intesa Sanpaolo Bank");
INSERT INTO Company(companyID,companyName) VALUES("002","Neptun");
INSERT INTO Company(companyID,companyName) VALUES("003","Deloite");
INSERT INTO Company(companyID,companyName) VALUES("004","Vodafone"),("005","Albsig");

CREATE TABLE Application(epokaID INT NOT NULL,applicationID INT NOT NULL UNIQUE, appliactionName VARCHAR(20),
position VARCHAR(20), companyID INT NOT NULL, dateOfApplication DATE,
PRIMARY KEY(applicationID),
FOREIGN KEY(companyid) REFERENCES Company(companyID),
FOREIGN KEY(epokaID) REFERENCES Student(epokaID));
INSERT INTO Application(epokaID,applicationID, appliactionName, position, companyID, dateOfApplication)
VALUES("020522110","8703","Application1","Asistant","001","2023-12-20");
INSERT INTO Application(epokaID,applicationID, appliactionName, position, companyID, dateOfApplication)
VALUES("01042055","0155","VodafoneApp","Manaxher","004","2022-10-5");

CREATE TABLE ProfessionalPractice(epokaID INT NOT NULL , 
applicationID INT NOT NULL UNIQUE, companyID INT NOT NULL,
FOREIGN KEY(epokaID) REFERENCES Student(epokaID),
FOREIGN KEY(applicationID) REFERENCES Application(applicationID),
FOREIGN KEY(companyID) REFERENCES Company(companyID));
INSERT INTO ProfessionalPractice(epokaID,applicationID,companyID) VALUES("01042055","0155","004"),("020522110","8703","001");

CREATE TABLE Class(classID VARCHAR(4) NOT NULL UNIQUE, building VARCHAR(1),
floorLevel INT, classNumber INT, classDescription VARCHAR(30),
PRIMARY KEY (classID));
INSERT INTO Class(classID,building, floorLevel, classNumber) VALUES("A128","A", "1","28");
INSERT INTO Class(classID,building, floorLevel, classNumber) VALUES("A005","A","0", "5");
INSERT INTO Class(classID,building, floorLevel, classNumber,classDescription) VALUES("E011","E","0", "11","Lab 1");
INSERT INTO Class(classID,building, floorLevel, classNumber) VALUES("E012","E","0", "12"),("A127","A","1","27");

CREATE TABLE Erasmus(erasmusCode INT NOT NULL UNIQUE, universityName VARCHAR(20) NOT NULL,
state VARCHAR(20) NOT NULL, studyProgram VARCHAR(20), yearOfStudy YEAR,
season INT, eDescription VARCHAR(50),
PRIMARY KEY(erasmusCode));
INSERT INTO erasmus(erasmusCode, universityName, state, studyProgram, yearOfStudy,season)
VALUES("2513","Aalborg University" ,'Denmark',"K-FORCE,Erasmus+KA2","2023","1");
INSERT INTO erasmus(erasmusCode, universityName, state, studyProgram, yearOfStudy,season)
VALUES("2516","Aalto University","Finland","PANBioRA,HORIZON2020","2022","2");

CREATE TABLE ErasmusApplications(applicationID INT NOT NULL UNIQUE,
erasmusCode INT NOT NULL, epokaID INT NOT NULL, 
PRIMARY KEY(applicationID),
FOREIGN KEY(erasmusCode) REFERENCES Erasmus(erasmusCode),
FOREIGN KEY(epokaID) REFERENCES Student(epokaID));
INSERT INTO ErasmusApplications(applicationID,erasmusCode,epokaID) VALUES("0155","2513","01042055");

CREATE TABLE Clubs(clubID INT NOT NULL UNIQUE, clubName VARCHAR(20) NOT NULL,
link VARCHAR(30),nrOfStudents INT NOT NULL,
PRIMARY KEY(clubID));
INSERT INTO Clubs(clubid,clubName, nrOfStudents) VALUES("001","GDSC","100");
INSERT INTO Clubs(clubid,clubName, nrOfStudents) VALUES("002","Programming","80");
INSERT INTO Clubs(clubid,clubName, nrOfStudents) VALUES("003","Sports","70");

CREATE TABLE ClubParticipants(epokaID INT NOT NULL,clubID INT,
studentRole VARCHAR(8),
FOREIGN KEY(epokaID) REFERENCES student(epokaID),
FOREIGN KEY(clubID) REFERENCES clubs(clubID));
INSERT INTO ClubParticipants(epokaID,clubID,StudentRole) VALUES ("020522110","002","Member"),("02052286","001","Member");

CREATE TABLE ClubsEvents(clubID INT NOT NULL, eventName VARCHAR(20) NOT NULL,
eventDate DATE, startTime TIME , endTime TIME,
FOREIGN KEY(clubID) REFERENCES Clubs(clubID));
INSERT INTO clubsevents(clubID, eventName, eventDate, startTime, endTime) VALUES("002","AI","2023-12-17","11:30","12:30");
INSERT INTO clubsevents(clubID, eventName, eventDate, startTime, endTime) VALUES("001","Firebase","2024-01-11","11:30","12:30");

CREATE TABLE Timetable( season VARCHAR(10) NOT NULL , StudentType VARCHAR(15),
programID VARCHAR(6) NOT NULL, programYear INT NOT NULL, yearGroup  VARCHAR(1) ,
dayOfTheWeek VARCHAR(10) NOT NULL, courseID VARCHAR(6), startTime TIME, endTime TIME,
lecturerID INT NOT NULL, classID VARCHAR(4) NOT NULL,
FOREIGN KEY(programID) REFERENCES Program(programID),
FOREIGN KEY(courseID) REFERENCES Course(courseID),
FOREIGN KEY(lecturerID) REFERENCES Lecturer(lecturerID),
FOREIGN KEY(classID) REFERENCES Class(classID));
INSERT INTO Timetable(season,studentType,programID,programYear,yearGroup,dayOfTheWeek,courseID,startTime,endTime,lecturerID,classID)
VALUES("FALL","Undergraduate","SWE","2","B","Monday","MTH207","8:40","10:30","1003","E012"),("FALL","Undergraduate","SWE","2","B","Monday","CEN215","11:40","13:30","1001","A005"),
("FALL","Undergraduate","SWE","2","B","Tuesday","CEN219","11:40","13:30","1004","A128"),("FALL","Undergraduate","SWE","2","B","Tuesday","CEN203","14:40","16:30","1007","A128"),
("FALL","Undergraduate","SWE","2","B","Wednesday","CEN219","8:40","10:30","1004","A128"),("FALL","Undergraduate","SWE","2","B","Wednesday","CEN203","10:40","12:30","1007","E011"),
("FALL","Undergraduate","SWE","2","B","Thursday","MTH207","10:40","12:30","1006","A128"),("FALL","Undergraduate","SWE","2","B","Thursday","CEN215","14:40","17:30","1001","E011");
 

CREATE TABLE PersonalisedTimetable(epokaID INT NOT NULL,  
dayOfTheWeek VARCHAR(10) NOT NULL, courseID VARCHAR(6), startTime TIME, endTime TIME,
lecturerID INT NOT NULL, classID VARCHAR(4) NOT NULL,
FOREIGN KEY(courseID) REFERENCES Course(courseID),
FOREIGN KEY(lecturerID) REFERENCES Lecturer(lecturerID),
FOREIGN KEY(classID) REFERENCES Class(classID));
INSERT INTO PersonalisedTimeTable(epokaID,dayOfTheWeek,courseID,startTime,endTime,lecturerID,classID)
VALUES("02052286","Monday","CEN215","11:40","13:30","1001","A005");
INSERT INTO PersonalisedTimeTable(epokaID,dayOfTheWeek,courseID,startTime,endTime,lecturerID,classID)
VALUES("02052286","Monday","MTH207","9:40","10:30","1003","A005"),("02052286","Tuesday","CEN219","11:40","13:30","1004","A128"),
("0205228","Wednesday","CEN219","11:40","13:30","1004","A128"),("02052286","Friday","CEN215","8:40","11:30","1005","E011");

CREATE TABLE CourseSelection(epokaID INT NOT NULL, courseType VARCHAR(13) NOT NULL,
courseID VARCHAR(6) NOT NULL, advisorID INT NOT NULL, selected VARCHAR(13) NOT NULL,
confirmationDate DATE,
FOREIGN KEY(epokaID) REFERENCES Student(epokaID),
FOREIGN KEY(courseID) REFERENCES Course(courseID),
FOREIGN KEY(advisorID) REFERENCES Advisor(advisorID));
INSERT INTO CourseSelection(epokaID,courseType,courseID,advisorID,selected,confirmationDate)
VALUES("02052286","COMPULSORY","CEN215","1001","SELECTED","2023-09-27"),("02052286","COMPULSORY","MTH207","1001","SELECTED","2023-09-27");
INSERT INTO CourseSelection(epokaID,courseType,courseID,advisorID,selected,confirmationDate)
VALUES("02052286","COMPULSORY","CEN219","1001","SELECTED","2023-09-27");

CREATE TABLE Attendance(epokaID INT NOT NULL, records INT AUTO_INCREMENT UNIQUE ,
courseID VARCHAR(6) NOT NULL,nrOfWeek VARCHAR(6) NOT NULL, topic VARCHAR(40) NOT NULL, 
hourType VARCHAR(15) NOT NULL, attendedHours INT NOT NULL, totalHours INT NOT NULL,
courseHrsDate DATE,
FOREIGN KEY(epokaID) REFERENCES Student(epokaID),
FOREIGN KEY(courseID) REFERENCES Course(courseID));
INSERT INTO Attendance(epokaID,courseID,nrOfWeek,topic,hourtype,attendedHours,totalHours,courseHrsDate)
VALUES("02052286","CEN215","1","Intro to JAVA","Lesson","2","2","2023-10-02"),
("02052286","CEN215","1","Intro to JAVA","Laburatory","3","3","2023-10-05"),
("02052286","CEN215","2","Methods and Arrays","Lesson","2","2","2023-10-09"),
("02052286","CEN215","2","Arrays and Methods","Laburatory","3","3","2023-10-13"),
("02052286","CEN215","3","Object and classes","Lesson","2","2","2023-10-16"),
("02052286","CEN215","3","Object and classes","Laburatory","3","3","2023-10-20"),
("02052286","CEN215","4","Thinking in objects","Lesson","2","2","2023-10-27"),
("02052286","CEN215","4","Object-oriented","Lesson","2","2","2023-10-30"),
("02052286","CEN215","5","Regexes and Inheritace","Lesson","2","2","2023-10-30"),
("02052286","CEN215","5","quiz+inheritance","Lesson","2","2","2023-11-03");
INSERT INTO Attendance(epokaID,courseID,nrOfWeek,topic,hourtype,attendedHours,totalHours,courseHrsDate)
VALUES("020522110","CEN109","1","Course Description","Lesson","2","2","2022-10-18"),
("020522110","CEN109","1","Number System","Laburatory","0","3","2022-10-19"),
("020522110","CEN109","2","Flowcharts 1","Lesson","0","2","2022-10-25"),
("020522110","CEN109","2","Flowcharts 1","Laburatory","1","3","2022-10-27"),
("020522110","CEN109","3","Flowcharts 2","Lesson","1","2","2022-11-01"),
("020522110","CEN109","3","Flowcharts 2","Laburatory","2","3","2022-11-3"),
("020522110","CEN109","4","Flowcharts 2 Loops","Lesson","2","2","2022-11-8"),
("020522110","CEN109","4","Flowcharts 2 REVIEW","Laburatory","2","3","2022-11-10");

CREATE TABLE Survey(programID VARCHAR(6) NOT NULL, epokaID INT NOT NULL,courseID VARCHAR(6) NOT NULL, 
lecturerID INT NOT NULL, question VARCHAR(40) NOT NULL, evaluation INT NOT NULL,
additionalReview VARCHAR(60),
FOREIGN KEY(programID) REFERENCES Program(programID),
FOREIGN KEY(epokaID) REFERENCES Student(epokaID),
FOREIGN KEY(courseID) REFERENCES Course(courseID),
FOREIGN KEY(lecturerID) REFERENCES lecturer(lecturerID));
INSERT INTO Survey(programID,epokaID,courseID,lecturerID,question,evaluation) 
VALUES("CEN","020321090","MTH207","1003","Is the lecturer well-prepeared?","1"),("SWE","02052286","MTH207","1003","Is the lecturer well-prepeared?","0"),
("CEN","020321090","MTH207","1003","Is the lecturer on time?","4"),("SWE","02052286","MTH207","1003","Is the lecturer on time?","4"),
("CEN","020321090","MTH207","1003","Has your knowledge increase?","0"),("SWE","02052286","MTH207","1003","Has your knowledge increase?","0"),
("CEN","020321090","CEN215","1001","Is the lecturer well-prepeared?","2"),("SWE","02052286","CEN215","1001","Is the lecturer well-prepeared?","3"),
("CEN","020321090","CEN215","1001","Is the lecturer on time?","4"),("SWE","02052286","CEN215","1001","Is the lecturer on time?","4"),
("CEN","020321090","CEN215","1001","Has your knowledge increase?","2"),("SWE","02052286","CEN215","1001","Has your knowledge increase?","3");

CREATE TABLE ResitExam(epokaID INT NOT NULL, courseID VARCHAR(6) NOT NULL,
 selectStatus VARCHAR(15) NOT NULL,
FOREIGN KEY(epokaID) REFERENCES Student(epokaID),
FOREIGN KEY(courseID) REFERENCES Course(courseID));
INSERT INTO ResitExam(epokaID,courseID,selectStatus) VALUES("020522110","SWE101","SELECTED"),("02052286","MTH207","NOTSELECTED"),
("01032201","BUS101","SELECTED");

CREATE TABLE AdditionalExams(epokaID INT NOT NULL,academicYear INT NOT NULL,courseID VARCHAR(6) NOT NULL,
additionalDate DATE, examStatus VARCHAR(10) NOT NULL, actions VARCHAR(10) ,
FOREIGN KEY(epokaID) REFERENCES Student(epokaID));
INSERT INTO AdditionalExams(epokaID, academicYear,courseID,examStatus) VALUES("01042055","2024","BUS101","pending");

CREATE TABLE ThirdSemester(epokaID INT NOT NULL, courseID VARCHAR(6) NOT NULL, courseStatus VARCHAR(10) NOT NULL,
FOREIGN KEY(epokaID) REFERENCES Student(epokaID),
FOREIGN KEY(courseID) REFERENCES Course(courseID));
INSERT INTO ThirdSemester(epokaID, courseID, courseStatus) VALUES("01042055","BUS101","Selected");


-- QUERY 1
SELECT studentName,surname,courseID,grade 
FROM student,studentCourses
WHERE student.epokaID=studentCourses.epokaID
HAVING grade>=2;

-- QUERY 2
SELECT s.epokaID, s.StudentName, s.surname, AVG(sc.grade) AS average_grade
FROM Student s
JOIN StudentCourses sc ON s.epokaID = sc.epokaID
GROUP BY s.epokaID, s.StudentName, s.surname;

-- QUERY 3
SELECT c.programID, c.courseID, AVG(sc.grade) AS average
FROM Course c
JOIN StudentCourses sc ON c.courseID = sc.courseID
JOIN Student s ON sc.epokaID = s.epokaID
GROUP BY c.programID, c.courseID;

-- QUERY 4
SELECT tc.lecturerID,l.lecturerName,l.surname,SUM(noOfStudents) AS totalNrOfStudents
FROM teachedCourses tc
JOIN course c ON tc.courseID=c.courseID
JOIN Lecturer l ON tc.lecturerID=l.lecturerID
GROUP BY tc.lecturerID, l.lecturerName, l.surname;

-- QUERY 5
SELECT a.programID,le.primaryEmail
FROM lecturerEmail le
JOIN advisor a ON le.lecturerID=a.advisorID
GROUP BY a.programID,le.primaryEmail;

-- QUERY 6
SELECT officeNumber, COUNT(lecturerID) AS lecturerCount
FROM Office
GROUP BY officeNumber;

-- QUERY 7
SELECT s.epokaID, s.programID, sc.courseID, c.courseName
FROM Student s
JOIN StudentCourses sc ON s.epokaID = sc.epokaID
JOIN Course c ON sc.courseID = c.courseID
WHERE s.programID IN (
    SELECT p.programID
    FROM Program p
    WHERE p.programName = "Software Engineering");

-- QUERY 8
SELECT l.lecturerID, l.lecturerName,l.surname,s.courseID ,AVG(s.evaluation) AS avgEvaluationScore
FROM Lecturer l
JOIN Survey s ON l.lecturerID = s.lecturerID
GROUP BY l.lecturerID, l.lecturerName,l.surname,s.courseID
HAVING avgEvaluationScore < 2;

-- QUERY 9
SELECT courseID, lecturerID, AVG(evaluation) AS AvgEvaluation
FROM Survey
GROUP BY courseID, lecturerID;

-- QUERY 10
SELECT a.epokaID, s.StudentName, a.courseID,
       SUM(a.attendedHours) AS totalAttendedHours,
       SUM(a.totalHours) AS totalHours,
       (SUM(a.attendedHours) * 100.0 / SUM(a.totalHours)) AS attendancePercentage
FROM Attendance a
JOIN Student s ON a.epokaID = s.epokaID
WHERE a.epokaID = "02052286"
GROUP BY a.epokaID, s.StudentName, a.courseID;

-- QUERY 11
SELECT s.epokaID, s.StudentName,a.courseID,
 SUM(a.attendedHours) AS totalAttendedHours,SUM(a.totalHours) AS totalTotalHours,
(SUM(a.attendedHours) / SUM(a.totalHours)) * 100 AS overallAttendancePercentage
FROM Student s
JOIN Attendance a ON s.epokaID = a.epokaID
GROUP BY s.epokaID, s.StudentName,a.courseID
HAVING overallAttendancePercentage < 75;


-- QUERY 12
SELECT t.lecturerID, t.classID, COUNT(*) AS teachingFrequency
FROM Timetable t
JOIN Lecturer l ON t.lecturerID = l.lecturerID
WHERE l.lecturerID = "1004"
GROUP BY t.lecturerID, t.classID
HAVING COUNT(*) > 1;

-- QUERY 13
SELECT c.courseID, c.courseName, COUNT(DISTINCT t.lecturerID) AS numLecturers
FROM Course c
JOIN TeachedCourses t ON c.courseID = t.courseID
GROUP BY c.courseID, c.courseName
HAVING COUNT(DISTINCT t.lecturerID) > 1;

-- QUERY 14
SELECT c.clubName, COUNT(cp.epokaID) AS numParticipants
FROM Clubs c
LEFT JOIN ClubParticipants cp ON c.clubID = cp.clubID
GROUP BY c.clubName;

-- QUERY 15
SELECT pt.dayOfTheWeek, pt.startTime,pt.endTime,pt.courseID
FROM PersonalisedTimetable pt
JOIN Class c ON pt.classID = c.classID
WHERE c.classDescription LIKE '%Lab%';

-- QUERY 16
SELECT s.epokaID,s.StudentName,s.programID,p.programName,MAX(sc.grade) AS topCourseGrade
FROM Student s
JOIN Program p ON s.programID = p.programID
LEFT JOIN StudentCourses sc ON s.epokaID = sc.epokaID
GROUP BY s.epokaID, s.StudentName, s.programID, p.programName;

-- QUERY 17
SELECT DISTINCT s.epokaID, s.studentName, s.surname
FROM Student s
JOIN Attendance a ON s.epokaID = a.epokaID
WHERE a.courseHrsDate BETWEEN "2023-09-01" AND "2023-12-31";

-- QUERY 18
SELECT s.studentName,t.route 
FROM transportreservation tr
JOIN student s ON tr.epokaID=s.epokaID
JOIN transport t ON tr.routeID=t.routeID
GROUP BY s.studentName,t.route;

-- QUERY 19
SELECT s.StudentName, s.surname
FROM Student s
JOIN StudentAddres sa ON s.epokaID = sa.epokaID
WHERE sa.city = "Tirane" AND s.englishLevel = "B2";

-- QUERY 20
SELECT l.*
FROM Lecturer l
JOIN TeachedCourses tc ON l.lecturerID = tc.lecturerID
GROUP BY l.lecturerID, tc.semesterYear
HAVING COUNT(tc.courseID) > 1;





