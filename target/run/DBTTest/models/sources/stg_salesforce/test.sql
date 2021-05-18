
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_staging.test  as (
    WITH source AS (

    select * from DBT_TEST_LIVEDATA_RK.account 

    ),renamed as (
      select 
      
    cast(name as Varchar(765))
 AS name ,
      
    cast(IS_DELETED as BOOLEAN)
 AS is_dele,
      
    cast(ANNUAL_REVENUE as Number(18,0))
 AS reven
      
      
      from source

      
    ) 

 select * from renamed
  );
