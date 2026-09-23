USE Airline
UPDATE Flight
SET Status ='Completed'

UPDATE Flight
SET Status ='Cancelled'


UPDATE Booking
SET Price = Price * .10
WHERE Class = 'Economy';

UPDATE Passenger
SET Phone = '99887766'
WHERE National_ID='P001';

UPDATE Crew_member
SET Role ='Co-Pilot'

-----------------------------------


SELECT *
FROM Flight 
WHERE Flight_ID= 'F001'
AND Status='Cancelled';

DELETE FROM Flight
WHERE Flight_ID= 'F001'
AND Status='Cancelled';


SELECT B.Booking_ID,B.Flight_ID,F.Status
FROM Booking B
JOIN Flight F
ON B.Flight_ID=F.Flight_ID
WHERE B.Booking_ID = 'B002'
AND F.Status= 'Cancelled';

SELECT *
FROM Booking 
WHERE National_ID ='P001';

DELETE FROM Passenger
WHERE National_ID ='P001';











