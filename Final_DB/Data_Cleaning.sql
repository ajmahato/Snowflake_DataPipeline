/* order_info table */
/*check duplicates*/
Select count(*), order_id, Order_item_ID
from
ORDER_INFO
group by order_id, Order_item_ID
Having Count(*) >1

/* deleting duplicate from order info*/
DELETE FROM ORDER_info
WHERE (order_id, Order_item_ID) IN (
    SELECT 

        order_id,
        Order_item_ID
    FROM 
        (
            SELECT 
                order_id,
                Order_item_ID,
                ROW_NUMBER() OVER (PARTITION BY order_id, Order_item_ID ORDER BY (SELECT NULL)) AS row_num
            FROM 
                ORDER_info
        ) AS cte
    WHERE row_num > 1
);


CREATE TABLE supplychaindata_analysis.public.order_info_upd AS
SELECT *
FROM ORDER_INFO;

Select * from supplychaindata_analysis.public.order_info_upd;


/*-----------------------------------------------------------------------------------------*/
/*CATEGORY TABLE*/
/* remove null value*/
delete  FROM CATEGORY
WHERE CATEGORYID IS NULL;


/* deleting duplicate from category*/
Select count(*), CATEGORYID
from
CATEGORY
group by CATEGORYID
Having Count(*) >1

/* remove duplicate aand update category table*/

   CREATE Table supplychaindata_analysis.public.category_upd
   AS
   SELECT CategoryID ,CATEGORYNAME
    FROM (
        SELECT 
            CategoryID,CATEGORYNAME,
            ROW_NUMBER() OVER (PARTITION BY CategoryID ORDER BY NULL) AS row_num
        FROM 
            Category
    ) AS subquery
    WHERE row_num = 1 

   Select * from supplychaindata_analysis.public.category_upd
   
/*____________________________________________________________________________________*/


/* Find Null in Customer*/
delete  FROM CUSTOMER
WHERE CUSTOMERID IS NULL;


/* Find DUPLICATE in Customer*/
Select count(*), CUSTOMERID
from
CUSTOMER
group by CUSTOMERID
Having Count(*) >1

/*remove and Update customer table */
CREATE Table supplychaindata_analysis.public.customer_upd
   AS
   SELECT CUSTOMERID,CITY,COUNTRY,EMAIL,FNAME,LNAME,PASSWORD,SEGMENT,STATE,STREET,ZIPCODE
    FROM (
        SELECT 
            CUSTOMERID,CITY,COUNTRY,EMAIL,FNAME,LNAME,PASSWORD,SEGMENT,STATE,STREET,ZIPCODE,
            ROW_NUMBER() OVER (PARTITION BY CUSTOMERID ORDER BY NULL) AS row_num
        FROM 
            CUSTOMER
    ) AS subquery
    WHERE row_num = 1 

   Select * from supplychaindata_analysis.public.customer_upd

/*------------------------------------------------------------------------------------*/

/* Department Table*/

/* Find Null */
delete  FROM DEPARTMENT
WHERE DEPARTMENT_ID IS NULL;

/* Find DUPLICATE in DEPARTMENT*/
Select count(*), DEPARTMENT_ID
from
DEPARTMENT
group by DEPARTMENT_ID
Having Count(*) >1

/*remove and Update DEPARTMENT table */
CREATE Table supplychaindata_analysis.public.department_upd
   AS
   SELECT DEPARTMENT_ID,DEPARTMENT_NAME
    FROM (
        SELECT 
            DEPARTMENT_ID,DEPARTMENT_NAME,
            ROW_NUMBER() OVER (PARTITION BY DEPARTMENT_ID ORDER BY NULL) AS row_num
        FROM 
            DEPARTMENT
    ) AS subquery
    WHERE row_num = 1 

 Select * from supplychaindata_analysis.public.department_upd


 


/*------------------------------------------------------------------------------------*/

/* Product Table*/

/* Find Null */
delete  FROM PRODUCT
WHERE PRODUCTCARDID IS NULL;

/* Find DUPLICATE in PRODUCT*/
Select count(*), PRODUCTCARDID
from
PRODUCT
group by PRODUCTCARDID
Having Count(*) >1

/*remove and Update PRODUCT table */
CREATE Table supplychaindata_analysis.public.product_upd
   AS
   SELECT PRODUCTCARDID,CATEGORYID,PRODUCTCATEGORYID,DESCRIPTION,IMAGE,NAME,PRICE,STATUS
    FROM (
        SELECT 
            PRODUCTCARDID,CATEGORYID,PRODUCTCATEGORYID,DESCRIPTION,IMAGE,NAME,PRICE,STATUS,
            ROW_NUMBER() OVER (PARTITION BY PRODUCTCARDID ORDER BY NULL) AS row_num
        FROM 
            PRODUCT
    ) AS subquery
    WHERE row_num = 1 


 Select * from supplychaindata_analysis.public.product_upd



 /*---------------------------------------------------------------------------------------*/

 /* Shipping Table*/

/* Find Null */
delete  FROM SHIPPING
WHERE ORDER_ID and ORDER_ITEM_ID IS NULL;

/* Find DUPLICATE in SHIPPING TABLE*/
Select count(*), order_id, Order_item_ID
from
SHIPPING
group by order_id, Order_item_ID
Having Count(*) >1


/*remove and Update SHIPPING table */
CREATE Table supplychaindata_analysis.public.shipping_upd
   AS
   SELECT order_id, Order_item_ID,SHIPPING_DATE,SHIPPING_MODE
    FROM (
        SELECT order_id, Order_item_ID,SHIPPING_DATE,SHIPPING_MODE,
            ROW_NUMBER() OVER (PARTITION BY order_id, Order_item_ID ORDER BY NULL) AS row_num
        FROM 
            SHIPPING
    ) AS subquery
    WHERE row_num = 1 
    


 Select * from supplychaindata_analysis.public.shipping_upd


 /*---------------------------------------------------------------------------------------*/

 



