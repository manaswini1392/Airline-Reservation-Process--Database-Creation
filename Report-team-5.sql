/* --After passenger confirm the flight and make payment for tavel,an Itinerary will be generaterated which passenger will take print out 
and travel.This itinerary will capture the details of passengers(Name,Departure City,Arrival City,Departure date/time,Flight Id
Booking Id and booking status based on Booking ID. Only those passengers who have a confirmed (CNF) status will be able to get itinerary.
Status is 'Failed' for those passengers whose payment was not received */

/* Sample input for Booking_ID substitution variable - 111, 113, 114, 115, 116, 117, 118 */

SELECT p.last_name,p.first_name,f.DEPARTURE_CITY, f.ARRIVAL_CITY,s.DEPARTURE_DATETIME,s.FLIGHT_ID,b.booking_id,b.status
FROM passenger p JOIN booking b
ON p.passenger_id= b.passenger_id
JOIN schedule s
ON b.schedule_id= s.schedule_id
JOIN flights f
ON s.flight_id = f.flight_id
WHERE b.booking_id=&Booking_ID
AND b.status = 'CNF';


/* --Airline wants to launch a frequent flier program. In order to do this Airline wants to know which passengers travel frequently 
by the airline. Airline wants to input the number of previous months they want to consider starting from current date and the query should 
output the passenger_ids along with the number of trips each passenger has made in the specified duration, in decreasing order of frequency . 
No Future trips will be taken into consideration. Also only confirmed bookings will be taken into consideration */

/* Sample input for Prev_travel_record_in_months is 4 or 5 */

SELECT a.passenger_id,COUNT(b.booking_id) as "Frequency_of_Travel"
FROM passenger a JOIN booking b 
ON a.passenger_id=b.passenger_id
JOIN schedule c
ON b.schedule_id=c.schedule_id
WHERE c.DEPARTURE_DATETIME BETWEEN add_months(current_date,-&Prev_travel_record_in_months) and current_date
AND b.status = 'CNF'
GROUP BY a.passenger_id
ORDER BY 2 DESC;

/*-- When the passenger logins the online website,our database will fetch the available Flight scheduled details 
based on passenger travel requirements of Departure City,Arrival City, Travel date and Number of Passengers*/

/* Sample input for departure_city is 'Hartford' , 
Sample input for arrival_city is 'Denver' , 
Sample input for TravelDate_DD_MON_YY is '27-AUG-16'
Sample input for Number_of_Passengers is 4 */

SELECT *
FROM schedule 
WHERE flight_id IN
                (SELECT flight_id from flights where LOWER(departure_city)=LOWER('&From_City') AND LOWER(arrival_city)=LOWER('&To_City'))
AND LOWER(TO_CHAR(departure_datetime,'DD-MON-YY'))=LOWER('&TravelDate_DD_MON_YY')
AND seats_available >= &Number_of_Passengers;
