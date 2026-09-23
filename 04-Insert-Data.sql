CREATE DATABASE Airline;
USE Airline

CREATE TABLE airport(
Airport_code CHAR(4) PRIMARY KEY,
Name VARCHAR(10) NOT NULL,
City VARCHAR(10) NOT NULL,
Country VARCHAR(10) NOT NULL,
);

INSERT INTO airport
(Airport_code, Name, City, Country)
VALUES
('MCT1', 'Muscat', 'Muscat', 'Oman'),
('DXB1', 'Dubai', 'Dubai', 'UAE'),
('DOH1', 'Hamad', 'Doha', 'Qatar'),
('LHR1', 'Heathrow', 'London', 'UK');



SELECT*FROM airport


CREATE TABLE aircraft(
Registration_num CHAR(4) PRIMARY KEY,
Num_of_manufactor INT,
Model VARCHAR(10) NOT NULL,
Manufactor VARCHAR(10) NOT NULL,
Year_of_manufactor INT,
Seating_capacity INT NOT NULL,
CONSTRAINT ck_aircraft_Capacity CHECK ( Seating_capacity >0)
);

INSERT INTO aircraft
(Registration_num, Num_of_manufactor, Model, Manufactor,Year_of_manufactor,Seating_capacity)
VALUES
('A101', 1001, 'A320', 'Airbus', 2020, 180),
('B202', 1002, 'B737', 'Boeing', 2021, 189),
('A303', 1003, 'A350', 'Airbus', 2022, 300),
('B404', 1004, 'B787', 'Boeing', 2023, 250);

SELECT*FROM aircraft

CREATE TABLE Flight(
Flight_ID CHAR(4) PRIMARY KEY,
Status VARCHAR(10) NOT NULL DEFAULT' Scheduled',
Departmrnt_datetime VARCHAR(10) NOT NULL  ,
Arrival_datetime VARCHAR(10) NOT NULL ,
Airport_code CHAR(4),
Registration_num CHAR(4),
FOREIGN KEY (Airport_code) REFERENCES airport(Airport_code),
FOREIGN KEY (Registration_num ) REFERENCES aircraft(Registration_num ),

 CONSTRAINT CK_fLight_status CHECK(Status IN ('Scheduled', 'Delayed', 'Cancelled', 'Completed')),
 CONSTRAINT ST_fLight_TIME CHECK ( Arrival_datetime >Departmrnt_datetime),
);

INSERT INTO Flight
(Flight_ID, Status, Departmrnt_datetime, Arrival_datetime, Airport_code, Registration_num)
VALUES
('F001', 'Scheduled', '2026-09-25', '2026-09-25', 'MCT1', 'A101'),
('F002', 'Delayed',   '2026-09-25', '2026-09-25', 'DXB1', 'B202'),
('F003', 'Cancelled', '2026-09-26', '2026-09-26', 'DOH1', 'A303'),
('F004', 'Completed', '2026-09-26', '2026-09-26', 'LHR1', 'B404'),
('F005', 'Scheduled', '2026-09-27', '2026-09-27', 'MCT1', 'A303'),
('F006', 'Delayed',   '2026-09-27', '2026-09-27', 'DXB1', 'A101'),
('F007', 'Completed', '2026-09-28', '2026-09-28', 'DOH1', 'B202'),
('F008', 'Cancelled', '2026-09-28', '2026-09-28', 'LHR1', 'B404');
DROP TABLE Flight

SELECT*FROM Flight



CREATE TABLE Passenger(
National_ID CHAR(4) PRIMARY KEY,
Full_Name VARCHAR(10) NOT NULL,
DOB DATE ,
E_mail VARCHAR(10) NOT NULL,
Phone VARCHAR(10) NOT NULL ,
Nationally VARCHAR(10) NOT NULL,
);


ALTER TABLE Passenger
ALTER COLUMN E_mail VARCHAR(100) NOT NULL;

ALTER TABLE Passenger
ALTER COLUMN Phone VARCHAR(20) NOT NULL;


ALTER TABLE Passenger
ALTER COLUMN Nationally VARCHAR(30) NOT NULL;

ALTER TABLE Passenger
ALTER COLUMN Full_Name VARCHAR(50) NOT NULL;



INSERT INTO Passenger
(National_ID, Full_Name, DOB, E_mail,Phone,Nationally)
VALUES
('P001', 'Ali Ahmed', '2000-05-12', 'ali@gmail.com', '91234567', 'Omani'),
('P002', 'Sara Khan', '1999-08-20', 'sara@gmail.com', '92345678', 'Indian'),
('P003', 'John Smith', '1998-03-15', 'john@gmail.com', '50123456', 'British'),
('P004', 'Mona Hassan', '2001-11-10', 'mona@gmail.com', '55123456', 'Qatari'),
('P005', 'Ahmed Salem', '1997-06-25', 'ahmed@gmail.com', '93456789', 'Egyptian'),
('P006', 'Lina Chen', '2002-01-18', 'lina@gmail.com', '95678901', 'Chinese'),
('P007', 'Carlos Diaz', '1996-09-30', 'carlos@gmail.com', '96789012', 'Spanish'),
('P008', 'Aisha Noor', '2000-12-05', 'aisha@gmail.com', '97890123', 'Malaysian');

