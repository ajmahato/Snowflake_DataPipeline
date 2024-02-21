
create table supplychaindata_analysis.public.sc_integrated_data
AS 
Select 
CT.CATEGORYID,
	CT.CATEGORYNAME, 
	C.CUSTOMERID,
	C.COUNTRY ,
	C.EMAIL ,
	C.FNAME ,
	C.LNAME ,
	C.PASSWORD,
	C.SEGMENT,
	C.STATE,
	C.STREET,
	C.ZIPCODE,
	D.DEPARTMENT_ID,
	D.DEPARTMENT_NAME,
	O.TYPE,
	O.MARKET,
	O.ORDER_CITY,
	O.ORDER_COUNTRY,
	O.ORDER_CUSTOMER_ID,
	O.ORDER_DATE,
	O.ORDER_ID,
	O.ORDER_ITEM_CARDPROD_ID,
	O.ORDER_ITEM_DISCOUNT,
	O.ORDER_ITEM_DISCOUNT_RATE,
	O.ORDER_ITEM_ID,
	O.ORDER_ITEM_PRODUCT_PRICE,
	O.ORDER_ITEM_PROFIT_RATIO,
	O.ORDER_ITEM_QUANTITY,
	O.SALES,
	O.ORDER_ITEM_TOTAL,
	O.ORDER_PROFIT_PER_ORDER,
	O.ORDER_REGION,
	O.ORDER_STATE,
	O.ORDER_STATUS,
	O.ORDER_ZIPCODE,
	P.PRODUCTCARDID,
	P.PRODUCTCATEGORYID,
	P.DESCRIPTION,
	P.IMAGE,
	P.NAME,
	P.PRICE,
	P.STATUS,
	SH.SHIPPING_DATE,
	SH.SHIPPING_MODE
from ORDER_INFO_UPD O left join SHIPPING_UPD SH
ON SH.ORDER_ID = O.ORDER_ID AND SH.ORDER_ITEM_ID = O.order_item_id
left join  DEPARTMENT_UPD D
ON O.DEPARTMENT_ID=D.DEPARTMENT_ID
left join CUSTOMER_UPD C 
ON O.CUSTOMER_ID=C.Customerid
left JOIN PRODUCT_UPD P
ON O.ORDER_ITEM_CARDPROD_ID =P.PRODUCTCARDID
left JOIN CATEGORY_UPD CT
ON P.PRODUCTCATEGORYID=CT.CATEGORYID
Where O.ORDER_ID and O.order_item_id is not Null ;
