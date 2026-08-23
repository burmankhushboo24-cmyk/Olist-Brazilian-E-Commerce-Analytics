------------------------Payment Method Distribution------------------------
Select  payment_type , count (*) as Total_Orders
From Order_Payments
Group by payment_type
order by Total_Orders  desc;

------------------------Revenue by Payment Type
Select  payment_type, Sum(payment_value ) as Total_Revenue 
From Order_Payments
Group by payment_type
order by Total_Revenue  desc;


------------------------Installment Analysis------------------------
Select  payment_installments, count(*) as Total_orders 
From Order_Payments
Group by payment_installments
order by payment_installments;



------------------------Average Payment Value by Payment Type------------------------
Select  payment_type, Avg(payment_value ) as Avg_Payment_value  
From Order_Payments
Group by payment_type
order by Avg_Payment_value   desc;