SELECT*FROM Passenger

CREATE TABLE Booking(
Booking_ID CHAR(4) PRIMARY KEY,
Seat_num VARCHAR (10),
City VARCHAR(10) NOT NULL,
Class VARCHAR(10),
Booking_Date DATE  DEFAULT GETDATE(),
Price Decimal,
National_ID CHAR(4) NOT NULL,
Flight_ID CHAR(4) NOT NULL,
FOREIGN KEY (National_ID) REFERENCES Passenger(National_ID),
FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID),
CONSTRAINT CK_Booking_class CHECK(Class IN ('Economy', 'Business', 'First')),
CONSTRAINT ck_Booking_Price CHECK ( Price >0)
 
);

ALTER TABLE Booking
ALTER COLUMN Price DECIMAL (10,2) NOT NULL;


INSERT INTO Booking
(Booking_ID, Seat_num, City, Class, Price, National_ID, Flight_ID)
VALUES
('B001', '12A', 'Dubai', 'Economy', 50.00, 'P001', 'F001'),
('B002', '14B', 'Doha', 'Business', 120.00, 'P002', 'F002'),
('B003', '3A', 'Muscat', 'First', 250.00, 'P003', 'F003'),
('B004', '20C', 'London', 'Economy', 180.00, 'P004', 'F004'),
('B005', '5D', 'Muscat', 'Business', 130.00, 'P005', 'F005'),
('B006', '2A', 'Doha', 'First', 300.00, 'P006', 'F006'),
('B007', '18B', 'Doha', 'Economy', 70.00, 'P007', 'F007'),
('B008', '7C', 'Dubai', 'Business', 140.00, 'P008', 'F008'),
('B009', '22A', 'Muscat', 'Economy', 60.00, 'P001', 'F002'),
('B010', '4B', 'Doha', 'First', 280.00, 'P002', 'F004');

SELECT*FROM Booking

DROP TABLE Booking

CREATE TABLE Crew_member(
Crew_ID CHAR(4) PRIMARY KEY,
Full_Name VARCHAR(10) NOT NULL,
Role VARCHAR(10) NOT NULL,
Flight_ID CHAR(4),
FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID),
CONSTRAINT CK_Crew_member CHECK(Role IN ('Pilot', 'Co-Pilot', 'Flight Attendant', 'Engineer')),
);

ALTER TABLE Crew_member
ADD License_num VARCHAR(20) NOT NULL;

ALTER TABLE Crew_member
ALTER COLUMN Full_Name VARCHAR(50) NOT NULL;

ALTER TABLE Crew_member
ALTER COLUMN Role VARCHAR(50) NOT NULL;

INSERT INTO Crew_member
(Crew_ID, Full_Name, Role, Flight_ID,License_num)
VALUES
('C001', 'Ahmed Ali', 'Pilot', 'F001', 'LIC001'),
('C002', 'Sara Khan', 'Co-Pilot', 'F001', 'LIC002'),
('C003', 'Mona Hassan', 'Flight Attendant', 'F002', 'LIC003'),
('C004', 'John Smith', 'Engineer', 'F002', 'LIC004'),
('C005', 'Khalid Said', 'Pilot', 'F003', 'LIC005'),
('C006', 'Lina Noor', 'Flight Attendant', 'F004', 'LIC006');



SELECT*FROM Crew_member

DROP TABLE  Crew_member


CREATE TABLE Flight_Crew(
Crew_ID CHAR(4) not null,
Flight_ID CHAR(4) not null,
 PRIMARY KEY (Flight_ID,Crew_ID),
FOREIGN KEY (Crew_ID ) REFERENCES Crew_member (Crew_ID ),
FOREIGN KEY (Flight_ID ) REFERENCES Flight (Flight_ID )
);

INSERT INTO Flight_Crew
(Crew_ID, Flight_ID)
VALUES
('F001', 'C001'),
('F001', 'C003'),
('F002', 'C002'),
('F002', 'C006'),
('F003', 'C005'),
('F003', 'C003'),
('F004', 'C001'),
('F004', 'C006'),
('F005', 'C005'),
('F005', 'C003'),
('F006', 'C002'),
('F006', 'C006'),
('F007', 'C001'),
('F007', 'C003'),
('F008', 'C005'),
('F008', 'C006');


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Flight_Crew';


DROP TABLE Flight_Crew;

SELECT*FROM Flight_Crew

