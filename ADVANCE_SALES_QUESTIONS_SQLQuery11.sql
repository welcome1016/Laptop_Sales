-- ADVANCED QUESTIONS

-- 21. Calculate profit per Shop Name.
			SELECT SHOP_Name, sum(cast(Sale_Price - Cost_Price as decimal(10,2)))
			as Profit_per_Shop_Name
			from [Laptop_market_sales].[dbo].[Laptop_data]
			group by Shop_Name
-- 22. Calculate profit margin per sale ((Sale Price - Cost Price) / Sale Price).
			SELECT SUM(Sale_Price - Cost_Price)
			AS Profit_Margin_per_sale
			SELECT sum(cast(Sale_Price - Cost_Price as decimal(10,2))
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
				SELECT RAM, AVG(SALE_PRICE)
				AS SALE_PER_RAM_SIZE
				FROM   [Laptop_market_sales].[dbo].[Laptop_data]
				GROUP BY RAM
				ORDER BY RAM ASC;

-- 25. Find the PC Model with the highest Sale Price.
	SELECT TOP 1 PC_Model,SUM(SALE_PRICE)
	AS PC_MODEL_WITH_HIGHEST_PRICE
	FROM [Laptop_market_sales].[dbo].[Laptop_data]
	GROUP BY PC_Model
	ORDER BY PC_Model DESC;
	----------------LET ME GET THE MOST EXPENSILE PC_MAKE
	SELECT TOP 1 PC_MAKE,SALE_PRICE
	AS MOST_EXPENSIVE_PC
	FROM [Laptop_market_sales].[dbo].[Laptop_data]
	ORDER BY Sale_Price DESC

-- 26. Calculate the average number of days between Purchase Date and Ship Date.
							SELECT TRY_CAST(DATEDIFF(DAY,PURCHASE_DATE,SHIP_DATE) AS datetime) AS DaysDiff
							FROM  [Laptop_market_sales].[dbo].[Laptop_data]

-- 27. Determine which Sales Person Department generates the highest revenue.
											SELECT TOP 1 SALES_PERSON_DEPARTMENT, SUM(SALE_PRICE)
											AS HIGHEST_REVENUE
											FROM [Laptop_market_sales].[dbo].[Laptop_data]
											GROUP BY SALES_PERSON_DEPARTMENT
											ORDER BY SALES_PERSON_DEPARTMENT DESC


-- 28. Calculate total revenue per Storage Capacity.
		SELECT STORAGE_CAPACITY, SUM(SALE_PRICE)
		AS TOTAL_REVENUE_PER_STORAGE_CAPACITY
		FROM [Laptop_market_sales].[dbo].[Laptop_data]
		GROUP BY Storage_Capacity

-- 29. Identify sales where Sale Price is lower than PC Market Price.
									select Sale_Price, PC_Market_Price, PC_Make,Sales_Person_Name,PC_Model
									as sale_price_lower_than_pc_market_price
									from [Laptop_market_sales].[dbo].[Laptop_data]
									where Sale_Price < PC_Market_Price
									order by Sale_Price
									-----if I put = SQL Returns values but if not it returns non

-- 30. Rank Sales Person Name by Total Sales per Employee using a window function.
	
							SELECT DISTINCT SALES_PERSON_NAME , COUNT(SALES_PERSON_NAME)
								AS TOTAL_SALES_EMPLOYEE,
								RANK() Over(partition order by TOTAL_SALES_PER_EMPLOYEE DESC) as TOTAL_SALES_EMPLOYEE
								FROM  [Laptop_market_sales].[dbo].[Laptop_data]
								GROUP BY  TOTAL_SALES_PER_EMPLOYEE

-------NEW ADDED QUESTIONS
--31. Which pc generates the most revenue?
			Select * from [Laptop_market_sales].[dbo].[Laptop_data]

			Select top 1 PC_make, sum(sale_price)
			as Most_pc_revenue
			from [Laptop_market_sales].[dbo].[Laptop_data]
			group by  PC_Model

	
		--32 Which brand Generates the most revenue
						Select top 1 PC_make, sum(sale_price)
			as Most_pc_revenue
			from [Laptop_market_sales].[dbo].[Laptop_data]
			group by  PC_Make

			--33.Which processor type sells the most?
						Select top 1 ram, count(sale_price)--I think we can use different to choose how it will appear
						as most_sold_processor
						from [Laptop_market_sales].[dbo].[Laptop_data]
						group by ram 

			--34. What is the average PC  PRICE
						SELECT AVG(SALE_PRICE)
						AS AVG_PC_PRICE
						FROM [Laptop_market_sales].[dbo].[laptop_data]

			--35. What is the Most expensive PC sold
				SELECT TOP 1 PC_MAKE, MAX(SALE_PRICE)
				AS MOST_EXPENSIVE
				FROM  [Laptop_market_sales].[dbo].[laptop_data]
				GROUP BY PC_MAKE
				ORDER BY PC_MAKE DESC;

				--36.WHICH BRAND DOMINATE THE MARKET SHARE
							SELECT TOP 1 PC_MAKE, COUNT(PC_MARKET_PRICE)
							AS DOMINATING_BRAND
							FROM [Laptop_market_sales].[dbo].[laptop_data]
							GROUP BY PC_MAKE
							ORDER BY PC_MAKE ASC
							
				--37. WHAT PERCENTAGE OF REVENUE COMES FROM HIGH-END MACHINES?
							SELECT SUM(SALE_PRICE)
							AS TOTAL_REVENUE
							FROM[Laptop_market_sales].[dbo].[laptop_data]

							
							SELECT PC_MAKE ,SUM(SALE_PRICE)
							AS PC_REVENUE
							FROM[Laptop_market_sales].[dbo].[laptop_data]
							GROUP BY PC_MAKE

							---THEREFORE 
							SELECT PC_MAKE,
							sum(SALE_PRICE) as revenue,
							SUM(SALE_PRICE)*100.01 /
							(select SUM(SALE_PRICE) from[Laptop_market_sales].[dbo].[laptop_data])
							AS revenue_PERCENTAGE
							FROM [Laptop_market_sales].[dbo].[laptop_data]
							GROUP BY PC_MAKE
					

					--38. =---WHICH PC ARE PRICED ABOVE THE AVG MARKET
								SELECT PC_MAKE,PC_Market_Price,Sale_Price
								FROM [Laptop_market_sales].[dbo].[laptop_data],
								(select avg(pc_market_price) 
								from [Laptop_market_sales].[dbo].[laptop_data]) as  Pc_market_price
								where pc_market_price >	(select avg(pc_market_price) 
								from [Laptop_market_sales].[dbo].[laptop_data]
								
								
								------the correct one---

SELECT PC_Make, PC_Market_Price,
       (SELECT AVG(PC_Market_Price) 
        FROM [Laptop_market_sales].[dbo].[laptop_data]) AS Avg_Market_Price
FROM [Laptop_market_sales].[dbo].[laptop_data]
WHERE PC_Market_Price >
      (SELECT AVG(PC_Market_Price)
       FROM [Laptop_market_sales].[dbo].[laptop_data]);