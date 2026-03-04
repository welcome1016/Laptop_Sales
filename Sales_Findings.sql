CREATE DATABASE Laptop_market_sales;

GO
USE Laptop_market_sales;

-- ======================================================
-- SQL PROJECT QUESTIONS
-- Dataset: PC Sales
-- ======================================================

-- BASIC QUESTIONS

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

-- INTERMEDIATE QUESTIONS

-- 11. Calculate total revenue (SUM of Sale Price).
-- 12. Calculate total profit (SUM of Sale Price - Cost Price).
-- 13. Find the average Discount Amount.
-- 14. Calculate total Finance Amount issued.
-- 15. Find total revenue per PC Make.
-- 16. Find average Sale Price per Storage Type.
-- 17. Calculate total revenue per Shop Name.
-- 18. Calculate total revenue per Sales Person Name.
-- 19. Find average Credit Score per Payment Method.
-- 20. Calculate total Cost of Repairs per Sales Person Department.

-- ADVANCED QUESTIONS

-- 21. Calculate profit per Shop Name.
-- 22. Calculate profit margin per sale ((Sale Price - Cost Price) / Sale Price).
-- 23. Determine which Continent has the highest total revenue.
-- 24. Calculate average Sale Price per RAM size.
-- 25. Find the PC Model with the highest Sale Price.
-- 26. Calculate the average number of days between Purchase Date and Ship Date.
-- 27. Determine which Sales Person Department generates the highest revenue.
-- 28. Calculate total revenue per Storage Capacity.
-- 29. Identify sales where Sale Price is lower than PC Market Price.
-- 30. Rank Sales Person Name by Total Sales per Employee using a window function.

