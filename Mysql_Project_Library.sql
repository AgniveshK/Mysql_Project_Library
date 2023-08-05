CREATE DATABASE Library;
USE Library;
CREATE TABLE Branch(Branch_no INT PRIMARY KEY,Manager_id INT,Branch_address VARCHAR(40),Contact_no VARCHAR(20));
INSERT INTO Branch VALUES(1,7001,'vv ariyallur','1223334444'),
						 (2,7002,'cp vallikkunnu','433222111'),
                         (3,7003,'am anangadi','2334441111'),
                         (4,7004,'nj feroke','3114442222'),
                         (5,7005,'ms tirur','51122233333');
SELECT * FROM Branch;

CREATE TABLE Employee(Emp_id INT PRIMARY KEY,Emp_name VARCHAR(40),Position VARCHAR(30),Salary INT);
INSERT INTO Employee VALUES(7001,'aryan','librarian',40000),
						   (7002,'boby','data analyst',60000),
                           (7003,'carolina','accountant',35000),
                           (7004,'darwin','clerk',30000),
                           (7005,'emil','manager',50000);
SELECT * FROM Employee;                           

CREATE TABLE Customer(Customer_id INT PRIMARY KEY,Customer_name VARCHAR(30),Customer_addresss VARCHAR(30),Reg_date DATE);
INSERT INTO Customer VALUES(1,'febin','kochi','2023-12-01'),
						   (2,'george','calicut','2023-11-02'),
                           (3,'hailey','malappuram','2023-10-03'),
                           (4,'ian','kollam','2023-09-04'),
                           (5,'jack','thrissur','2023-08-05'),
                           (6,'knight','goa','2021-12-30'),
					       (7,'levy','kannur','2023-06-03');
SELECT * FROM Customer;

CREATE TABLE Books(ISBN VARCHAR(50) PRIMARY KEY,Book_title VARCHAR(40),Category VARCHAR(40),Rental_price INT,Status VARCHAR(5),Author VARCHAR(30),Publisher VARCHAR(30));
INSERT INTO Books VALUES('978-0-9036-4249-1','HOW TO WIN FRIENDS AND INFLUENCE PEOPLE','Business and management',500,'yes','Dale carnegie','Pocket books'),
					    ('978-2-5936-9707-2','STRENGTH FINDER','Self improvement',400,'yes','Tom rath','Gallup press'),
                        ('978-3-3669-7888-6','THE SIX SIGMA WAY','Business',450,'yes','Peter s','McGraw hill'),
                        ('978-5-0858-8310-7','THE ESSENTIAL DRUCKER','Business administration',350,'yes','Peter drucker','Harper busines'),
                        ('978-8-2883-8631-3','COMPETING FOR THE FUTURE','Business intelligence',480,'yes','Gary hamel','Harvard business school press'),
                        ('978-7-2883-8631-4','WHAT IS HISTORY','History',300,'yes','Edward hallett carr','Penguin classics'),
                        ('978-9-2883-8631-5','THE COMMUNIST MANIFESTO','Politics',380,'yes','Karl marx','Kommunistischer');
SELECT * FROM Books;

CREATE TABLE IssueStatus(Issue_id INT PRIMARY KEY,Issued_cust INT,FOREIGN KEY(Issued_cust) REFERENCES Customer(Customer_id),Issued_book_name VARCHAR(40),Issue_date DATE,Isbn_book varchar(50),FOREIGN KEY(Isbn_book) REFERENCES Books(ISBN));  
INSERT INTO IssueStatus VALUES(559,1,'HOW TO WIN FRIENDS AND INFLUENCE PEOPLE','2023-12-12','978-0-9036-4249-1'),
					   (558,2,'STRENGTH FINDER','2023-10-07','978-2-5936-9707-2'),
                       (557,3,'THE SIX SIGMA WAY','2023-07-10','978-3-3669-7888-6'),
                       (556,4,'THE ESSENTIAL DRUCKER','2023-05-22','978-5-0858-8310-7'),
                       (555,5,'COMPETING FOR THE FUTURE','2023-04-12','978-8-2883-8631-3'),
                       (554,7,'THE COMMUNIST MANIFESTO','2023-06-14','978-9-2883-8631-5');
SELECT * FROM IssueStatus;   

CREATE TABLE ReturnStatus(Return_id INT PRIMARY KEY,Return_cust INT,Return_book_name VARCHAR(50),Return_date DATE,Isbn_book2 VARCHAR(50),FOREIGN KEY(Isbn_book2) REFERENCES Books(ISBN));
INSERT INTO ReturnStatus VALUES(011,1,'HOW TO WIN FRIENDS AND INFLUENCE PEOPLE','2023-07-10','978-0-9036-4249-1'),
							   (012,2,'STRENGTH FINDER','2023-10-12','978-2-5936-9707-2'),
                               (013,3,'THE SIX SIGMA WAY','2023-12-11','978-3-3669-7888-6'),
                               (014,4,'THE ESSENTIAL DRUCKER','2023-06-14','978-5-0858-8310-7'),
                               (015,5,'COMPETING FOR THE FUTURE','2023-08-15','978-8-2883-8631-3');
SELECT * FROM ReturnStatus;                    


SELECT Book_title,Category,Rental_price FROM Books WHERE Status='yes';

SELECT Emp_name,Salary FROM Employee ORDER BY Salary DESC;

SELECT Issuestatus.Issued_book_name, Customer.Customer_name 
from Issuestatus INNER JOIN Customer on Issuestatus.Issued_cust=Customer.Customer_id;

SELECT COUNT(Book_title)as Total_books,Category from Books GROUP BY Category;

SELECT Emp_name,Position,Salary FROM Employee WHERE Salary >50000;

SELECT Customer_id,Customer_name FROM Customer 
WHERE Reg_date < '2022-01-01' AND Customer_id NOT IN (SELECT Issued_cust FROM Issuestatus);

SELECT Branch_no,count(Manager_id)as Total_Employees FROM Branch GROUP BY Branch_no;


SELECT Customer_name,Issued_book_name FROM Customer,Issuestatus 
WHERE Customer.Customer_ID=Issuestatus.Issued_cust
AND Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

SELECT Book_title,Author,Category FROM Books WHERE Category='History';

SELECT Branch.Branch_no,count(*)as Countof_employees 
FROM Branch INNER JOIN Employee
ON Branch.Manager_id=Employee.Emp_id GROUP BY Branch.Branch_no
HAVING count(*)>5 ;







