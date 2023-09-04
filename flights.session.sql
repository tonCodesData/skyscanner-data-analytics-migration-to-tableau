DROP TABLE flights;

CREATE TABLE flights (
    "Year" INT,
    "Month" INT,
    "DayofMonth" INT,
    "DayOfWeek" INT,
    "DepTime" TIME,
    "CRSDepTime" TIME,
    "ArrTime" TIME,
    "CRSArrTime" TIME,
    "UniqueCarrier" VARCHAR(255),
    "FlightNum" INT,
    "ActualElapsedTime" INT,
    "CRSElapsedTime" INT,
    "ArrDelay" INT,
    "DepDelay" INT,
    "Origin" VARCHAR(255),
    "Dest" VARCHAR(255),
    "Distance" FLOAT,
    "Cancelled" INT,
    "Diverted" INT
);


COPY flights FROM 'G:\project_dir\migration-to-tablueau\data-analytics-migration-to-tableau\flights_final.csv' WITH DELIMITER ',' CSV HEADER;

SELECT * FROM flights LIMIT 100;

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

