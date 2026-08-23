---------------------Create Sales Summary View---------------------
Create View vw_Sales_Summary as

Select Year(O.order_purchase_timestamp) As Sales_Year,
		Month (O.order_purchase_timestamp) as Sales_Month ,
		C.customer_state,
		Sum(OI.Price) as Total_Revenue,
		Count(Distinct O.order_id) As Total_order,
		Count(distinct C.customer_unique_id ) AS Total_Customers
from Customers C
join Orders O
on C.customer_id=O.customer_id
Join Order_Items OI
on OI.order_id=O.order_id
Group by  Year(O.order_purchase_timestamp) ,
		Month (O.order_purchase_timestamp) ,
	C.customer_state;

Select * from vw_Sales_Summary
Where Sales_year=2017;


---------------------Create Customer Summary View---------------------

Create View vw_Customers_Summary as

Select C.customer_unique_id,
		C.customer_state,
        Sum(OI.Price) as Total_spendings,
		Count(Distinct O.order_id) As Total_order
from Customers C
join Orders O
on C.customer_id=O.customer_id
Join Order_Items OI
on OI.order_id=O.order_id
Group by  C.customer_unique_id,
		C.customer_state;

Select * from vw_Customers_Summary
Order by Total_spendings Desc,Total_Order Desc;
---------------------Create Seller Performance View---------------------
Alter View vw_Seller_Performance as

Select  S.seller_id,
		s.seller_state,
		Count (Oi.product_id) as Total_Product_sold,
		COUNT(DISTINCT OI.order_id) AS Total_Orders,
		sum(OI.Price) as Total_revenue,
	    Avg(OI.price) As AVG_Product_Price,
		Avg (R.review_score) as AVG_review_Score
From Sellers S
Join Order_Items OI
on S.seller_id=OI.seller_id
Join Order_Reviews R
on OI.order_id =R.order_id
Group by  S.seller_id,s.seller_state;

select * from vw_Seller_Performance;


---------------------Create Product Performance View---------------------
Create View vw_Product_Performance as
Select
		P.product_category_name,
		  P.product_id,
		Count(Distinct OI.order_id) as Total_Orders,
		count(OI.product_id) as Total_Quantity_sold,
		Sum(OI.price)as Total_revenue,
		Avg(OI.price)AS AVG_Product_Price
From Products P
Join Order_Items OI
on P.product_id=Oi.product_id
Group by P.product_category_name,
		  P.product_id;

Select * from  vw_Product_Performance;


---------------------Monthly Revenue Stored Procedure---------------------
Alter Procedure sp_Monthly_Revenue
As 
Begin 
	Select  Year (O.order_purchase_timestamp) as Sales_year,
	    DateName (Month ,O.order_purchase_timestamp) as Sales_Month_Name, 
	        MONTH(O.order_purchase_timestamp) as Sales_Month, 
			Sum(OI.Price)As Total_Revenue
	
	FROM Orders O
    JOIN Order_Items OI
        ON O.order_id = OI.order_id
    GROUP BY
        YEAR(O.order_purchase_timestamp),
		DateName (Month ,O.order_purchase_timestamp),
        MONTH(O.order_purchase_timestamp)
    ORDER BY
        Sales_Year,
        Sales_Month;
	End;

	Exec sp_Monthly_Revenue ;
---------------------Revenue by State Stored Procedure---------------------

alter Procedure sp_State_Revenue
As 
Begin 
 SET NOCOUNT ON;

	Select C.customer_state,
			Sum(OI.Price)As Total_Revenue
	FROM Customers C
	Join Orders O
	On C.Customer_ID=O.Customer_ID
    JOIN Order_Items OI
        ON O.order_id = OI.order_id
    GROUP BY
        C.customer_state
    ORDER BY
        Total_Revenue desc;
	End;

	Exec sp_Monthly_Revenue ;



---------------------Customer Revenue Function---------------------
Create Function fn_Customer_revenue
(
@Customer_ID Varchar(50)
)
Returns Decimal(10,2)
as 
Begin
	Declare @Revenue Decimal(10,2);

	Select @Revenue=Sum(OI.price)
	from Customers C
	join Orders O
	on C.customer_id=O.customer_id
	Join Order_Items OI
	On Oi.order_id=O.order_id
	Where C.customer_unique_id=@Customer_ID;

	return isnull(@revenue,0) ;

	End;





	Select dbo.fn_Customer_revenue
	('861eff4711a542e4b93843c6dd7febb0');

