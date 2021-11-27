
 SELECT 
	   
       [CarDealership_OLTP1].[dbo].[VEHICLE].[big_id_PK] AS  id_PK
	  
      ,[dec_base_price] AS price
      ,[var_vin] AS vin
      ,[var_engine] AS  engine
      ,[var_brake_system] AS brake_system
      ,[tin_number_cylinders] AS number_cylinders
      ,[dec_displacement_cc] AS displacement_cc
      ,[var_gvwr] AS gvwr
      ,IIF([bit_use_state] = 0, 'new' , 'used') AS use_state 
       ,[end_date] 
	   ,[start_date] 
      ,[int_year] AS model_year
      ,[tin_doors] AS doors
	  ,[var_postalCode] AS manufacturer_postal_code
      ,[CarDealership_OLTP1].[dbo].[COLOR].[var_name] AS color
      ,[CarDealership_OLTP1].[dbo].[MODEL].[var_name] AS model 
      ,[CarDealership_OLTP1].[dbo].[FUEL_TYPE].[var_name] AS fuel_type 
      ,[CarDealership_OLTP1].[dbo].[VEHICLE_TYPE].[var_name] AS vehicle_type
      ,[CarDealership_OLTP1].[dbo].[TRANSACTION_STATE].[var_name] AS transaction_state
	  ,[CarDealership_OLTP1].[dbo].[BRAND].[var_name] AS brand
	  ,[CarDealership_OLTP1].[dbo].[MANUFACTURER].[var_name] AS manufacturer
	  ,[CarDealership_OLTP1].[dbo].[BODY_CLASS].[var_name] AS body_class


  FROM [CarDealership_OLTP1].[dbo].[VEHICLE] 
  
  JOIN [CarDealership_OLTP1].[dbo].[COLOR] ON [CarDealership_OLTP1].[dbo].[VEHICLE].[tin_color_FK] = [CarDealership_OLTP1].[dbo].[COLOR].[tin_id_PK]

  JOIN [CarDealership_OLTP1].[dbo].[MODEL] ON [CarDealership_OLTP1].[dbo].[VEHICLE].[big_model_FK] = [CarDealership_OLTP1].[dbo].[MODEL].[big_id_PK]

  JOIN [CarDealership_OLTP1].[dbo].[FUEL_TYPE] ON [CarDealership_OLTP1].[dbo].[VEHICLE].[tin_fuel_type_FK] = [CarDealership_OLTP1].[dbo].[FUEL_TYPE].[tin_id_PK]

  JOIN [CarDealership_OLTP1].[dbo].[VEHICLE_TYPE] ON [CarDealership_OLTP1].[dbo].[VEHICLE].[tin_vehicle_type_FK] = [CarDealership_OLTP1].[dbo].[VEHICLE_TYPE].[tin_id_PK]

  JOIN [CarDealership_OLTP1].[dbo].[TRANSACTION_STATE] ON [CarDealership_OLTP1].[dbo].[VEHICLE].[tin_transaction_state_FK] = [CarDealership_OLTP1].[dbo].[TRANSACTION_STATE].[tin_id_PK]

  JOIN [CarDealership_OLTP1].[dbo].[BRAND] ON [CarDealership_OLTP1].[dbo].[MODEL].[big_brand_FK] = [CarDealership_OLTP1].[dbo].[BRAND].[big_id_PK]
  
  JOIN [CarDealership_OLTP1].[dbo].[MANUFACTURER] ON [CarDealership_OLTP1].[dbo].[BRAND].[int_manufacturer_FK] = [CarDealership_OLTP1].[dbo].[MANUFACTURER].[int_id_PK]

  JOIN [CarDealership_OLTP1].[dbo].[BODY_CLASS] ON [CarDealership_OLTP1].[dbo].[MODEL].[tin_body_class_FK] = [CarDealership_OLTP1].[dbo].[BODY_CLASS].[tin_id_PK]


  use CarDealership_OLTP1
  GO

  ALTER TABLE Vehicle
  ADD tex_description VARCHAR(100)
     ;


SELECT
CAST(NULL AS DATE) AS start_date,
CAST(NULL AS DATE) AS end_date,
CAST(NULL AS VARCHAR(100)) AS gvwr,
CAST(1 AS TINYINT) AS use_state,
CAST(NULL AS VARCHAR(50)) AS color, 
posting_date AS craiglist_post_date,
CAST(4 AS TINYINT) AS transaction_state,
vin,
manufacter AS manufacturer,
brand, model,
year AS model_year,
fuel_type,
vehicle_type,
body_class,
base_price AS price,
engine,
brake_system,
number_cylinders,
displacement_cc,
doors
FROM vehicles ;
  

