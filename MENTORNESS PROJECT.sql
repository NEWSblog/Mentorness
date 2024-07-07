Create database mentorness















select *
from dbo.hotelreservation

--1. What is the total number of reservations in the dataset?
select COUNT (*) [Total No Of Resevation]
from dbo.hotelreservation


--2. Which meal plan is the most popular among guests?
SELECT type_of_meal_plan, COUNT(*) AS [Number Of Reservations]
FROM dbo.hotelreservation
GROUP BY type_of_meal_plan;


--3. What is the average price per room for reservations involving children?
select AVG(AVG_PRICE_PER_ROOM) AvgChildren
from dbo.hotelreservation
WHERE NO_OF_CHILDREN >= 1
--4. How many reservations were made for the year 20XX (replace XX with the desired year)?
SELECT COUNT(*) AS ReservationIn2018
FROM dbo.hotelreservation
WHERE YEAR(arrival_date) = 2018;

--5. What is the most commonly booked room type?
select MAX(room_type_reserved) MostBookRoom
from dbo.hotelreservation
-- OR
SELECT TOP 1 room_type_reserved AS MostBookRoom, COUNT(*) AS NoOfBooking
FROM dbo.hotelreservation
GROUP BY room_type_reserved
ORDER BY COUNT(*) DESC;


--6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(*) NoOfWeekend
FROM dbo.hotelreservation
WHERE datename(weekday, arrival_date) IN ('Saturday', 'Sunday');

SELECT COUNT(*) NoOfWeekend
FROM dbo.hotelreservation
WHERE no_of_weekend_nights > 0;


--7. What is the highest and lowest lead time for reservations?
-- the maximum lead time 
SELECT MAX(lead_time) AS HgLeadTime,
	   MIN(lead_time) AS LstLeadTime
FROM dbo.hotelreservation;


--8. What is the most common market segment type for reservations?
SELECT TOP 1 market_segment_type AS MostMktSeg, COUNT(*) NoOfReservation
FROM dbo.hotelreservation
GROUP BY market_segment_type
ORDER BY COUNT(*) DESC;

--9. How many reservations have a booking status of "Confirmed"?
select count(*) ConfirmedBking
from dbo.hotelreservation
where booking_status = 'Not_Canceled'

--10. What is the total number of adults and children across all reservations?
select SUM(no_of_children)TotalChildren , SUM(no_of_adults) TotalAdult
from dbo.hotelreservation
--11. What is the average number of weekend nights for reservations involving children?
select count (*) ChildrenWkdReserve
from dbo.hotelreservation
where no_of_weekend_nights > 0 and no_of_children >0

--12. How many reservations were made in each month of the year?
select DATENAME(month,arrival_date) Months, YEAR(arrival_date) Years,count(*) Reservations
from dbo.hotelreservation
group by DATENAME(month,arrival_date), YEAR(arrival_date)
--13. What is the average number of nights (both weekend and weekday) spent by guests for each room
--type?
select room_type_reserved, avg(no_of_weekend_nights)AvgWkdNgt, AVG(no_of_week_nights)AvgWkNgt
from dbo.HotelReservation
group by room_type_reserved
--14. For reservations involving children, what is the most common room type, and what is the average
--price for that room type?

WITH RoomTypeStats AS (
    SELECT 
        room_type_reserved, 
        COUNT(*) AS reservation_count, 
        AVG(avg_price_per_room) AS average_price
    FROM dbo.hotelreservation
    WHERE no_of_children > 0
    GROUP BY room_type_reserved
)
SELECT 
    room_type_reserved, 
    reservation_count, 
    average_price
FROM RoomTypeStats
ORDER BY reservation_count DESC





--15. Find the market segment type that generates the highest average price per room
SELECT TOP 1 market_segment_type,SUM(avg_price_per_room) TotalAvgPricePerRoom
FROM dbo.hotelreservation
GROUP BY market_segment_type
ORDER BY SUM(avg_price_per_room) DESC;




select SUM(no_of_week_nights)
from dbo.hotelreservation
where room_type_reserved = 'room_type 1'

select SUM(no_of_weekend_nights)
from dbo.hotelreservation
where room_type_reserved = 'room_type 1'

select*
from dbo.hotelreservation
where room_type_reserved = 'room_type 1'