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
				Select PC_Make , sum(Sale_price)
				AS total_revenue
				from [Laptop_market_sales].[dbo].[Laptop_data]
				group by PC_Make


-- 16. Find average Sale Price per Storage Type.
		select Storage_type , avg(sale_price)
		as Average_Sale_price_per_Storage_type
		from [Laptop_market_sales].[dbo].[Laptop_data]
		group by Storage_Type

		-------how many storage type do we have
		select distinct storage_type
		from [Laptop_market_sales].[dbo].[Laptop_data]
		
-- 17. Calculate total revenue per Shop Name.
						Select Shop_Name , sum(Sale_Price)
						as  total_revenue_per_Shop_Name
						from [Laptop_market_sales].[dbo].[Laptop_data]
						group by Shop_Name 
							--------------------another issue
							

-- 18. Calculate total revenue per Sales Person Name.
			Select Sales_Person_Name, sum(Sale_price)
						as  total_revenue_per_Sales_Person_Name
						from [Laptop_market_sales].[dbo].[Laptop_data]
						group by Sales_Person_Name

			


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