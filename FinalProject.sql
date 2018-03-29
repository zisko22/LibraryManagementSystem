--Check if database exists, then drop to start anew if it does
IF (EXISTS(LibraryManagementSystem))
	DROP DATABASE LibraryManagementSystem;
--Create the LibraryManagementSystem Database
CREATE DATABASE LibraryManagementSystem
GO
--CREATE ALL THE TABLES
--Create Publisher Table
CREATE TABLE Publisher (
	Name VARCHAR(60) NOT NULL,
	PublisherAddress VARCHAR(60) NOT NULL,
	Phone VARCHAR(60) NOT NULL,
	PublisherAddress VARCHAR(60) NOT NULL,
	PRIMARY KEY (Name)
);
--Create LibraryBranch Table
CREATE TABLE LibraryBranch (
	BranchId INT NOT NULL,
	BranchName VARCHAR(60) NOT NULL,
	BranchAddress VARCHAR(60) NOT NULL,
	PRIMARY KEY (BranchId)
);
--Create Borrower Table
CREATE TABLE Borrower (
	CardNo INT NOT NULL,
	Name VARCHAR(60) NOT NULL,
	BorrowerAddress VARCHAR(60) NOT NULL,
	Phone VARCHAR(30) NOT NULL,
	PRIMARY KEY (CardNo)
);
--Create Book Table
CREATE TABLE Book (
	BookId INT NOT NULL,
	Title VARCHAR(60) NOT NULL,
	PublisherName VARCHAR(60) NOT NULL,
	PRIMARY KEY (BookId),
	FOREIGN KEY (PublisherName) REFERENCES Publisher(Name)
);
--Create BookCopies Table
CREATE TABLE BookCopies (
	BookId INT NOT NULL,
	BranchId INT NOT NULL,
	No_of_Copies INT NOT NULL,
	FOREIGN KEY (BookId) REFERENCES Book(BookId),
	FOREIGN KEY (BranchId) REFERENCES LibraryBranch(BranchId)
);
--Create BookLoans Table
CREATE TABLE BookLoans (
	BookId INT NOT NULL,
	BranchId INT NOT NULL,
	CardNo INT NOT NULL,
	DateOut VARCHAR(30) NOT NULL,
	DueDate VARCHAR(30) NOT NULL,
	FOREIGN KEY (BookId) REFERENCES Book(BookId),
	FOREIGN KEY (BranchId) REFERENCES LibraryBranch(BranchId)
);
--Create BookAuthors Table
CREATE TABLE BookAuthors (
	BookId INT NOT NULL,
	AuthorName VARCHAR(60) NOT NULL,
	FOREIGN KEY (BookId) REFERENCES Book(BookId)
);

--POPULATE ALL THE TABLES
--Populate Publisher Table
INSERT INTO Publisher
	(Name, PublisherAddress, Phone)
	VALUES
	('WW Norton & Company', '500 Fifth Ave, New York, NY, 10110', '212-354-5500'),
	('The Countryman Press', 'PO Box 748, Woodstock, VT, 05091', '212-354-5500'),
	('Random House', '1745 Broadway, New York, NY, 10019', '212-782-9000'),
	('Fulcrum Publishing', '350 Indiana St, Suite 350, Golden, Colorado, 80401',  '303-277-1623'),
	('Sterling', '387 Park Ave South, New York, NY, 10016', '800-367-9692'),
	('Pegasus Books LLC', '80 Broad St, 5th Floor, New York, NY, 10004', '503-644-7036'),
	('POCKET BOOKS', '1230 Avenue of the Americas, New York, NY, 10020', '212-698-7006'),
	('Penguin', '80 Strand, London, WC2R 0RL, England', '44-020-7139-3000'),
	('Oni Press', '1319 SE Martin Luther King, Jr Blvd, Suite 240, Portland, OR, 97214', '503-233-1377'),
	('Chartwell Books', '142 West 36th St, 4th Floor, New York, NY, 10018', '212-308-0643'),
	('Frances Lincoln Limited', '6 Blundell St, London, N7 9BH, United Kingdom', '44-020-7700-6700'),
	('Shelter Harbor Press', '603 West 115th St, Suite 163, New York, NY, 10025', '212-864-0427'),
	('The Globe Pequot Press','PO Box 480, Guilford, CT, 06437', '203-458-4500'),
	('Quarry Books', '100 Cummings Center, Suite 406-L, Beverly, MA, 01915', '978-282-9590'),
	('Timber Press', '133 SW Second Ave, Suite 450, Portland, OR, 97204', '503-227-2878'),
	('Picador', '175 Fifth Ave, New York, NY 10010', '800-221-7945')
