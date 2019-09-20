-- this sql query is to figure out at what time the temperature is above a 100 degrees Farenheight for each station where the temparature reaches such extremes.
-- It outputs the data by ordering it by station number, then month and date, so we can see at what time of the year the temperature peaks
-- We believe in the future we can use this data to see correlation of hot temperature on nutrition on the correlating countries 

select stn, mo, da, temp
from NOAA_weather.gsod2016
where temp > 100
order by stn, mo, da;

-- We will use the same SQL query for gsod2016, gsod2017, and gsod2018 because we are trying to track the change of temperature over time and if needed, we will create a new dataset with our adjusted information. 



-- This SQL query orders the database by the usaf (i.e. station number) and took out all the rows where we got no useful information from the station. 

select usaf, country
from NOAA_weather.stations
where country != 'null'
order by usaf


-- This SQL query filters in only the years we are targeting (2016-2018) and then orders them by country name, so that we might be able to visually identify any patterns. We might further distinguish the dataset by indicator_name as there seems to be multiple categories of data for each country.

select country_name, indicator_name, year
from TheWorldBank_nutrition.health_nutrition_population
where year > 2015 and year < 2019
order by country_name;
