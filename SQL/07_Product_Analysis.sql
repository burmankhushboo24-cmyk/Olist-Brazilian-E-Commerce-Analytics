--------------Best Selling Product Categories--------------
Select  TOp 10
		P.product_category_name,
		Count(OI.product_id) as Total_Product
From Order_Items OI
Join Products P
on OI.product_id=P.product_id
Group by P.product_category_name
Order by Total_Product Desc;

--------------Least Selling Product Categories--------------

Select  Year (O.order_purchase_timestamp) as Year ,
		P.product_category_name,
		COUNT(OI.product_id) AS Total_Products_Sold
From Orders O 
Join Order_Items OI
on O.order_id= OI.order_id
Join Products P
on OI.product_id=P.product_id
Group by Year( O.order_purchase_timestamp),
          P.product_category_name
Order by year  Desc,
         Total_Products_Sold ASC ;

--------------Most Expensive Products--------------

Select
 top 10
P.product_category_name,OI.price
from Products P
join  Order_Items OI
On P.product_id=OI.product_id
order by OI.price desc;
--What is the highest-priced product in each category
SELECT
    P.product_category_name,
    MAX(OI.price) AS Highest_Price
FROM Products P
JOIN Order_Items OI
    ON P.product_id = OI.product_id
GROUP BY P.product_category_name
ORDER BY Highest_Price DESC;

--------------Cheapest Products--------------
SELECT
    P.product_category_name,
    Min(OI.price) AS Highest_Price
FROM Products P
JOIN Order_Items OI
    ON P.product_id = OI.product_id
GROUP BY P.product_category_name
ORDER BY Highest_Price desc;
--------------Revenue Contribution by Product Category (%)--------------
SELECT
    P.product_category_name, sum(OI.price) as Revenue,
    Round
	(sum(OI.price)*100.0/
	(Select sum(price)
	from Order_Items),2) 
	as Revenue_Contribution_Percentage
FROM Products P
JOIN Order_Items OI
    ON P.product_id = OI.product_id
GROUP BY P.product_category_name
ORDER BY Revenue desc;



--------------Average Product Price by Category--------------

SELECT
    P.product_category_name, 
	Avg(OI.price) as Avg_Price    
FROM Products P
JOIN Order_Items OI
    ON P.product_id = OI.product_id
GROUP BY P.product_category_name
ORDER BY Avg_Price desc;

