-----------------Which category generates the highest revenue?------------------
Select Top 10
 P.product_category_name,
sum( O.price) as total_revenue 
from Products P
join Order_Items O
on P.product_id= O.product_id
Where P.product_category_name is not null
and O.price is not null
group by P.product_category_name
order by  total_revenue DEsc;

--------------------Which sellers perform best?--------------------------
Select Top 10  S.seller_id, 
		sum(OI.price ) as Total_revenue
from Sellers S
join Order_Items OI
on S.seller_id=OI.seller_id
Group by S.seller_id
order by Total_revenue Desc; 
--------------------Which states generate the most revenue?--------------------
Select Top 10  S.seller_state, 
		sum(OI.price ) as Total_revenue
from Sellers S
join Order_Items OI
on S.seller_id=OI.seller_id
Group by S.seller_state
order by Total_revenue Desc; 

--------------------Which payment method is most popular?--------------------
Select  top 1 payment_type, 
count(*) as Total_Transactions
from Order_Payments
Group by payment_type
order by Total_Transactions Desc


--------------------Which months have the highest sales?--------------------
Select 
 YEAR(O.order_purchase_timestamp) AS Sales_Year,
Datename( Month ,O.order_purchase_timestamp) as Month_Name , 
       
	   sum (OI.Price ) As Total_sales 
From Orders O
join Order_Items OI 
on o.order_id=OI.order_id
Group by  YEAR(O.order_purchase_timestamp),
Datename( Month ,O.order_purchase_timestamp),
          Month (O.order_purchase_timestamp ) 
order by Total_sales desc
;
--------------------Which customers place repeat orders?--------------------
Select customer_unique_id, Count(O.order_id) As Total_orders 
from Customers C
join Orders O
on C.customer_id=O.customer_id
Group by customer_unique_id
having Count(O.order_id)>1
order by Total_orders desc;