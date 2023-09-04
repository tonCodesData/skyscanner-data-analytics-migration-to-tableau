DROP TABLE flights;

CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    "Year" INT,
    "Month" INT,
    "DayofMonth" INT,
    "DayOfWeek" INT,
    "DepTime" FLOAT,
    "CRSDepTime" INT,
    "ArrTime" FLOAT,
    "CRSArrTime" INT,
    "UniqueCarrier" VARCHAR(255),
    "FlightNum" INT,
    "ActualElapsedTime" FLOAT,
    "CRSElapsedTime" INT,
    "ArrDelay" FLOAT,
    "DepDelay" FLOAT,
    "Origin" VARCHAR(255),
    "Dest" VARCHAR(255),
    "Distance" FLOAT,
    "Cancelled" INT,
    "Diverted" INT
);

ALTER TABLE flights
ALTER COLUMN DayOfWeek TYPE numeric; -- or real or double precision, depending on your needs


COPY flights(CRSDepTime)
FROM 'G:\\project_dir\\changed_flights.csv' WITH DELIMITER ',' CSV;

UPDATE flights
SET CRSDepTime = ROUND(crsdeptime);

ALTER TABLE flights
ALTER COLUMN CRSDepTime TYPE numeric; -- or real or double precision, depending on your needs

ALTER TABLE flights
ALTER COLUMN crsarrtime TYPE integer;



COPY flights FROM '1987_flights.csv' WITH DELIMITER ',' CSV HEADER;

