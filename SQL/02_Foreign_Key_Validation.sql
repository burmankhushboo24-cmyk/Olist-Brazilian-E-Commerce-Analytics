
------FK-------
---If a column's values come from another table's Primary Key, then it is a Foreign Key
---------------------Customers-->Orders---------------------
Select * from Orders

SELECT o.customer_id
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
 
Alter Table Orders
Add Constraint FK_Orders_customers
foreign Key (Customer_id)
References Customers(Customer_id);

Exec Sp_help orders;
Exec Sp_help customers;

alter table Orders
alter column Customer_id nvarchar(50) not null;

---------------------Orders-->Orders Items ---------------------

SELECT oi.order_id
FROM order_items oi
LEFT JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;


Alter table Order_items
Add constraint FK_Orders_Order_items
Foreign Key (Order_id)
references orders(Order_Id);

---------------------Orders →Payments ---------------------
SELECT op.order_id
FROM order_payments op
LEFT JOIN orders o
    ON op.order_id = o.order_id
WHERE o.order_id IS NULL;


Alter table Order_Payments
Add constraint FK_Orders_Order_Payments
Foreign Key (Order_id)
references orders(Order_Id);


-----------------products → order_items------------
SELECT oi.product_id
FROM order_items oi
LEFT JOIN products p
    ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;


Alter Table order_items
add constraint FK_orderItems_Products
Foreign key (Product_ID)
References Products(Product_ID);
-----------------Seller → order_items------------

SELECT oi.seller_id
FROM order_items oi
LEFT JOIN sellers s
    ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;


ALTER TABLE order_items
ADD CONSTRAINT FK_orderitems_sellers
FOREIGN KEY (seller_id)
REFERENCES sellers(seller_id);

-----------------order → order_reviews------------
SELECT r.order_id
FROM order_reviews r
LEFT JOIN orders o
    ON r.order_id = o.order_id
WHERE o.order_id IS NULL;


ALTER TABLE order_reviews
ADD CONSTRAINT FK_reviews_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id);


-----------------Product category name  → Products ------------
SELECT
    product_category_name,
    COUNT(*) AS Duplicate_Count
FROM product_category_name_translation
GROUP BY product_category_name
HAVING COUNT(*) > 1;

SELECT *
FROM product_category_name_translation
WHERE product_category_name IS NULL;

SELECT DISTINCT
    p.product_category_name
FROM products p
LEFT JOIN product_category_name_translation t
ON p.product_category_name = t.product_category_name
WHERE p.product_category_name IS NOT NULL
  AND t.product_category_name IS NULL;

  SELECT
    product_category_name,
    COUNT(*) AS Product_Count
FROM products
WHERE product_category_name IN
(
    'pc_gamer',
    'portateis_cozinha_e_preparadores_de_alimentos'
)
GROUP BY product_category_name;


----The missing translations affect 13 products. 
--These products can still be analyzed, but their English 
--category names will be unavailable when joining to the translation table.
--This relationship was therefore left without a foreign key constraint
--to preserve the original dataset.