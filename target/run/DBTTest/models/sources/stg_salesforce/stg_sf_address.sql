
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_address  as (
    


    WITH source AS (
       select *  from DBT_TEST_LIVEDATA_RK.contact 
    ),union_addr AS(
        SELECT 
            id as address_id,
            account_id AS account_id,
            MAILING_STREET AS STREET,
            MAILING_CITY AS CITY,
            MAILING_STATE AS STATE,
            MAILING_POSTAL_CODE AS POSTAL_CODE,
            MAILING_COUNTRY AS COUNTRY,
          'Billing' as address_type from source
        union 
        SELECT
            id as address_id,
            account_id AS account_id,
            OTHER_STREET AS STREET,
            OTHER_CITY AS CITY,
            OTHER_STATE AS STATE,
            OTHER_POSTAL_CODE AS POSTAL_CODE,
            OTHER_COUNTRY As COUNTRY, 
            'Shipping' as address_type from source
    )
    
    


select * from union_addr
  );
