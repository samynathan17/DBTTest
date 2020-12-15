
  create or replace  view DATAFLOTEST_DATABASE.dbt_staging.stg_sf_account  as (
    


    WITH source AS (

    select * from salesforce.account 

    ),renamed as (
      select
      
        id ,
        name,
        -- keys
        parent_id,
        owner_id,

        -- logistics
        type,
        billing_street,
        billing_city,
        billing_state,
        billing_country,
        billing_postal_code,

        -- Shipping details
        shipping_street,
        shipping_city,
        shipping_state,
        shipping_country,
        shipping_postal_code,
        account_number,
        -- details
        industry,
        description,
        number_of_employees,
        annual_revenue,
        ownership,

        -- metadata
        last_activity_date,
        created_date,
        last_modified_date,
        clean_status,
        account_source,
        rating,
        customer_priority_c,
        active_c,
        IS_DELETED
      from source
    )
    


select * from renamed
  );
