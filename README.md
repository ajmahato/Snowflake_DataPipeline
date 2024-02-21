# Snowflake_DataPipeline

## Overview

This document provides an overview of the ETL (Extract, Transform, Load) process implemented using Snowflake, a cloud-based data warehousing platform. The process involves loading data from a CSV file into a Snowflake table, cleaning the data using SQL queries, creating new tables in a separate database for cleaned data, and building a data model for analytics.

![MicrosoftTeams-image (1)](https://github.com/ajmahato/Snowflake_DataPipeline/assets/37789394/43256cae-910e-426e-84ca-933a33790803)


## Prerequisites

- Snowflake account and necessary credentials.
- Python installed on your machine.

## Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/ajmahato/Snowflake_DataPipeline.git
   cd Snowflake_DataPipeline

2. **Create snowflake setup**
   Use the Initial_DB.sql file in Initial_DB folder to setup the snowflake by creating the database and the required tables.

3. **Load data to the tables**
   Load the data to the tables from the csv file.

4. **Usage**
   Use the ETL_with_Python.py Python script to load data from a CSV file into a Snowflake table. Update the script with your Snowflake credentials and CSV file path.

5. **Create final DB**
   Execute the Final_DB.sql file to create the final database and the required tables.

6. **Clean data and move it to new database**
  Execute Data_Cleaning.sql file available in final_DB folder to clean the data in Snowflake. Modify the clean_data.sql file as needed for your cleaning requirements.

7. **Create data model**
  Execute the Final_combined_table.sql file to create the data model where we join all the tables for faster queries.

