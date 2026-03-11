# Tech Trends SQL Analysis
This project analyzes programming language trends using the Stack Overflow Developer Survey dataset.

## Tools Used
* Python (Pandas)
* PostgreSQL
* SQL

## Project Workflow
1. Clean dataset using Python
2. Load cleaned data into PostgreSQL
3. Perform SQL analysis using advanced queries

## SQL Concepts Used
* GROUP BY
* Window Functions
* RANK()
* DENSE_RANK()
* PARTITION BY

## Example Query
SELECT language, COUNT(*) AS developers
FROM developer_survey
GROUP BY language
ORDER BY developers DESC
LIMIT 10;

## Project Structure
clean_data.py → Python script for cleaning dataset
analysis_queries.sql → SQL analysis queries
cleaned_survey.csv → processed dataset
--------------------------------------
Dataset too large for GitHub.
Download from: https://survey.stackoverflow.co/

