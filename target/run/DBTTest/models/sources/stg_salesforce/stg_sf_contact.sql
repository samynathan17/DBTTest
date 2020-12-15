
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_contact  as (
    


    WITH source AS (

    select 
    ID,
    Account_Id,
    Owner_ID,
    last_name,
    first_name,
    Name,
    other_street,
    other_city,
    other_state,
    other_postal_code,
    other_country,
    other_latitude,
    other_longitude,
    mailing_street,
    mailing_city,
    mailing_state,
    mailing_postal_code,
    mailing_country,
    phone,
    fax,
    mobile_phone,
    home_phone,
    other_phone,
    assistant_phone,
    reports_to_id,
    email,
    title,
    department,
    assistant_name,
    lead_source,
    birthdate,
    description,
    created_date,
    created_by_id,
    last_modified_date,
    last_modified_by_id,
    is_email_bounced,
    clean_status,
    individual_id,
    level_c,
    languages_c
    from salesforce.contact 
    
    )



select * from source
  );
