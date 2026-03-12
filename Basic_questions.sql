CREATE DATABASE Laptop_market_sales;

GO
USE Laptop_market_sales;

-- ======================================================
-- SQL PROJECT QUESTIONS
-- Dataset: PC Sales
-- ======================================================

-- BASIC QUESTIONS
select 
* from [Laptop_market_sales].[dbo].[Laptop_data]

-- 1. Count the total number of sales records.
			SELECT COUNT(*)
			AS TOTAL_NUMBER_OF_SALES		
			FROM [Laptop_market_sales].[dbo].[Laptop_data]

-- 2. Count the number of sales per Continent.
										select Continent, COUNT(*) AS Number_of_Sales
										from [Laptop_market_sales].[dbo].[Laptop_data]
											group by Continent
	
-- 3. Count the number of sales per Country or State.
				select Country_or_State, count(*)
				as Sale_per_country_or_state
				from [Laptop_market_sales].[dbo].[Laptop_data]
				group by  Country_or_State

-- 4. List all distinct Shop Name values.
							Select Distinct Shop_name
							as Distict_Shop
							from [Laptop_market_sales].[dbo].[Laptop_data]

-- 5. Find the average Sale Price.
						Select avg(Sale_Price)
						as average_Sale_Price
						From [Laptop_market_sales].[dbo].[Laptop_data]
						

-- 6. Find the highest and lowest Sale Price.
		SELECT MAX(Sale_Price)
		AS Highest_Sale_Price,MIN(Sale_Price) AS Lowest_Sale_Price
		FROM [Laptop_market_sales].[dbo].[Laptop_data]


		------LONG METHODE
							SELECT Top 1 Sale_Price
							AS Highest_Sale_Price
							from  [Laptop_market_sales].[dbo].[Laptop_data]
							Group by Sale_Price
							order by Sale_Price desc
		-------you can also use this method to find the lowest price just change the order by to asc


-- 7. Count the number of sales by Payment Method.
				Select  Payment_method, count(*)
				as Number_of_Sales_by_Payment_Method
				from [Laptop_market_sales].[dbo].[Laptop_data]
				group by Payment_method
-- 8. Count the number of sales by Channel (Online vs Offline).
											select Channel, count(*)
											as Number_of_Sales_by_Channel
											from [Laptop_market_sales].[dbo].[Laptop_data]
											group by Channel


-- 9. Count the number of sales by Priority level.
			select Priority, count(*)
			as Number_of_Sales_by_Priority
			from [Laptop_market_sales].[dbo].[Laptop_data]
			group by Priority

-- 10. Count the number of distinct PC Make values.
									select count(distinct PC_Make)
									as Number_of_Distinct_PC_Makes
									from [Laptop_market_sales].[dbo].[Laptop_data]





