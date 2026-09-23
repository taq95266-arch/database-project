CREATE DATABASE Airline;
USE Airline

CREATE TABLE airport(
Airport_code CHAR(4) PRIMARY KEY,
Name VARCHAR(10) NOT NULL,
City VARCHAR(10) NOT NULL,
Country VARCHAR(10) NOT NULL,
);


SELECT*FROM airport


CREATE TABLE aircraft(
Registration_num CHAR(4) PRIMARY KEY,
Num_of_manufactor INT,
Model VARCHAR(10) NOT NULL,
Manufactor VARCHAR(10) NOT NULL,
Year_of_manufactor INT,
Seating_capacity INT NOT NULL,
CONSTRAINT ck_aircraft_Capacity CHECK ( Seating_capacity >0),
);

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

SELECT*FROM Passenger

CREATE TABLE Booking(
Booking_ID CHAR(4) PRIMARY KEY,
Seat_num VARCHAR (10),
City VARCHAR(10) NOT NULL,
Class VARCHAR(10),
Booking_Date DATE  DEFAULT'CURRENT DATE',
Price Decimal,
National_ID CHAR(4) NOT NULL,
Flight_ID CHAR(4) NOT NULL,
FOREIGN KEY (National_ID) REFERENCES Passenger(National_ID),
FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID),
CONSTRAINT CK_Booking_class CHECK(Class IN ('Economy', 'Business', 'First')),
CONSTRAINT ck_Booking_Price CHECK ( Price >0),
 
);
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
SELECT*FROM Crew_member

DROP TABLE  Crew_member


CREATE TABLE Flight_Crew(
Flight_ID CHAR(4) PRIMARY KEY,
Crew_ID CHAR(4),
FOREIGN KEY (Crew_ID ) REFERENCES Crew_member (Crew_ID ),
);

SELECT*FROM Flight_Crew
DROP TABLE  Flight_Crew
