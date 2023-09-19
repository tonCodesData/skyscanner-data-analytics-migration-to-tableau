-- Which year had the most number of total inbound and outbound flights? Which country is the most popular destination for flights?

SELECT "Year", COUNT("Year") 
FROM flights
GROUP BY 1
ORDER BY 2 DESC;

SELECT "Dest", COUNT("Dest") 
FROM flights
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- most used flight numbers
SELECT "FlightNum", COUNT("FlightNum") 
FROM flights
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;