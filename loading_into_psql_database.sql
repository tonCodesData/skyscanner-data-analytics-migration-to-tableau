-- Creating flights table
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

-- loading data into the table
COPY flights FROM 'G:\project_dir\migration-to-tablueau\data-analytics-migration-to-tableau\flights_final.csv' WITH DELIMITER ',' CSV HEADER;


