USE Airline
SELECT F.Flight_ID,A.NAME AS Airport_Name
FROM Flight AS F
JOIN Airport AS A
ON F.Airport_code =A.Airport_code;


SELECT 
		B.Booking_ID, 
		P.Full_Name,
		F.Flight_ID
FROM    Booking AS B
JOIN	Passenger AS P
ON		B.National_ID = P.National_ID
JOIN	Flight AS F
ON		B.Flight_ID =F.Flight_ID;


SELECT FC.Full_Name,
		FC.Role
FROM  Flight_Crew AS F
JOIN Crew_member AS FC 
ON	FC.Crew_ID=F.Crew_ID
WHERE FC.Flight_ID='SK101';



SELECT F.Flight_ID,F.Status ,F.Registration_num ,A.Model
FROM Flight AS F
JOIN aircraft AS A
ON F.Registration_num =A.Registration_num
WHERE F.Status='Completed';

