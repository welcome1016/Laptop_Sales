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

-- INTERMEDIATE QUESTIONS

-- 11. Calculate total revenue (SUM of Sale Price).
						Select sum(sale_price)
						as total_revenue_of_sale_price
						from [Laptop_market_sales].[dbo].[Laptop_data]

-- 12. Calculate total profit (SUM of Sale Price - Cost Price).
						Select sum( sale_price - Cost_Price)
						as Total_profit 
						from [Laptop_market_sales].[dbo].[Laptop_data]



-- 13. Find the average Discount Amount.
			Select avg(Discount_amount)
			as Average_discount_amount
			from [Laptop_market_sales].[dbo].[Laptop_data]
		
-- 14. Calculate total Finance Amount issued.
					Select sum(CONVERT( decimal(10,2), Finance_Amount))
					as Total_Finance_Amount
					from  [Laptop_market_sales].[dbo].[Laptop_data]

					-----MORE OPTIONS , when you cast you cast for temporaly
					select sum(cast(finance_amount as decimal(10,2)))
					as  Total_Finance_Amount
					from  [Laptop_market_sales].[dbo].[Laptop_data]
					
					----this one they say its permant fix

ALTER TABLE LAPTOP_DATA
ALTER COLUMN Finance_Amount DECIMAL(10,2);
SELECT SUM(Finance_Amount)
AS Total_Finance_Amount
FROM [Laptop_market_sales].[dbo].[Laptop_data]

-- 15. Find total revenue per PC Make.
				Select PC_Make , sum (cast(Sale_price * PC_Make as bigint))-----it can't be the market price
				AS total_revenue
				from [Laptop_market_sales].[dbo].[Laptop_data]
				group by PC_Make

				ALTER TABLE LAPTOP_DATA
ALTER COLUMN Sale_price DECIMAL(10,2);
SELECT SUM(Finance_Amount)
AS Total_Finance_Amount
FROM [Laptop_market_sales].[dbo].[Laptop_data]
				------------issues here


-- 16. Find average Sale Price per Storage Type.
		select Storage_type , avg(sale_price)
		as Average_Sale_price_per_Storage_type
		from [Laptop_market_sales].[dbo].[Laptop_data]
		group by Storage_Type

		-------how many storage type do we have
		select distinct storage_type
		from [Laptop_market_sales].[dbo].[Laptop_data]
		
-- 17. Calculate total revenue per Shop Name.
						Select Shop_Name , sum( cast( Pc_Make *Sale_Price as bigint) )
						as  total_revenue_per_Shop_Name
						from [Laptop_market_sales].[dbo].[Laptop_data]
						group by Shop_Name 
							--------------------another issue
							

-- 18. Calculate total revenue per Sales Person Name.
		

			----------here i'm facing bit of a challenge-------


-- 19. Find average Credit Score per Payment Method.
					Select Payment_method, avg(credit_score)
					as Average_credit_score_per_payment_method
					from  [Laptop_market_sales].[dbo].[Laptop_data]
					group by Payment_Method

-- 20. Calculate total Cost of Repairs per Sales Person Department.
										Select Sales_Person_Department, sum(cast(Cost_of_repairs as decimal(10,2)))
										as total_Cost_of_Repairs_per_Sales_Person_Department
										from   [Laptop_market_sales].[dbo].[Laptop_data]
										group by Sales_Person_Department




-- ADVANCED QUESTIONS

-- 21. Calculate profit per Shop Name.
			SELECT SHOP_Name
-- 22. Calculate profit margin per sale ((Sale Price - Cost Price) / Sale Price).
-- 23. Determine which Continent has the highest total revenue.
-- 24. Calculate average Sale Price per RAM size.
-- 25. Find the PC Model with the highest Sale Price.
-- 26. Calculate the average number of days between Purchase Date and Ship Date.
-- 27. Determine which Sales Person Department generates the highest revenue.
-- 28. Calculate total revenue per Storage Capacity.
-- 29. Identify sales where Sale Price is lower than PC Market Price.
-- 30. Rank Sales Person Name by Total Sales per Employee using a window function.

