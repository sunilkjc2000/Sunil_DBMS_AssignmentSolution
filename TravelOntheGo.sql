drop database if exists `TravelOnTheGo`;
create database TravelOnTheGo;
use TravelOnTheGo;
Drop table if exists `PASSENGER`;
Create table PASSENGER
             (Passenger_name varchar(50),
			  Category varchar(50),
              Gender varchar(50),
              Boarding_City varchar(50),
			 Destination_City varchar(50),
			 Distance int,
			 Bus_Type varchar(50));
             
Drop table if exists `PRICE`;
Create table PRICE
             (
              Bus_Type varchar(50),
              Distance int,
              Price    int);

insert into PASSENGER values("Sejal","AC","F","Bengaluru","Chennai",350,"Sleeper");
insert into PASSENGER values("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting");
insert into PASSENGER values("Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper");
insert into PASSENGER values("Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper");
insert into PASSENGER values("Udit","Non-AC","M","Trivandrum","panaji",1000,"Sleeper");
insert into PASSENGER values("Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting");
insert into PASSENGER values("Hemant","Non-AC","M","panaji","Mumbai",700,"Sleeper");
insert into PASSENGER values("Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting");
insert into PASSENGER values("Piyush","AC","M","Pune","Nagpur",700,"Sitting");

insert into PRICE values("Sleeper",350,770);
insert into PRICE values("Sleeper",500,1100);
insert into PRICE values("Sleeper",600,1320);
insert into PRICE values("Sleeper",700,1540);
insert into PRICE values("Sleeper",1000,2200);
insert into PRICE values("Sleeper",1200,2640);
insert into PRICE values("Sleeper",1500,2700);
insert into PRICE values("Sitting",500,620);
insert into PRICE values("Sitting",600,744);
insert into PRICE values("Sitting",700,868);
insert into PRICE values("Sitting",1000,1240);
insert into PRICE values("Sitting",1200,1488);
insert into PRICE values("Sitting",1500,1860);

--  How many females and how many male passengers travelled for a minimum distance of 
-- 600 KM s?
select count(*) AS "Number of Females" from PASSENGER where Distance >= 600 && Gender="F";

-- Find the minimum ticket price for Sleeper Bus. 
select count(*) AS "Number of males" from PASSENGER where Distance >= 600 && Gender="M";

-- Select passenger names whose names start with character 'S' 
select min(Price) AS "Minimum ticket price" from PRICE;

-- Calculate price charged for each passenger displaying Passenger name, Boarding City, 
-- Destination City, Bus_Type, Price in the output
select * from PASSENGER where Passenger_name like "s%";

-- Calculate price charged for each passenger displaying Passenger name, Boarding City, 
-- Destination City, Bus_Type, Price in the output
Select Passenger_name,Boarding_City, Destination_City,Price 
    from PASSENGER inner join PRICE 
    ON PASSENGER.Distance = PRICE.Distance && PASSENGER.Bus_Type = PRICE.Bus_Type;

-- What are the passenger name/s and his/her ticket price who travelled in the Sitting bus 
-- for a distance of 1000 KM s
Select Passenger_name,Price 
    from PASSENGER inner join PRICE
	ON PASSENGER.Distance = 1000 
    and PASSENGER.Bus_Type = "Sitting";

-- What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
Select distinct p1.Passenger_name, p1.Boarding_city 
    as Destination_city, p1.Destination_city 
	as Boardng_city, p1.Bus_type, p2.Price 
    FROM passenger p1, price p2 WHERE Passenger_name = 'Pallavi' and p1.Distance = p2.Distance;

-- List the distances from the "Passenger" table which are unique (non-repeated 
-- distances) in descending order
Select distinct distance FROM passenger ORDER BY Distance desc;

-- Display the passenger name and percentage of distance travelled by that passenger 
-- from the total distance travelled by all passengers without using user variables
select Passenger_name, Distance * 100.0/ (select SUM(Distance) from passenger)from passenger GROUP BY Distance;

-- Display the distance, price in three categories in table Price
-- a) Expensive if the cost is more than 1000
-- b) Average Cost if the cost is less than 1000 and greater than 500
-- c) Cheap otherwise
-- Sample output for 11th question
SELECT Distance, Price,
CASE
    WHEN Price >= 1000 THEN 'Expensice'
    WHEN Price >= 500 and Price < 1000 THEN 'Average'
    ELSE 'Cheap'
END AS RangeCheck
FROM PRICE;
