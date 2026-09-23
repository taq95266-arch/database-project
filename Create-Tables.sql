CREATE DATABASE Airline;
USE Airline

CREATE TABLE airport(
Airport_code CHAR(4) PRIMARY KEY,
Name VARCHAR(10),
City VARCHAR(10),
Country VARCHAR(10),
);


SELECT*FROM airport


CREATE TABLE aircraft(
Registration_num CHAR(4) PRIMARY KEY,
Num_of_manufactor INT,
Model VARCHAR(10),
Manufactor VARCHAR(10),
Year_of_manufactor INT,
Seating_capacity INT,
);

SELECT*FROM aircraft

CREATE TABLE Flight(
Flight_ID CHAR(4) PRIMARY KEY,
Status VARCHAR(10),
Departmrnt_datetime VARCHAR(10),
Arrival_datetime VARCHAR(10),
Airport_code CHAR(4),
Registration_num CHAR(4),
FOREIGN KEY (Airport_code) REFERENCES airport(Airport_code),
FOREIGN KEY (Registration_num ) REFERENCES aircraft(Registration_num )
);

DROP TABLE Flight

SELECT*FROM Flight



CREATE TABLE Passenger(
National_ID CHAR(4) PRIMARY KEY,
Full_Name VARCHAR(10),
DOB DATE ,
E_mail VARCHAR(10),
Phone VARCHAR(10),
Nationally VARCHAR(10),
);

SELECT*FROM Passenger

CREATE TABLE Booking(
Booking_ID CHAR(4) PRIMARY KEY,
Seat_num VARCHAR(10),
City VARCHAR(10),
Class VARCHAR(10),
Booking_Date DATE ,
Price Decimal,
National_ID CHAR(4),
Flight_ID CHAR(4),
FOREIGN KEY (National_ID) REFERENCES Passenger(National_ID),
FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID),
);
SELECT*FROM Booking

DROP TABLE Booking

CREATE TABLE Crew_member(
Crew_ID CHAR(4) PRIMARY KEY,
Full_Name VARCHAR(10),
Role VARCHAR(10),
Flight_ID CHAR(4),
FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID),
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
