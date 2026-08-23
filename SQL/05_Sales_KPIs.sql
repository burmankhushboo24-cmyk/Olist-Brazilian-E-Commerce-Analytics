---------------Total Revenue including Shiping ----------------------------------

SElect  Sum (Price) as Total_Product_Revenue, 
Sum (freight_value) as total_Freight_Revenue,
Sum (Price+freight_value) as Total_Revenue_inc_Shipping
from Order_Items


---------------Totalamount collected from customer  16008872.12-------

Select Sum (payment_value) as Total_collected_from_customers
from Order_Payments


-------------- Total Orders 99441---------------------------------

Select Count (distinct order_id) from Orders

---------------Total Customers-----------------------------------------

Select Count(Distinct customer_id)as Total_customers_linkedto_ordrs from Customers

Select Count(distinct customer_unique_id) as total_unique_customers from Customers

---------------Total Products Sold------------------------------------------

Select  count (order_item_id) as total_product_sold from order_items

---------Average Order Value---------------------------------------------------------
---(On average, how much money does a customer spend in one order?)
--137.754076


Select avg(Order_total) as Avg_order_value 
from (
Select order_id, Sum (price) as Order_total 
from Order_Items
group by order_id) AS ORDERVALUE ;

WITH OrderValue AS
(
    SELECT
        order_id,
        SUM(price) AS Order_Total
    FROM order_items
    GROUP BY order_id
)

SELECT DISTINCT
    AVG(Order_Total) AS Average_Order_Value
FROM OrderValue;

-------------------------Average Review Score--4--------------------------------

Select Avg (review_score) 
as Average_Review_Score 
from Order_Reviews;

---------------Average Delivery Time--------------------------------------------

 Select Avg( Datediff(day,order_purchase_timestamp,
 order_delivered_customer_date) )as Delevery_time 
 from Orders
 where order_status= 'Delivered'

-------------On-Time Delivery Rate   91.880000000000------------------------

Select 

ROUND ( sum (Case 
When order_delivered_customer_date<=order_estimated_delivery_date then 1
else 0
end )* 100.0/count(*),2) as on_time_Delivery_rate
from Orders
Where order_status='Delivered';

--------------------Total Quantity Sold--------------------------------------
Select count(order_item_id)
as Total_Product_sold 
from Order_Items

--------Average Freight Cost 19.990319---------------------------
Select AVG(freight_value ) 
as Avg_Freight_Cost 
from Order_Items;


------------Orders by Status---------------------
Select Order_status, Count(*) as Total_count
from Orders
Group By order_status;


------Orders by Year, Month, and Quarter------
--------------Year-------------------------
Select Year(order_purchase_timestamp) as Order_Year, count (*) as total_Yearly   
from Orders
Group by Year(order_purchase_timestamp)
order By Year(order_purchase_timestamp) desc;
-------------Month -------------------------
Select 
 Datename(Month ,order_purchase_timestamp),count (*) as total_Monthly
 from Orders
 Group by Month (order_purchase_timestamp), 
 Datename(Month ,order_purchase_timestamp)
order By Month (order_purchase_timestamp);

--------------Quarter----------------


Select Datepart(QUARTER, order_purchase_timestamp) as 
Order_Quarterly,count (*) as total_Quarterly 
from Orders
group by Datepart(QUARTER, order_purchase_timestamp)
order by Datepart(QUARTER, order_purchase_timestamp) 