;
--Populate LibraryBranch Table
INSERT INTO LibraryBranch
	(BranchId, BranchName, BranchAddress)
	VALUES
	(1, 'Sharpstown', '123 Fake St, Portland, OR 97204'),
	(2, 'Central', '456 Real Rd, Portland, OR 97204'),
	(3, 'Dullsville', '123 Unicorn Ave, Portland, OR 97204'),
	(4, 'Industrial', '326 Donkey Dr, Portland, OR 97204')
;
--Populate Borrower Table
INSERT INTO Borrower
	(CardNo, Name, BorrowerAddress, Phone)
	VALUES
	(100001, 'Melvin Hedrick', '123 Fake St, OR 97204', '319-943-4949'),
	(100002, 'Murphy Mule', '456 Real Rd, Portland, OR 97204', '418-493-2304'),
	(100003, 'Joe Schmoe', '1928 Unicorn Ave, Portland, OR, 97204', '382-483-3949'),
	(100004, 'Larrry Davis', '384 Mule Way, Portland, OR 97204', '493-494-5940'),
	(100005, 'Zach Galifinakis', '9387 Donkey Dr, Portland, OR, 97204', '948-394-3049'),
	(100006, 'Jane Doe', '8498 Giraffe Dr, Portland, OR 97204', '945-490-4950'),
	(100007, 'Donald Trump','2839 Tupee Way, Cincinati, OH 41073','316-465-4565')
;
--Populate Book Table
INSERT INTO Book
	(BookId, Title, PublisherName)
	VALUES
	(1, 'The Elegant Universe', 'WW Norton & Company'),
	(2, '50 Hikes in Oregon', 'The Countryman Press'),
	(3, 'The Dragons of Eden', 'Random House'),
	(4, 'The Columbia River: A Historical Travel Guide', 'Fulcrum Publishing'),
	(5, 'The Demon-Haunted World', 'Random House'),
	(6, 'Brocas Brain', 'Random House'),
	(7, 'Edible Wild Plants', 'Sterling'),
	(8, 'Brother', 'Random House'),
	(9, 'Wanderers', 'Random House'),
	(10, 'Accelerated', 'Pegasus Books LLC'),
	(11, 'Everythings Eventual', 'POCKET BOOKS'),
	(12, 'Tibetan Book of the Dead', 'Penguin'),
	(13, 'Stumptown: Volume 1', 'Oni Press'),
	(14, 'The Sacred Wisdom of the Native Americans', 'Chartwell Books'),
	(15, 'Raw Food French Style', 'Frances Lincoln Limited'),
	(16, 'The Physics Book', 'Sterling'),
	(17, 'Philosophy', 'Shelter Harbor Press'),
	(18, 'Hiking & Backpacking', 'The Globe Pequot Press'),
	(19, 'The Home Apothecary', 'Quarry Books'),
	(20, 'The Herbal Apothecary', 'Timber Press'),
	(21, 'A Brief History of Time', 'Random House'),
	(22, 'The Lost Time', 'Picador'),
	(23, 'The Shining', 'Random House')
;
--Populate BookCopies Table
INSERT INTO BookCopies
	(BookId, BranchId, No_of_Copies)
	VALUES
	(1,1,2),
	(2,2,3),
	(3,1,2),
	(4,2,4),
	(5,1,5),
	(6,2,4),
	(7,1,3),
	(8,2,4),
	(9,1,5),
	(10,1,4),
	(11,2,3),
	(12,2,5),
	(13,1,4),
	(14,2,6),
	(15,1,5),
	(16,2,6),
	(17,1,6),
	(18,2,4),
	(19,1,5),
	(20,2,3),
	(21,1,2),
	(22,2,2),
	(1,3,2),
	(2,4,3),
	(3,3,4),
	(4,4,3),
	(5,3,3),
	(6,4,4),
	(7,3,4),
	(8,4,5),
	(9,3,8),
	(10,4,7),
	(11,3,3),
	(12,4,4),
	(13,3,6),
	(14,4,4),
	(15,3,5),
	(16,4,3),
	(17,3,4),
	(18,4,4),
	(19,3,4),
	(20,4,4),
	(21,3,4),
	(22,4,5),
	(22,1,6),
	(23,2,4)
