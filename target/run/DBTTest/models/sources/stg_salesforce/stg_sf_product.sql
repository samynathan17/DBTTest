
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_product  as (
    


    WITH source AS (
        SELECT * from DBT_TEST_LIVEDATA_RK.product_2 
    ),renamed as(
        SELECT
            NULL AS account_id,
            md5(cast(
    
    coalesce(cast(id as 
    varchar
), '')

 as 
    varchar
)) AS product_id,
            ID AS Source_id,
            PRODUCT_CODE AS product_code,
            NAME AS product_name,
            IS_ACTIVE AS active_flag,
            QUANTITY_UNIT_OF_MEASURE AS Quantity_UOM,
            'D_PRODUCT_DIM_LOAD'  AS DW_SESSION_NM,
            
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
         FROM
            source 
     
    )    
    



select * from renamed
  );
