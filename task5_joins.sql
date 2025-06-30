CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50),
    Email VARCHAR(100) UNIQUE
);

INSERT INTO Staff (Name, Role, Email) VALUES
('Johnson', 'Librarian', 'johnson@gmail.com'),
('Ram', 'Assistant', 'ram@gmail.com');

CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    JoinDate DATE
);

INSERT INTO Members (Name, Email, JoinDate) VALUES
('Doe','doe@gmail.com', '2025-06-20'),
('Jane','jane@gmail.com', '2025-03-12');


CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    Status ENUM('Available', 'Loaned', 'Reserved') DEFAULT 'Available'
);

INSERT INTO Books (Title, ISBN, Status) VALUES
('The Great Gatsby', '9780743273565', 'Available'),
('1984', '9780451524935', 'Loaned'),
("A Good Girl's Guide to Murder", '9780061120084', 'Reserved');


CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    ReservationDate DATE NOT NULL,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Reservations (BookID, MemberID, ReservationDate) VALUES
(1, 2, '2025-06-20');


CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    StaffID INT,
    LoanDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

INSERT INTO Loans (BookID, MemberID, StaffID, LoanDate, DueDate, ReturnDate) VALUES
(2, 1, 1, '2025-06-01', '2025-06-15', NULL);


CREATE TABLE Fines (
    FineID INT PRIMARY KEY AUTO_INCREMENT,
    LoanID INT,
    StaffID INT,
    Amount DECIMAL(6,2) NOT NULL,
    IssuedDate DATE NOT NULL,
    Paid BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

INSERT INTO Fines (LoanID, StaffID, Amount, IssuedDate, Paid) VALUES
(1, 2, 25.00, '2025-06-20', FALSE);

SELECT Members.MemberID, Members.Name, Loans.LoanID, Loans.LoanDate
FROM Members
INNER JOIN Loans ON Members.MemberID = Loans.MemberID;

SELECT Members.MemberID, Members.Name, Loans.LoanID, Loans.LoanDate
FROM Members
LEFT JOIN Loans ON Members.MemberID = Loans.MemberID;

SELECT Members.Name, Loans.LoanID, Loans.LoanDate
FROM Members
RIGHT JOIN Loans ON Members.MemberID = Loans.MemberID;

-- FULL OUTER JOIN = LEFT JOIN + RIGHT JOIN minus duplicates
SELECT Members.MemberID, Members.Name, Loans.LoanID, Loans.LoanDate
FROM Members
LEFT JOIN Loans ON Members.MemberID = Loans.MemberID

UNION

SELECT Members.MemberID, Members.Name, Loans.LoanID, Loans.LoanDate
FROM Members
RIGHT JOIN Loans ON Members.MemberID = Loans.MemberID;


