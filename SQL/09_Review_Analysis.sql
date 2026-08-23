----------------------Review Score Distribution----------------------
Select review_score, count (review_id) as Total_reviews
from Order_Reviews
Group by review_score
Order by review_score asc



----------------------Average Review Score by Category----------------------

Select P.product_category_name,aVG(R.review_score ) AS AVG_Review_Score
from Order_Reviews R
Join Order_Items OI
on R.Order_id=OI.order_id
Join Products P
on OI.product_id=P.product_id
Where P.product_category_name is not null
gROUP BY P.product_category_name
oRDER BY AVG_Review_Score Desc;

----------------------Average Review Score by Seller----------------------


Select S.seller_id,aVG(R.review_score ) AS AVG_Review_Score
from Order_Reviews R
Join Order_Items OI
on R.Order_id=OI.order_id
Join Sellers S
on OI.seller_id=S.seller_id
Where S.seller_id is not null
gROUP BY S.seller_id
oRDER BY AVG_Review_Score asc;


----------------------Late Delivery vs Review Score----------------------


SELECT
    R.review_score,
    ROUND(
        AVG(DATEDIFF(
            DAY,
            O.order_estimated_delivery_date,
            O.order_delivered_customer_date
        )),
        2
    ) AS Avg_Days_Late
FROM Order_Reviews R
JOIN Orders O
    ON R.order_id = O.order_id
WHERE O.order_delivered_customer_date IS NOT NULL
GROUP BY R.review_score
ORDER BY R.review_score;


----------------------Top Rated Product Categories----------------------

Select
Top 10 
P.product_category_name,
count(R.review_id ) AS Total_Review,
AVG(R.review_score) As Avg_Review_Score
from Order_Reviews R
Join Order_Items OI
on R.Order_id=OI.order_id
Join Products P
on OI.product_id=P.product_id
Where P.product_category_name is not null
gROUP BY P.product_category_name
Having count(R.review_id )>=50
oRDER BY AVG_Review_Score Desc;

