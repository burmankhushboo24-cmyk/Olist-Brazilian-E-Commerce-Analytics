Create Database Brazilian_Ecommerce;
Use  Brazilian_Ecommerce;

Select * from Customers
Select * from Orders
Select * from Order_Items
Select * from geolocation
Select * from Order_Reviews
Select * from Order_Payments
Select * from Products
Select * from Sellers
Select * from Product_Category_Name_Translation
USE Brazilian_Ecommerce;
GO

SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'geolocation'

Select * from geolocation

USE Brazilian_Ecommerce;
GO

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;

