## Import all the required packages

from snowflake.snowpark import Session
import sys
import logging
import pandas as pd
import numpy as np
import snowflake.connector


## Set the file location and  file name

csv_file_folder = "{Your file location}"
table_name = "{your file name}"

## Read the csv file
df = pd.read_csv(csv_file_folder)
df.head()


## Basic data cleaning
df.replace({np.nan:None}, inplace=True)
df.head()

## Create a connection string to connect to your Snowflake account
conn = snowflake.connector.connect(
    account= "{your account id}",
    user= "{usedname}",
    password= "{password}",
    schema= "PUBLIC",
)


## Connect to Snowflake and load the data
cur=conn.cursor()

batch_size = 5000

for i in range(0, len(df), batch_size):
    batch_df = df.iloc[i:i+batch_size]
    
    placeholders = ', '.join(['%s'] * len(batch_df.columns))

    insert_query = f"INSERT INTO {table_name} VALUES ({placeholders})"

    data_tuples = [tuple(row) for row in batch_df.itertuples(index=False, name=None)]

    cur.executemany(insert_query, data_tuples)

    conn.commit()

## Close the connection to Snowflake
cur.close()
conn.close()

