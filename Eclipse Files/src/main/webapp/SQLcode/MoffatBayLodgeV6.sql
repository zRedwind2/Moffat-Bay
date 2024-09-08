-- Create the database
CREATE DATABASE MoffatBayLodge;
USE MoffatBayLodge;

-- Drop tables if they exist (Ensure that tables referencing others are dropped first)
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Account;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS User;

-- Create User table
CREATE TABLE User (
    User_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Phone_Number VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    AddressStreet VARCHAR(255),
    AddressCity VARCHAR(255), 
    AddressState VARCHAR(255),
    AddressZip VARCHAR(255)
);

-- Create Room table
CREATE TABLE Room (
    Room_ID INT AUTO_INCREMENT PRIMARY KEY,
    Room_Size VARCHAR(50),
    Occupancy INT
);

-- Create Account table with Salt for password hashing
CREATE TABLE Account (
    Account_ID INT AUTO_INCREMENT PRIMARY KEY,
    Password VARCHAR(255),   -- Store the hashed password here
    Salt VARBINARY(16),      -- Column for the salt value
    Username VARCHAR(100),
    User_ID INT,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

-- Create Bookings table (Referencing Account, Room, and User tables)
CREATE TABLE Bookings (
    Booking_ID INT AUTO_INCREMENT PRIMARY KEY,
    Account_ID INT,
    Room_ID INT,
    User_ID INT,
    Booking_Date DATE,
    Check_In DATE,
    Check_Out DATE,
    FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID),
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

-- Insert sample data into User table
INSERT INTO User (First_Name, Last_Name, Phone_Number, Email, AddressStreet, AddressCity, AddressState, AddressZip)
VALUES 
('John', 'Doe', '555-1234', 'john.doe@example.com', '123 Maple St', 'New York City', 'New York', '10001'),
('Jane', 'Smith', '555-5678', 'jane.smith@example.com', '456 Oak St', 'New York City', 'New York', '10002'),
('Bob', 'Johnson', '555-9101', 'bob.johnson@example.com', '789 Pine St', 'New York City', 'New York', '10003'),
('Amy', 'Brown', '555-1213', 'amy.brown@example.com', '101 Spruce St', 'New York City', 'New York', '10004');

-- Insert sample data into Room table
INSERT INTO Room (Room_Size, Occupancy)
VALUES 
('Double Full Beds', 2),
('Queen', 2),
('Double Queen Beds', 4),
('King', 2);

-- Insert sample data into Account table
INSERT INTO Account (Password, Salt, Username, User_ID)
VALUES 
('hashedPassword1', UNHEX(''), 'Username1', 1),
('hashedPassword2', UNHEX(''), 'Username2', 2),
('hashedPassword3', UNHEX(''), 'Username3', 3),
('hashedPassword4', UNHEX(''), 'Username4', 4);

-- Insert sample data into Bookings table
INSERT INTO Bookings (Account_ID, Room_ID, User_ID, Booking_Date, Check_In, Check_Out)
VALUES 
(1, 1, 1, '2024-09-01', '2024-09-10', '2024-09-15'),
(2, 2, 2, '2024-09-02', '2024-09-20', '2024-09-25'),
(3, 3, 3, '2024-09-03', '2024-09-30', '2024-10-05'),
(4, 4, 4, '2024-10-01', '2024-10-20', '2024-10-30');
