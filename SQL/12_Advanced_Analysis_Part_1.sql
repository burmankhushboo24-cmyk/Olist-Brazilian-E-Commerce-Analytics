----------------Running (Cumulative) Revenue Over Time----------------
select O.order_purchase_timestamp, 
       Sum(I.price) as Total_revenue, 
      sum(Sum(I.price)) over
	   (order by O.order_purchase_timestamp) as Cumulative_Revenue 
from Order_Items I
join Orders O
on I.order_id=O.order_id
Group by O.order_purchase_timestamp
order by O.order_purchase_timestamp;
--------------Revenue Contribution (%) by Product Category----------------
Select P.product_category_name,
		Sum (OI.price) as Total_revenue ,
		Round (
		Sum(OI.price)*100.0/
		Sum( Sum(Price)) Over() ,
		2)as Revenue_Contribution_Percentage
from Products P
join Order_Items OI
on P.product_id=OI.product_id
Group by P.product_category_name
order by  Revenue_Contribution_Percentage desc;



---------------Top 3 Products within Each Category----------------
with Ranking as
(
Select P.product_category_name, 
       Oi.product_id,
	   Sum (Oi.price) Total_revenue,
	   Dense_rank () over 
	   (Partition by P.product_category_name
	   order by   Sum (Oi.price) Desc  ) as Product_Rank
from Products P
join Order_Items OI
on P.product_id=OI.product_id
Where P.product_category_name is not null
Group by P.product_category_name,Oi.product_id
)
Select  * from Ranking
Where Product_Rank<=3
order by product_category_name;


----------------Monthly Revenue Growth (%)----------------

With Monthly_Revenue as 
(
select 
Year(O.order_purchase_timestamp) as Sales_Year,
MONTH(O.order_purchase_timestamp) as Sales_Month, 
Sum(OI.price ) as Total_Revenue
from Orders O
Join Order_Items OI 
on O.order_id= OI.order_id
Group by 
Year(O.order_purchase_timestamp),
 MONTH(O.order_purchase_timestamp)
 )
 Select Sales_Year,
		Sales_Month,
		Total_Revenue,
		Lag(Total_Revenue) over 
		(Order by Sales_Year, Sales_Month )
		as Previous_Month_Revenue,
		Round(
		(Total_Revenue - Lag(Total_Revenue) over 
		(Order by Sales_Year, Sales_Month ))*100.0/
		Lag(Total_Revenue) over 
		(Order by Sales_Year, Sales_Month ),
		2) as Monthly_Growth_Percentage

 from Monthly_Revenue
 order by 
 Sales_Year,
 Sales_Month; 


----------------Previous Month vs Current Month Revenue----------------

select 
Year(O.order_purchase_timestamp) as Sales_Year,
MONTH(O.order_purchase_timestamp) as Sales_Month, 
Sum(OI.price ) as Current_Month_Revenue,
Lag(Sum(OI.price )) over(Order by Year(O.order_purchase_timestamp) ,
MONTH(O.order_purchase_timestamp)) as Privious_month_Revenue
from Orders O
Join Order_Items OI 
on O.order_id= OI.order_id
Group by 
Year(O.order_purchase_timestamp),
 MONTH(O.order_purchase_timestamp)
 Order by Sales_Year,
 sales_month;

----------------Customer Spending Ranking----------------
Select C.customer_unique_id,
Sum(P.payment_value) as Total_Spending,
DENSE_RANK () Over ( Order by Sum(P.payment_value) Desc) as Ranking
from Customers C
join Orders O
on C.customer_id=O.customer_id
join Order_Payments P
on O.order_Id=P.Order_id
Group by C.customer_unique_id
Order by Ranking



----------------Seller Revenue Ranking----------------
Select S.seller_id,
Sum(OI.price) as Total_revenue,
DENSE_RANK () Over ( Order by Sum(OI.price) Desc) as Ranking
from Sellers S
join Order_Items OI
on S.seller_id=OI.seller_id
Group by S.seller_id
Order by Ranking


----------------Top 5 Customers in Each State----------------
With Top_customers as 
(
Select C.customer_state, 
		C.customer_unique_id,
		Sum (OI.price) as Total_Revenue ,
		DENSE_RANK () over 
		(Partition by C.customer_state 
		order by  Sum (OI.price) Desc)  as Ranking
from Customers C
Join Orders O
on C.customer_id=O.customer_id
Join Order_Items OI
on O.order_id=OI.order_id
group by C.customer_state, C.customer_unique_id
)
Select * from Top_customers
Where Ranking<=3
ORDER BY
    customer_state,
    Ranking;



