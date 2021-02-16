CREATE DATABASE CI_TEAM09;

USE CI_TEAM09;

create table sector
  (Sector_ID int(10) not null auto_increment,
  Sector_Name varchar(50) not null, primary key (Sector_ID));

create table charity
  (Charity_ID int(10) not null auto_increment,
  Registration int(10) not null,
  Legal_Name varchar(50) not null,
  Common_Name varchar(50) null,
  Mailing_Address varchar(50) null,
  City varchar(20) null,
  Province varchar(2) null,
  URL varchar(50) null,
  primary key (Charity_ID));

create table charity_sector
  (Charity_ID int(10) not null,
  Sector_ID int(10) not null,
  primary key (Sector_ID, Charity_ID),
  foreign key fk_char_to_sec (Charity_ID) references charity( Charity_ID)
  on delete cascade on update cascade,
  foreign key fk_sec_to_char (Sector_ID) references sector(Sector_ID)
  on delete cascade on update cascade);

create table session
  (Session_ID int(10) not null auto_increment,
  Cookies_ID int(10) not null,
  DateTime_CookieCreation datetime not null,
  DateTime_CookieExpiration datetime not null,
  Activity_Date date not null,
  Activity_time Time not null,
  PRIMARY KEY (Session_ID));

create table charity_session
  (Charity_ID int(10) not null,
  Session_ID int(10) not null,
  Primary key (Charity_ID, Session_ID),
  foreign key fk_char_to_ses (Charity_ID) references charity (Charity_ID)
  on delete cascade on update cascade,
  foreign key fk_ses_to_char (Session_ID) references session (Session_ID)
  on delete cascade on update cascade);

create table article
  (Article_ID int(10) not null auto_increment,
  Pub_Date Date not null,
  Title VARCHAR(50) not null,
  Article_Text TEXT not null,
  PRIMARY KEY (Article_ID));

create table session_article
  (Article_ID int(10) not null,
  Session_ID int(10) not null,
  Primary key (Article_ID, Session_ID),
  foreign key fk_art_to_ses (Article_ID) references article (Article_ID)
  on delete cascade on update cascade,
  foreign key fk_ses_to_art (Session_ID) references session (Session_ID)
  on delete cascade on update cascade);

create table donation
  (Transaction_ID int(10) not null auto_increment,
  Date Date not null,
  Time TIME not null,
  Amount VARCHAR(10) not null,
  Session_ID int(10) not null,
  primary key (Transaction_ID),
  foreign key fk_ses_to_don (Session_ID) references Session(Session_ID)
  on delete cascade on update cascade);

create table employee
  (Employee_ID int(10) not null auto_increment,
  SIN int(9) not null,
  FName VARCHAR(30) not null,
  LName VARCHAR(30) not null,
  Mailing_Address VARCHAR(50) not null,
  Phone_num VARCHAR(10) not null,
  Email VARCHAR(50) not null,
  primary key (Employee_ID));

create table article_employee
  (Employee_ID int(10) not null,
  Article_ID int(10) not null,
  foreign key fk_emp_to_art (employee_Id) references employee (employee_Id)
  on delete cascade on update cascade,
  foreign key fk_art_to_emp (Article_ID) references article (Article_ID)
  on delete cascade on update cascade);

create table profile
  (Profile_ID int(10) not null auto_increment,
  Year Year not null,
  About Text not null,
  Financial_Review_text TEXT not null,
  Financial_Trans_Score VARCHAR(50) not null,
  Preparer_notes VARCHAR(50) null,
  Charity_ID int(10) not null,
  primary key (Profile_ID),
  foreign key fk_char_to_pro (Charity_ID) references Charity (Charity_ID)
  on delete cascade on update cascade);

create table employee_profile
  (Profile_ID int(10) not null,
  Employee_ID int(10) not null,
  Primary key (Profile_ID, Employee_ID),
  foreign key fk_emp_to_prof (Employee_ID) references employee (Employee_ID)
  on delete cascade on update cascade,
  foreign key fk_prof_to_emp (Profile_ID) references profile (Profile_ID)
  on delete cascade on update cascade);


insert into article (Pub_date, Title, Article_text)
    values ('2001-02-11', 'Shambolic', 'The untimely blooming of shambolic pirates is unforeseen.'),
  ('2002-01-09', 'Trees Breathe', 'Trees can breathe through leaves and eat through photosynthesis.'),
  ('2005-05-15', 'Water Bottles', 'Water bottles can bring levity and calm to a person.'),
  ('2015-12-12', 'Speakers', 'Which speaker company is the best and produces accurate sound.'),
  ('2019-11-10', 'Sneakers', 'Sneakers can provide boost and hops and cushioning.');

insert into charity (Registration, Legal_name, Common_name, Mailing_address, Province, URL)
    values (101, 'Heal The World Inc','Heal The World','35 Neverland Crescent', 'ON','healthworld.com'),
    (102, 'Save the Planet TM','Save the Planet','46 Albania Drive', 'AB','savetheplanet.com'),
    (103, 'Environmental Healing Inc','Environmental Healing','5255 Planetary Drive','QB','envheal.com'),
    (104, 'Free the Children Incorporated','Free the Children','403 Childs Way','ON','freethechildren.com'),
    (105, 'Animal Kingdom Revival TM','Animal Kingdom Revival','8095 Gorillaz Crescent', 'SK','animalkingdom.com');

