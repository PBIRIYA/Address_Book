Create Database Address_Book_Service;
Use Address_Book_Service;

--UC2
Select DB_NAME()
Create TABLE ADDRESS_BOOK
(
FIRSTNAME VARCHAR(25) not null,
LASTNAME VARCHAR(25) not null,
ADDRESS VARCHAR(25) not null,
CITY VARCHAR(25) not null,
STATE VARCHAR(25) NOT NULL,
ZIP VARCHAR(25) not null,
PHONE VARCHAR(25) not null,
EMAIL VARCHAR(25) not null,
)
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='ADDRESS_BOOK';

--UC3
insert into Address_Book values
('Bill','Jones','Street 4','Mumbai','Maharashtra','452856','9856985696','billjones@gmail.com'),
('Leena','Thomas','New Market','Bhopal','Madhya Pradesh','852147','7458632156','leena@gmail.com'),
('Rakhi','Saraf','Manik Nagar','Ajmer','Rajasthan','125463','8596785425','rakhi@gmail.com');
select* from Address_Book;

--UC4
update Address_Book
set Address = 'street 10' where FirstName = 'Bill';
select* from Address_Book;

--UC5
delete Address_Book
where FirstName = 'Bill';
select* from Address_Book;

--UC6
select * from Address_Book
where City = 'Bhopal' or State = 'Madhya Pradesh';

--UC7
select COUNT(City), City, State from Address_Book
group by State, City;

--UC8
select * from Address_Book
where City = 'Bhopal'
order by FirstName asc;

--UC9
--Add Contact_Type attribute to address_book
alter table Address_Book
add Contact_Type varchar(20)
--Update Contacts for contact_type
update Address_Book set Contact_Type ='Friends' where FirstName in ('Bill', 'Terrisa', 'Priyanka');
update Address_Book set Contact_Type ='Family' where FirstName in ('Leena','Karishma');
update Address_Book set Contact_Type ='Professional' where FirstName='Rakhi';
select * from Address_Book;
--Add Book_Name attribute to address_book
alter table Address_Book
add Book_Name varchar(20)
--Update Contacts for book_name
update Address_Book set  Book_Name ='Office' where FirstName in ('Bill', 'Terrisa', 'Priyanka', 'Rakhi');
update Address_Book set  Book_Name ='Home' where FirstName in ('Leena','Karishma');
select * from Address_Book;

--UC10
--Count contacts by contact type
select Contact_Type, COUNT(Contact_Type) from Address_Book
group by Contact_Type