-------------------Late Deliveries-------------------

Select Count(order_id) as Total_order_late_Deliverd
from Orders
Where order_status='delivered'
and order_estimated_delivery_date<order_delivered_customer_date

-------------------On-Time Delivery Rate-------------------
Select 
	Round(
	Count(case
   when order_estimated_delivery_date>=order_delivered_customer_date Then 1
	end )*100.0/count(*),2) 
    as On_Time_Delivery_Rate
from Orders
Where order_status='delivered';

-------------------Average Delivery Time by State-------------------
Select  C. customer_state,
        Avg(DATEDIFF(day,
		O.order_purchase_timestamp,
		O.order_delivered_customer_date)) as Delivery_Time 
from Orders O
join Customers C
on O.customer_id=C.customer_id
Where O.order_status='Delivered'
  AND O.order_delivered_customer_date IS NOT NULL
Group by C. customer_state
Order by Delivery_Time DeSC;



-------------------Fastest Delivery States-------------------

Select  C. customer_state,
        avg(DATEDIFF(day,
		O.order_purchase_timestamp,
		O.order_delivered_customer_date)) as Delivery_Time 
from Orders O
join Customers C
on O.customer_id=C.customer_id
Where O.order_status='Delivered'
  AND O.order_delivered_customer_date IS NOT NULL
Group by C. customer_state
Order by Delivery_Time ASC;




-------------------Slowest Delivery States-------------------

Select  C. customer_state,
        avg(DATEDIFF(day,
		O.order_purchase_timestamp,
		O.order_delivered_customer_date)) as Delivery_Time 
from Orders O
join Customers C
on O.customer_id=C.customer_id
Where O.order_status='delivered'
  AND O.order_delivered_customer_date IS NOT NULL
Group by C. customer_state
Order by Delivery_Time DESC;
