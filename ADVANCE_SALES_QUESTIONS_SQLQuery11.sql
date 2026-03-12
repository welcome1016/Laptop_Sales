-- ADVANCED QUESTIONS

-- 21. Calculate profit per Shop Name.
			SELECT SHOP_Name, sum(cast(Sale_Price - Cost_Price as decimal(10,2)))
			as Profit_per_Shop_Name
			from [Laptop_market_sales].[dbo].[Laptop_data]
			group by Shop_Name
-- 22. Calculate profit margin per sale ((Sale Price - Cost Price) / Sale Price).
			SELECT SUM(Sale_Price - Cost_Price)
			AS Profit_Margin_per_sale
			SELECT SUMsum(cast(Sale_Price - Cost_Price as decimal(10,2)(Sale_Pric
			from [Laptop_market_sales].[dbo].[Laptop_data]

			-----we really need to calculate the profit margin for each sale not the total profit margin

			SELECT 
    Sale_Price - Cost_Price AS subtraction_result,
    CASE 
        WHEN Cost_Price <> 0 THEN Sale_Price / Cost_Price
        ELSE NULL
    END AS division_result
FROM  [Laptop_market_sales].[dbo].[Laptop_data]


-- 23. Determine which Continent has the highest total revenue.
SELECT TOP 1 Continent , sum(Sale_Price)
				as Highest_total_revenue
				from  [Laptop_market_sales].[dbo].[Laptop_data]
				group by continent 
				order by continent desc;

-- 24. Calculate average Sale Price per RAM size.
-- 25. Find the PC Model with the highest Sale Price.
-- 26. Calculate the average number of days between Purchase Date and Ship Date.
-- 27. Determine which Sales Person Department generates the highest revenue.
-- 28. Calculate total revenue per Storage Capacity.
-- 29. Identify sales where Sale Price is lower than PC Market Price.
-- 30. Rank Sales Person Name by Total Sales per Employee using a window function.