;
--Populate BookLoans Table
INSERT INTO BookLoans
	(BookId, BranchId, CardNo, DateOut, DueDate)
	VALUES
	(1,1,100001,'2018-03-15','2018-04-15'),
	(2,2,100002,'2018-03-17','2018-04-17'),
	(3,3,100003,'2018-03-28','2018-04-28'),
	(4,4,100004,'2018-03-01','2018-04-01'),
	(5,1,100005,'2018-03-02','2018-03-02'),
	(6,2,100006,'2018-03-03','2018-04-03'),
	(7,3,100001,'2018-03-04','2018-04-04'),
	(8,4,100001,'2018-03-05','2018-04-05'),
	(9,1,100001,'2018-03-06','2018-04-06'),
	(10,2,100001,'2018-03-07','2018-04-07'),
	(11,3,100001,'2018-03-08','2018-04-08'),
	(12,4,100002,'2018-03-09','2018-04-09'),
	(13,1,100002,'2018-03-10','2018-04-10'),
	(14,2,100002,'2018-03-11','2018-04-11'),
	(15,3,10002,'2018-03-12','2018-04-12'),
	(16,4,100002,'2018-03-13','2018-04-13'),
	(17,1,100003,'2018-03-14','2018-04-14'),
	(18,2,100004,'2018-03-15','2018-04-15'),
	(19,3,100005,'2018-03-16','2018-04-16'),
	(20,4,100006,'2018-03-17','2018-04-17'),
	(21,1,100001,'2018-03-18','2018-04-18'),
	(22,2,100002,'2018-03-19','2018-04-19'),
	(1,3,100003,'2018-03-20','2018-04-20'),
	(2,4,100004,'2018-03-21','2018-04-21'),
	(3,1,100005,'2018-03-22','2018-04-22'),
	(4,2,100006,'2018-03-23','2018-04-23'),
	(5,3,100001,'2018-03-24','2018-04-24'),
	(6,4,100002,'2018-03-25','2018-04-25'),
	(7,1,100003,'2018-03-26','2018-04-26'),
	(8,2,100004, '2018-03-27','2018-04-27'),
	(9,3,100005,'2018-03-28','2018-04-28'),
	(10,4,100006,'2018-03-29','2018-04-29'),
	(11,1,100001,'2018-03-30','2018-04-30'),
	(12,2,100002,'2018-03-31','2018-05-01'),
	(13,3,100003,'2018-04-01','2018-05-02'),
	(14,4,100004,'2018-04-02','2018-05-03'),
	(15,1,100005,'2018-04-03','2018-05-04'),
	(16,2,100006,'2018-04-04','2018-05-05'),
	(17,3,100001,'2018-04-05','2018-05-06'),
	(18,4,100002,'2018-04-06','2018-05-07'),
	(19,1,100003,'2018-04-07','2018-05-08'),
	(20,2,100004,'2018-04-08','2018-05-09'),
	(21,3,100005,'2018-04-09','2018-05-10'),
	(22,4,100006,'2018-04-10','2018-05-11'),
	(1,1,100001,'2018-03-02','2018-04-02'),
	(2,2,100002,'2018-03-03','2018-04-03'),
	(3,3,100003,'2018-03-04','2018-04-04'),
	(4,4,100004,'2018-03-05','2018-04-05'),
	(5,1,100005,'2018-03-06','2018-04-06'),
	(6,2,100006,'2018-03-07','2018-04-07'),
	(7,3,100001,'2018-03-08','2018-04-08'),
	(8,4,100002,'2018-03-09','2018-04-09'),
	(9,1,100003,'2018-03-10','2018-04-10'),
	(10,2,100004,'2018-03-11','2018-04-11')
