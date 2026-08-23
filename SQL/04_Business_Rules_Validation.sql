-- Chech wheather the payment amoubrt is negative or positive 
-- Ans--there is no negative value 
Select payment_value
from Order_Payments
where payment_value <0;

 --Check wheather the Rating is between 1to 5 
--Ans-- all values are in between 1 to 5

Select review_score 
from Order_Reviews
where review_score not between 1 and 5;

--Chech wheather the price	and freight_value   amount are negative or positive 
Select  price, freight_value
from  Order_Items
Where price<0
or freight_value<0

Select order_delivered_customer_date,
		order_purchase_timestamp 
from Orders
wHERE order_purchase_timestamp>order_delivered_customer_date 


Select order_estimated_delivery_date,
		order_purchase_timestamp 
from Orders
wHERE order_purchase_timestamp>order_estimated_delivery_date 

---Payment installments should be at least 1
SELECT payment_installments
FROM order_payments
WHERE payment_installments < 1;

-- Business Rule: Payment installments should be greater than or equal to 1.
-- Observation: Found 2 records with payment_installments = 0.
-- Recommendation: Review these records with the business team to determine whether they are data entry errors or valid exceptions.

--Business Rule: Credit card payments should have at least 1 installment.
-- Observation:
-- Found 2 records where payment_installments = 0.
-- These records may indicate data quality issues or source system anomalies.
SELECT *
FROM order_payments

Where  payment_installments =0;