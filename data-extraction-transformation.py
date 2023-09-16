import pandas as pd
import os

# load the CSV datafiles into Pandas dataframes
# list dirs
csvs = [x for x in os.listdir("G:\\project_dir\\migration-to-tablueau\\data-analytics-files\\")]
# give file names
fnames = ["df_"+os.path.splitext(os.path.basename(csv))[0] for csv in csvs]
# make a df_dict
df_dict = {}
# load each file from the directory as df into the values for each corresponding fname keys
for i in range(len(fnames)):
    df_dict[fnames[i]] = pd.read_csv("G:\\project_dir\\migration-to-tablueau\\data-analytics-files\\" + csvs[i])

# dropping ampty columns and putting the dataframes into a list
df_ls = []
removal_cols = ['TailNum', 'AirTime', 'TaxiIn', 'TaxiOut', 'CancellationCode',
       'CarrierDelay', 'WeatherDelay', 'NASDelay', 'SecurityDelay',
       'LateAircraftDelay']
for key in df_dict.keys():
    df_dict[key] = df_dict[key].drop(removal_cols, axis=1)
for key in df_dict.keys():    
    df_dict[key] = df_dict[key].fillna(int(0))
for key in df_dict.keys():
    df_ls.append(df_dict[key])

# integrate all of the dataframes together into one master dataframe.
master_df = pd.concat(df_ls, ignore_index=True)

# converting datatypes of the master_df for size reduction
master_df['Year'] = master_df['Year'].astype('int16')
master_df['Month'] = master_df['Month'].astype('int8')
master_df['DayofMonth'] = master_df['DayofMonth'].astype('int8')
master_df['DayOfWeek'] = master_df['DayOfWeek'].astype('int8')
master_df['DepTime'] = pd.to_datetime(master_df['DepTime'], format='%H%M', errors='coerce')
master_df['DepTime'] = master_df['DepTime'].dt.time
master_df['CRSDepTime'] = pd.to_datetime(master_df['CRSDepTime'], format='%H%M', errors='coerce')
master_df['CRSDepTime'] = master_df['CRSDepTime'].dt.time
master_df['ArrTime'] = pd.to_datetime(master_df['ArrTime'], format='%H%M', errors='coerce')
master_df['ArrTime'] = master_df['ArrTime'].dt.time
master_df['CRSArrTime'] = pd.to_datetime(master_df['CRSArrTime'], format='%H%M', errors='coerce')
master_df['CRSArrTime'] = master_df['CRSArrTime'].dt.time
master_df['FlightNum'] = master_df['FlightNum'].astype('int16')
master_df['ActualElapsedTime'] = master_df['ActualElapsedTime'].astype('int16')
master_df['CRSElapsedTime'] = master_df['CRSElapsedTime'].astype('int16')
master_df['ArrDelay'] = master_df['ArrDelay'].astype('int16')
master_df['DepDelay'] = master_df['DepDelay'].astype('int16')
master_df['Origin'] = master_df['Origin'].astype('category')
master_df['Dest'] = master_df['Dest'].astype('category')
master_df['Distance'] = master_df['Distance'].astype('float32')
master_df['Cancelled'] = master_df['Cancelled'].astype('int8')
master_df['Diverted'] = master_df['Diverted'].astype('int8')
master_df['UniqueCarrier'] = master_df['UniqueCarrier'].astype('category')
# changing worng inputs in UniqueCarrier column
master_df['UniqueCarrier'].replace("PA (1)", "PA", inplace=True)
master_df['UniqueCarrier'].replace("ML (1)", "ML", inplace=True)

# export the final master dataframe into one file called combined_data.csv
master_df.to_csv("flights_final.csv", index=False)