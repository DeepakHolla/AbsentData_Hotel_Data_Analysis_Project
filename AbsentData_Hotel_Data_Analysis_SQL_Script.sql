/* This creates a CTE for the combined hotel data over the years that can be queried like a table 
	This query needs to be run along with the second SELECT query statement
	Both queries need to be copied and entered (without the comments) in the Advanced options section while connecting 
	to Power BI using the "Get Data --> SQL Server" option
*/

WITH HotelData AS (
SELECT * FROM dbo.[2018]
UNION
SELECT * FROM dbo.[2019]
UNION
SELECT * FROM dbo.[2020])

/* This query joins the HotelData View with the Market Segment and the Meal Cost tables */

SELECT *
FROM HotelData
LEFT JOIN dbo.market_segment
ON HotelData.market_segment = market_segment.market_segment 
LEFT JOIN dbo.meal_cost
ON HotelData.meal = meal_cost.meal
