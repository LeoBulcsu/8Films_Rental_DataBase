![image](https://github.com/LeoBulcsu/8Films_Rental_DataBase/assets/136447924/a917c7fd-d260-4fa7-9a9f-4bdefdd10312)


# 8Films Rental DataBase.

I have a friend who has an amazing idea for a video rental store and he asked for some help creating the database. I wasn't interested in it at first, but he went all out and said: "8Films is not a video club, 8Films is an experience that brings you back to those 00's Friday Night hype". I couldn't say no to that so I asked him to send me everything he had to create the database.

He sent a total of 7 .csv files with info regarding the inventory, the rental invoices he had in the past, a film list, an actors list, a categories list, a language list and an old HDD drive he had which contains some info about actors and films. 

And with that, I was left all by myself to do some magic.

## First steps: 

I started loading the data my friend gave me into Visual Studio to explore each table and get some insights about what I could do with it. You can find the results of my investigation in the Notebooks folder in this repo. 

We have a total of 7 data frames that correspond to: ACTORS, CATEGORY, MOVIE, INVENTORY, LANGUAGE, RENTAL AND ONE OLD one with info relevant to the people acting in the film, the title of the film, when it was released and the category.

To create the database for the movie rental company I would like to play a bit with the data frames to be able to make more interesting relationships later.

In particular, I would be interested in:

Film: improve the language-relevant columns. Currently, the original language column has no values and the rental language is English for all. It would be interesting to introduce values relevant to the languages in which you can watch the movie. Nowadays and with the DVD format you can choose the type of language.

I would also like to be able to create new tables with the relationship between the movies, their category, their actors and languages so I can create their proper relations in SQL.

Rental: This is an important table and from a business point of view it should be fundamental. I would be interested in being able to offer the possibility to compare the rental day, the estimated delivery date, the actual delivery date and therefore if it was delivered late. The idea is to be able to then offer real data to the company about the customers, to know if they are reliable or not in the rentals and therefore reward those who are.

Inventory: I would like to add the number of movies in stock to this table. Currently, we have data on the store where it is located, but in addition to that it would be interesting to know how many copies of each movie there are in each store, to assure the customer who calls to ask availability, that it exists.

Old_HDD: I would like to add the actor_ID to each of the rows of information to facilitate the relationships between the different tables. This way we could create a relationship between movies and actors, many people want to see movies of certain actors only. It would do the same with the categories of those movies. The new HD would be the connection between tables to do many-to-many relationships in SQL.

NEW TABLES: I think that, in the future, it could be interesting to create two new tables that could be very useful to manage '8Films'.

Customer: Basic to be able to have control of our customers.
We need:     - Customer_ID: identifier number.     - First_Name: First name.     - Last_Name: Last name.     - Address: Address.     - Joined_Date: member date.     - Cancelled_Date: member cancellation date.     - Credits: this video club will work with credits. 1 credit = 1 movie. In this section, you enter the credits that customers have.

Store: We need some info about the stores we have. In principle, we only have 2, but we need to catalogue them to know where the movies are and where to go to look for them in case someone calls us to ask for availability.

After doing my cleaning and exporting the new .csv files into the CLEAN folder (you will find it inside the DATA folder of this repo) It was time to create the database.

## Importing clean data into SQL and creating relations:

Once my data was all clean and organised it was time to create the database. I used MySQL Workbench and you can see the queries related to the creation of the relations in the SQL folder in this repo.

Inside you will find two files, one with the ER Diagram query, where you can check the process done to create the database, importing the data from the .csv files and creating the actual database relations and another one with some queries that I believe any client or even my friend may have.


