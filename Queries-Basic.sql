USE Airline


SELECT Flight_ID,Status
FROM Flight
ORDER BY Departmrnt_datetime;

SELECT Full_Name
FROM Passenger
ORDER BY Full_Name ASC;

SELECT Registration_num,Seating_capacity
FROM aircraft
ORDER BY Registration_num,Seating_capacity ASC;

SELECT Flight_ID,Status
FROM Flight
WHERE Status= 'Delayed' or Status= 'Cancelled';


SELECT distinct Class
FROM Booking

SELECT  Class
FROM Booking

SELECT Nationally
FROM Passenger
WHERE Nationally ='Omani';

SELECT *
FROM airport
ORDER BY Country;