insert into sector (Sector_Name)
    values ('Charity'),
    ('Donation'),
    ('Environment'),
    ('Child Services'),
    ('Environment');

insert into session (Cookies_ID, DateTime_CookieCreation, DateTime_CookieExpiration, Activity_Date, Activity_time)
  values (3342, '1999-01-01 07:36:01', '2021-02-02 15:52:01', '2021-01-02', '02:42:11'),
  (3342, '1999-01-01 04:46:01', '2001-05-12 15:26:11', '2021-01-02', '02:45:11'),
  (3342, '2018-11-21 02:43:01', '2020-02-22 15:32:42', '2014-01-02', '03:52:11'),
  (3342, '2010-05-12 09:11:11', '2014-03-02 16:52:29', '2001-01-12', '02:42:16'),
  (3342, '2011-09-14 11:12:11', '2011-02-06 18:52:01', '2032-10-02', '09:22:11');

insert into employee (SIN, Fname, Lname, Mailing_Address, Phone_num, Email)
  values (435,'Richard', 'Jefferson', '105 Parkwood Drive', '4168238090', 'rjeff@hotmail.com'),
  (345,'Mona', 'Teresa', '43 Hill Crescent', '6478098654', 'mona.teresa@gmail.com'),
  (44335,'Tyrus', 'Judas', '55 Greentop Hill', '9058437834', 'tjudas@yahoo.com'),
  (236,'Yula', 'Nolan', '493 Cheetah Road', '6475093240','yulanolan@gmail.com'),
  (657,'Billy', 'Brier', '87 Trumpeter Street', '4168709329', 'bbrier@yahoo.com');

insert into donation (Date, Time, Amount, Session_ID)
  values ('2020-08-08', '07:33:40', 30.00, 4),
  ('2009-03-11', '10:55:55', 25.50, 2),
  ('2020-04-05', '12:32:30', 15.50, 4),
  ('2015-10-05', '19:45:32', 5.55, 5),
  ('2008-12-15', '20:18:09', 10.00, 4),
  ('2003-03-18', '10:32:55', 25.50, 2),
  ('2018-04-04', '08:32:30', 15.50, 4),
  ('2020-12-11', '21:10:09', 65.00, 1),
  ('2020-12-11', '21:10:09', 20.00, 3);


insert into profile (Year, About, Financial_Review_text, Financial_Trans_Score, Preparer_notes, charity_ID)
  values ('2005', 'Saving Dogs', 'Fantastic Financial review test', '89', NULL, 1),
  ('2010', 'Happy Retirement', 'Amazing Review', '99', 'This is an important note.', 2),
  ('2021', 'Covid-19 Family', 'Finances doing well', '78', 'What is a Preparer_Notes?', 2),
  (1967, 'Environment Cleanup', 'Splendid euphoric progression', '85',  Null, 3),
  (1987, 'Borin in 1987, attended UW, is a graduated', 'Great financial review text', '74', null, 2);

INSERT INTO charity_session (Charity_ID, Session_ID)
  values (1,2),
  (2,1),
  (3,5),
  (4,4),
  (5,3);

INSERT INTO charity_sector (Charity_ID, Sector_ID)
  values(1,2),
  (2,1),
  (3,4),
  (4,5),
  (5,5);

INSERT INTO session_article (Session_ID, Article_ID)
values (3,1),
(5,1),
(2,1),
(4,5),
(2,3);

INSERT INTO article_employee (Employee_ID, Article_ID)
Values (2,3),
(1,4),
(2,4),
(5,5),
(4,5);

INSERT INTO employee_profile (Profile_ID, Employee_ID)
Values (2,5),
(5,4),
(3,5),
(2,2),
(1,5);

#Q-A
Select Legal_Name, Common_name, Province
from charity
where province="ON"
ORDER By common_name ASC;

#Q-B
SELECT employee.Fname as FirstName, employee.Lname As LastName, count(article_employee.article_id) as NumberofArticlesPublished
from employee
Left JOIN article_employee ON employee.employee_Id= article_employee.employee_Id
group by employee.employee_Id;

#Q-C
SELECT title, count(session_article.article_id) as TimesArticleViewed
from article
Left JOIN session_article ON article.article_Id= session_article.article_Id
group by title
ORDER BY count(session_article.article_id) DESC;

#Q-D
SELECT charity.common_name as CharityName, sector.sector_name as CharitySector, sum(donation.Amount) as SumOfDonations
from charity
INNER JOIN charity_sector on charity.charity_id= charity_sector.charity_Id
INNER JOIN sector on charity_sector.sector_Id=sector.sector_Id
INNER JOIN charity_session on charity.charity_id = charity_session.charity_Id
INNER JOIN session on charity_session.session_Id=session.session_Id
INNER JOIN donation on session.session_Id= donation.session_Id
WHERE donation.Date like '2020%'
group by common_name
order by sum(donation.Amount) DESC;
