# Skyscanner Data Analytics Migration Tableau

Assuming the role of a Data Analyst at Skyscanner, I worked on this project to migrate existing data analytics tasks from an Excel-based manual system into interactive Tableau reports. 

## Tools and Dependencies

Python, PostgreSQL, Tableau

## Project Overview

In brief, I extracted data from 10 different excel workbooks, contain flights data of 10 different years. I cleaned this combined 7.9+ GB of data, transformed them into one single pandas dataframe, and created a unified clean workable dataset. Then I loaded this dataset into a PostgreSQL server. Finally using Tableau, I connected to the database and created informative reports.

## Migration Process

1. Click [here](https://data-analytics-migration-to-tableau.s3.eu-west-1.amazonaws.com/) to download the CSV files from Amazon AWS. There are 10 excel files, containing flight data from 1987 to 1996. 

2. Unzip the files into a folder. 

3. To extract the data from all the csv files simultaneously, clean, and transform them into one single dataframe, data-extraction-transformation.py should be run. 

4. Before running the file the directory in line 6 and line 13 should be changed to where exactly the files are saved. 

5. Then the data-extraction-transformation.py file in the VS code bash terminal can be run. 

6. This file will import necessary packages, load all the files, drop empty columns, replace null values and wrong input, concat into one single pandas dataframe, perfrom necessary data type conversions, and finally load them into one single workable csv file. 

7. Now the data is ready for migration into PostgreSQL database. 

8. Create a new database 'flights' using psql command line. 

9. Then run the loading-into-psql-database.sql. Remember to change the file directory in line 25. This file creates a flights table in the database and populate it with the combined data csv file we created earlier. 

10. Now, we can run query.sql file to query the relational database. It answers the questions such as- Which year had the most number of total inbound and outbound flights? Which country is the most popular destination for flights? Which flight numbers were most frequently used?

11. At this point, we can open Tableau Desktop, connect to PostgreSQL server, and specify the database. This will migrate the fligths data from PostgreSQL to Tableau. Then we can create the visualisations as required. 

12. For ease of visualisation, I have included the twb file dashboards.twbx where there is no need to do the previous steps. I have created the visualisations with extracted data here. 




