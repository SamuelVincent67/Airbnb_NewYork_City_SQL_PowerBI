# Airbnb_NewYork_City_SQL_PowerBI
This reports provide an in-depth analysis of Airbnb listings in New York City and to uncover key insights.

## Data Used

**Data** - [New York City Airbnb ](https://www.kaggle.com/datasets/dgomonov/new-york-city-airbnb-open-data) 
        This dataset includes 48k+ rows and 16 Columns.

**Data Cleaning** - MySQL.

**Data Visualization** - PowerBI.

## Questions

1. Which hosts are the busiest host?
2. What is different in host and areas?
3. What is the distribution of rooms?
4. What is the difference of traffic among different areas?

## Data Import 

The Dataset is downloaded as CSV format and imported in MySQL. 
  
- Creating Schema and connect to database and create tables(s) in it.
- And creating columns.
- Load the data by using LOAD DATA Statement
  
  ![Screenshot 2024-06-21 181134](https://github.com/SamuelVincent67/Airbnb_NewYork_City_SQL_PowerBI/assets/123567789/0aff6b3d-52b9-482a-9cbd-b1547debbd47)
  ![Screenshot 2024-06-21 181549](https://github.com/SamuelVincent67/Airbnb_NewYork_City_SQL_PowerBI/assets/123567789/3b9fae0e-1e75-4a8a-82f8-cc52fe7d1a3e)

## Data Cleaning

Data Cleaning is extremely important in Data Analysis.

- Removing Duplicates

  ![Screenshot 2024-06-21 182355](https://github.com/SamuelVincent67/Airbnb_NewYork_City_SQL_PowerBI/assets/123567789/1f3d7082-fddb-4105-8095-fb6fb7b8c483)

- Deleting host_name with null values

  ![image](https://github.com/SamuelVincent67/Airbnb_NewYork_City_SQL_PowerBI/assets/123567789/d1dd8410-8cd3-4c8f-b049-4066aaab908b)

- Impute 'last_review' with a date

  ![image](https://github.com/SamuelVincent67/Airbnb_NewYork_City_SQL_PowerBI/assets/123567789/f660f2e4-79d7-4bd9-8a93-338598db0181)

- Calculate the mean of 'reviews_per_month' and create temporary table to store it.

  ![Screenshot 2024-06-21 184014](https://github.com/SamuelVincent67/Airbnb_NewYork_City_SQL_PowerBI/assets/123567789/2f6a29e5-e795-4d6a-82a6-cdffb6152185)

- Create flag columns for 'last_review' and 'review_per_month'and update it based on imputed values

  ![Screenshot 2024-06-21 184229](https://github.com/SamuelVincent67/Airbnb_NewYork_City_SQL_PowerBI/assets/123567789/16607ce2-893c-42ff-be9e-7716dba4e1dc)

  ![Screenshot 2024-06-21 184629](https://github.com/SamuelVincent67/Airbnb_NewYork_City_SQL_PowerBI/assets/123567789/b64b4fab-0ad2-451f-920f-c8c1ca63aa97)