;
--Populate BookAuthors Table
INSERT INTO BookAuthors
	(BookId, AuthorName)
	VALUES
	(1, 'Brian Greene'),
	(2, 'David L Anderson'),
	(3, 'Carl Sagan'),
	(4, 'JoAnn Roe'),
	(5, 'Carl Sagan'),
	(6, 'Carl Sagan'),
	(7, 'Thomas S Elias'),
	(8, 'Yu Hua'),
	(9, 'Meg Howry'),
	(10, 'Browen Hruska'),
	(11, 'Stephen King'),
	(12, 'Padmasambhava'),
	(13, 'Greg Rucka'),
	(14, 'Larry J Zimmerman'),
	(15, 'Delphine de Montalier'),
	(16, 'Clifford A Pickover'),
	(17, 'David Papineau'),
	(18, 'Buck Tilton'),
	(19, 'Stacey Dugliss-Wesselman'),
	(20, 'JJ Pursell'),
	(21, 'Stephen Hawking'),
	(22, 'Mark Lee'),
	(23, 'Stephen King')
;

--CREATE ALL THE PROCEDURES
--Produce the number of copies of 'The Lost Tribe' at the 'Sharpstown' branch
CREATE PROCEDURE LostTribeSharpstown
AS
	SELECT No_of_Copies FROM BookCopies
	WHERE BookCopies.BranchId = 1
	AND BookCopies.BookId = 22;
GO
--Produce the number of copies of 'The Lost Tribe' at all the branches
CREATE PROCEDURE LostTribe
AS
	SELECT BookCopies.No_of_Copies, LibraryBranch.BranchName
		FROM BookCopies, LibraryBranch
		WHERE BookCopies.BookId = 22;
GO
--Produce the names of all borrowers who do not have a current loan
CREATE PROCEDURE InactiveBorrowers
AS
	--Select Name for borrowers with no current loans
	SELECT Borrower.Name AS 'Name: '
		FROM (Borrower INNER JOIN BookLoans)
		WHERE BookLoans.CardNo = NULL;
GO
--Produce the title, borrower name, and borrower address of everyone with a book due at 'Sharpstown'
--with today as the due date
CREATE PROCEDURE SharpstownDueToday
AS
	SELECT Book.Title, Borrower.Name, Borrower.BorrowerAddress
		FROM Book, Borrower, BookLoans
		WHERE BookLoans.DueDate = '2018-03-27'
		AND BookLoans.BranchId = 1;
GO
--Produce the number of all the loans at each branch
CREATE PROCEDURE AllLoans
AS
	--Select loans from each branch
	--Sharpsville
	SELECT COUNT(BranchId) AS 'Sharpstown Loans: '
		FROM BookLoans
		WHERE BookLoans.BranchId = 1;
	--Central
	SELECT COUNT(BranchId) AS 'Central Loans: '
		FROM BookLoans
		WHERE BookLoans.BranchId = 2;
	--Dullsville
	SELECT COUNT(BranchId) AS 'Dullsville Loans: '
		FROM BookLoans
		WHERE BookLoans.BranchId = 3;
	--Industrial
	SELECT COUNT(BranchId) AS 'Industrial Loans: '
		FROM BookLoans
		WHERE BookLoans.BranchId = 4;
GO
--Produce the name, addresss, and number of books for borrowers with more than five current loans
CREATE PROCEDURE MoreThanFive
AS
	--Select names, addresses, and number of books for borrowers with more than five
	SELECT Borrower.Name AS 'Name: ', Borrower.BorrowerAddress AS 'Address: ', COUNT(BookLoans.CardNo) AS 'Total Loans: '
		FROM Borrower, BookLoans
		WHERE Borrower.CardNo = BookLoans.CardNo
		GROUP BY Borrower.Name, Borrower.BorrowerAddress
		HAVING COUNT(BookLoans.CardNo) > 5;
GO
--Produce the title and number of copies of all books written by 'Stephen King'
--and located at the central branch
CREATE PROCEDURE StephenKingCentral
AS
	--Select title and number of copies, where branch is central and Author is Stephen King
	SELECT Book.Title AS 'Title: ', BookCopies.No_of_Copies AS 'Central Copies: ', BookAuthors.AuthorName AS 'Author Name: '
		FROM Book, BookCopies, BookAuthors
		WHERE BookAuthors.AuthorName = 'Stephen King'
		AND BookCopies.BranchId = 2
		AND Book.BookId = BookAuthors.BookId;
GO
