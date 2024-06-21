# Airbnb_NewYork_City_SQL_PowerBI
This reports provide an in-depth analysis of Airbnb listings in New York City and to uncover key insights.

## Data Used

**Data** - [New York City Airbnb ](https://www.kaggle.com/datasets/dgomonov/new-york-city-airbnb-open-data) 
        This dataset includes 48k+ rows and 16 Columns.

**Data Cleaning** - MySQL.

**Data Visualization** - PowerBI.

## Questions

1. What are the different areas and hosts?
2. What is the distribution of rooms?
3. Which host are the busiest host?
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

## Data Analysis

1. The different Hosts and Areas.

   ![Screenshot 2024-06-21 201505](https://github.com/SamuelVincent67/Airbnb_NewYork_City_SQL_PowerBI/assets/123567789/b98748cc-fe27-4d7e-9b0f-8f15862e6715)
   The host with the most listings is Micheal, with a count of 418 listings and average reviews of 26.52.
     
   ![Screenshot 2024-06-21 201810](https://github.com/SamuelVincent67/Airbnb_NewYork_City_SQL_PowerBI/assets/123567789/f6403a89-1fb1-4166-b57d-e625fdf59e57)
   The neighbourhood group Brooklyn in Williamsburg has the highest listing count of about 3919, with an average price of $143.8.
     
2. Distribution of the Rooms.

   ![Screenshot 2024-06-21 201951](https://github.com/SamuelVincent67/Airbnb_NewYork_City_SQL_PowerBI/assets/123567789/9861f14a-1d83-431b-a48c-0ba35c29050d)
   Majority of the tourist prefer "entire home/apt" (about 25400). Followed by the "private room" (about 22314). People are less likely to book a "shared room". This information can help us understand the distribution of different types available for rent.

3. The busiest host.

   ![Screenshot 2024-06-21 202140](https://github.com/SamuelVincent67/Airbnb_NewYork_City_SQL_PowerBI/assets/123567789/b0c3247e-966c-4c38-be87-23a34cf5f973)
   The busiest host is "Nalicia", with an average monthly review of about 18.12, which means it's quite popular in the area. Followed by "Dona" with average 13.9 average monthly reviews.

4. Difference of traffic among different areas.

   ![Screenshot 2024-06-21 202522](https://github.com/SamuelVincent67/Airbnb_NewYork_City_SQL_PowerBI/assets/123567789/f1f73998-5e3d-4dce-b67c-c5bdd47bc93e)
   The neighbourhood with the highest traffic is "East Elmhurst", with an average of 4.56 monthly reviews.

## Dashboard

   ![Screenshot 2024-06-21 203413](https://github.com/SamuelVincent67/Airbnb_NewYork_City_SQL_PowerBI/assets/123567789/e409fd08-5960-4b7c-939c-3bd444a4fbe4)


















