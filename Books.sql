DROP DATABASE IF EXISTS Bookstore;

CREATE DATABASE Bookstore;
USE Bookstore;

CREATE TABLE Books
(
`IdBook`INT NOT NULL AUTO_INCREMENT,
`AuthorName`TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`AuthorSurname` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`Title` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`Price` FLOAT, 
PRIMARY KEY(`IdBook`))
DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1
AUTO_INCREMENT=1;


CREATE TABLE Customers
(
`IdCustomer` INT NOT NULL AUTO_INCREMENT,
`CustomerName` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`CustomerSurname` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
`town` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci,
PRIMARY KEY(`IdCustomer`))
DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1
AUTO_INCREMENT=1;


CREATE TABLE Orders
(
`IdOrder` INT NOT NULL AUTO_INCREMENT,
`IdCustomer` INT NOT NULL,
`IdBooks` INT NOT NULL,
`OrderDate` DATE,
`Status` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
PRIMARY KEY(`IdOrder`))
DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=1
AUTO_INCREMENT=1;


INSERT INTO Books (AuthorName, AuthorSurname, Title, Price)
VALUES
('Jan', 'Michalak', 'Zaawansowane programowanie w PHP', 47.29),
('Andrzej', 'Krawczyk', 'Windows 10 PL. Zaawansowana administracja systemem',49.99),
('Paweł', 'Jakubowski', 'HTML 5 Tworzenie Witryn', 53.56),
('Tomasz', 'Kowalski', 'Urządzenia techniki komputerowej', 34.15),
('Łukasz', 'Pasternak', 'Java: Tworzenie nowoczesnych stron WWW', 29.99);

 INSERT INTO Customers (CustomerName, CustomerSurname, town)
 VALUES
 ('Łukasz', 'Lewandowski', 'Poznań'),
 ('Jan', 'Nowak', 'Katowice'),
 ('Maciej', 'Wójcik', 'Bydgoszcz'),
 ('Agnieszka', 'Jankowska', 'Lublin'),
 ('Tomasz', 'Mazur', 'Jelenia Góra'),
 ('Michał', 'Zieliński', 'Kraków'),
 ('Artur', 'Rutkowski', 'Kielce'),
 ('Mateusz', 'Skorupa', 'Gdańsk'),
 ('Łukasz', 'Lewandowski', 'Poznań'),
 ('Jerzy', 'Rytkowski', 'Włózmitu'),
 ('Anna', 'Karenna', 'Tumidaj');
 
 
 INSERT INTO Orders(IdCustomer, IdBooks, OrderDate, Status)
 VALUES
 (2, 4, "2017-10-08", 'oczekiwanie'),
 (7, 1, "2017-09-05", 'wysłano'),
 (9, 1, "2017-10-11", 'wysłano'),
 (2, 2, "2017-10-15", 'oczekiwanie'),
 (2, 5, "2017-08-12", 'oczekiwanie'),
 (3, 2, "2017-10-20", 'wysłano'),
 (4, 3, "2017-08-14", 'wysłano'),
 (8, 1, "2017-08-19", 'wysłano'),
 (3, 1, "2017-11-19", 'wysłano'),
 (9, 2, "2017-12-28", 'oczekiwane');
 
 
 #Wyjmijimię,nazwiskoklientów,którzykiedykolwiekzamówiliksiążkęnr2.Spróbujskorzystaćzaliasów.
 #SELECT c.CustomerName, c.CustomerSurname
 #FROM Customers AS c, Orders AS o
 #WHERE o.IdBooks = 2 AND c.IdCustomer = o.IdCustomer;
 
 #Jakieksiążki(tytułiautor)zamówiłJanNowak?
 #SELECT b.AuthorName, b.AuthorSurname, b.Title
 #FROM Books AS b, Orders AS o, Customers AS c
 #WHERE c.CustomerName = "Jan" AND
 #c.CustomerSurname = "Nowak" AND
 #c.IdCustomer = o.IdCustomer AND
 #o.IdBooks = b.IdBooks;
 
 #Posortuj zamówienia dokonane przez osoby o nazwisku Rutkowski ułożone wg daty od najpóźniej 
 #dokonanych. Chcemy wyświetlić : 
 #imię i nazwisko osoby zamawiającej, id zamówienia ,datę, status zamówienia, 
 #tytuł zamówionej książki.
 
 #SELECT c.CustomerName, c.CustomerSurname, o.Id, o.OrderDate, o.Status, b.Title
 #FROM Customers AS c, Orders AS o, Books AS b
 #WHERE c.CustomerSurname= "Rutkowski" AND
 #c.IdCustomer = o.IdCustomer AND
 #o.IdBook = b.IdBook
 #ORDER BY
 #o.OrderDate ASC;
 
 
 USE Bookstore;
 
 #UPDATE Customers SET CustomerSurname="Psikuta" WHERE IdCustomer=4;
 #SELECT * FROM Customers WHERE IdCustomer=4;
 
 #UPDATE Customers SET IdCustomer=1 WHERE IdCustomer=3;
 
 
 #UPDATE Books SET Price=ROUND(Price*1.1,2);
 
 #UPDATE Books SET Price=Price-10 ORDER BY Price DESC LIMIT 1;
 
 #SELECT* FROM Customers;
 
 #SELECT * FROM Books WHERE Price = (SELECT MAX(Price) FROM Books);
 
 #UPDATE Customers SET CustomerName="Joanna", CustomerSurname="Dostojewska" WHERE IdCustomer=10;
 
 #UPDATE Orders SET status="wysłano" WHERE IdOrders=4 OR IdOrders=5;
 
 #INSERT INTO Customers(IdCustomer, CustomerName, CustomerSurname, town)
 #VALUES
 #(NULL, "Franciszek", "Janowski","Chorzów");
 
 #SELECT * FROM Customer;
 #INSERT INTO orders(IdCustomer, OrderDate, Status)
 #VALUES
 #(7,3, "2017-09-11", "oczekiwane")
 
 #INSERT INTO Books(AuthorSurname, Title)
 #VALUES("Grębosz", "Symfonia C++")
 
 
 
 
 




