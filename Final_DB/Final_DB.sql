
create or replace database SUPPLYCHAINDATA_ANALYSIS COMMENT='This database holds the cleaned and transformed supply chain data.';



create or replace TABLE SUPPLYCHAINDATA_ANALYSIS.PUBLIC.CATEGORY_UPD (
	CATEGORYID NUMBER(38,0),
	CATEGORYNAME VARCHAR(16777216)
);




create or replace TABLE SUPPLYCHAINDATA_ANALYSIS.PUBLIC.CUSTOMER_UPD (
	CUSTOMERID NUMBER(38,0),
	CITY VARCHAR(16777216),
	COUNTRY VARCHAR(16777216),
	EMAIL VARCHAR(16777216),
	FNAME VARCHAR(16777216),
	LNAME VARCHAR(16777216),
	PASSWORD VARCHAR(16777216),
	SEGMENT VARCHAR(16777216),
	STATE VARCHAR(16777216),
	STREET VARCHAR(16777216),
	ZIPCODE NUMBER(38,0)
);



create or replace TABLE SUPPLYCHAINDATA_ANALYSIS.PUBLIC.DEPARTMENT_UPD (
	DEPARTMENT_ID NUMBER(38,0),
	DEPARTMENT_NAME VARCHAR(50)
);



create or replace TABLE SUPPLYCHAINDATA_ANALYSIS.PUBLIC.ORDER_INFO_UPD (
	TYPE VARCHAR(16777216),
	CUSTOMER_ID NUMBER(38,0),
	DEPARTMENT_ID NUMBER(38,0),
	MARKET VARCHAR(16777216),
	ORDER_CITY VARCHAR(16777216),
	ORDER_COUNTRY VARCHAR(16777216),
	ORDER_CUSTOMER_ID NUMBER(38,0),
	ORDER_DATE TIMESTAMP_NTZ(9),
	ORDER_ID NUMBER(38,0),
	ORDER_ITEM_CARDPROD_ID NUMBER(38,0),
	ORDER_ITEM_DISCOUNT NUMBER(38,0),
	ORDER_ITEM_DISCOUNT_RATE NUMBER(38,0),
	ORDER_ITEM_ID NUMBER(38,0),
	ORDER_ITEM_PRODUCT_PRICE NUMBER(38,0),
	ORDER_ITEM_PROFIT_RATIO NUMBER(38,0),
	ORDER_ITEM_QUANTITY NUMBER(38,0),
	SALES NUMBER(38,0),
	ORDER_ITEM_TOTAL NUMBER(38,0),
	ORDER_PROFIT_PER_ORDER NUMBER(38,0),
	ORDER_REGION VARCHAR(16777216),
	ORDER_STATE VARCHAR(16777216),
	ORDER_STATUS VARCHAR(16777216),
	ORDER_ZIPCODE NUMBER(38,0)
);



create or replace TABLE SUPPLYCHAINDATA_ANALYSIS.PUBLIC.SHIPPING_UPD (
	ORDER_ID NUMBER(38,0),
	ORDER_ITEM_ID NUMBER(38,0),
	SHIPPING_DATE TIMESTAMP_NTZ(9),
	SHIPPING_MODE VARCHAR(16777216)
);
