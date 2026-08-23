------------------Top Customers by Spending------------------
Select Top 10
	   C.customer_unique_id,
       Sum(P.payment_value) as Customer_spendings
from  Customers C 
Join Orders O
on C.customer_id= O.customer_id
Join Order_Payments P
on O.order_id=P.order_id
Group by C.customer_unique_id
Order by  Customer_spendings Desc;

------------------Repeat Customers------------------

Select  C.customer_unique_id, 
        Count(O.order_ID) as Total_Orders
from Customers C
join orders O
on C.customer_id=O.customer_id
Group by customer_unique_id
Having Count(o.order_id)>1
order by Total_Orders Desc;




------------------New vs Returning Customers------------------
With Customers_orders as
(
SElect  C.customer_unique_id ,
		Count(O.order_id) as Total_orders
From Customers C
join Orders O
on C.customer_id =O.customer_id
GROUP BY c.customer_unique_id
)
Select 
	case
		when Total_orders=1 then 'New customer'
		else 'Returning Customer'
		End as Customer_Type, 
		Count(*) as Total_customers
from Customers_orders
group by case
		when Total_orders=1 then 'New customer'
		else 'Returning Customer'
		End;

	



------------------Customers by State------------------
Select customer_state , 
		count (Distinct customer_unique_id) AS Total_customers
		
from Customers
Group by customer_state 
Order by Total_customers DESC;

------------------Average Orders per Customer------------------

With Orders_Per_customers As
(
select   c.customer_unique_id,
	   count(order_id) as Total_orders
From Customers C
join Orders O
on C.customer_id=O.customer_id
Group by c.customer_unique_id

)
select Avg(cast (Total_orders as decimal(10,2))) 
from Orders_Per_customers;