---Check Duplicate Records

EXEC sp_help 'customers'; --customer_id
EXEC sp_help 'Orders'; --order_id
EXEC sp_help 'Order_Items'; 
EXEC sp_help 'geolocation';
EXEC sp_help 'Order_Reviews';
EXEC sp_help 'Order_Payments'; 
EXEC sp_help 'Products';--product_id
EXEC sp_help 'Sellers'; --seller_id
EXEC sp_help 'Product_Category_Name_Translation'; --product_category_name
---------------Customers-----------------
--Duplicate 0
Select customer_id,
		Count (*) as customer_count 
		from Customers
		Group by Customer_id
		having Count (*) >1
;
--Null 0
SElect * 
from  Customers
Where customer_id is Null;
-----------------Reviews---------------

--Duplicate 0
Select product_category_name,
		Count (*) as review_count 
		from Product_Category_Name_Translation
		Group by Product_Category_Name
		having Count (*) >1

;
--Null 0
SElect * 
from  Product_Category_Name_Translation
Where product_category_name is Null;
--------------Products------------------
--Duplicate 0
Select Product_id,
		Count (*) as Products_count 
		from Products
		Group by product_id
		having Count (*) >1
;
--Null 0
SElect * 
from  Products
Where product_id is Null;
----------------Sellers----------------
--Duplicate 0
Select seller_id,
		Count (*) as customer_count 
		from Sellers
		Group by seller_id
		having Count (*) >1
;
--Null 0
SElect * 
from  Sellers
Where seller_id is Null;
---------------Orders-----------------
Select Order_id,
		Count (*) as customer_count 
		from Orders
		Group by Order_id
		having Count (*) >1
;
--Null 0
SElect * 
from  Orders
Where Order_id is Null;


---------------------------OrderItems -------------------
Select order_id,order_item_id,
	   Count (*) as Duplicate_Count
from Order_Items
Group by order_id,order_item_id
having Count(*)>1;

Select * from Order_Items
Where order_id is null
or order_item_id is null


ALTER TABLE order_items
ADD CONSTRAINT PK_order_items
PRIMARY KEY (order_id, order_item_id);

---------------------------Payments  -------------------
Select Order_id , payment_sequential, count(*) Duplicat_value
from Order_Payments
Group by order_id,payment_sequential
Having Count(*)>1

Select * from Order_Payments
Where order_id is null
or payment_sequential is null

Alter Table Order_Payments
Add constraint PK_Order_Payments
Primary Key (order_id,payment_sequential);


---------------------------Review -------------------
SELECT order_id,
       COUNT(*) AS Duplicate_Count
FROM order_reviews
GROUP BY order_id
HAVING COUNT(*) > 1;


