
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_contacts  as (
    


    WITH source AS (
       select *  from salesforce.contact 
    ),renamed as(
    SELECT 
        md5(cast(
    
    coalesce(cast(id as 
    varchar
), '')

 as 
    varchar
)) AS contact_id, 
        salutation AS salutation, 
        NAME AS contact_name, 
        last_name AS last_name, 
        first_name AS first_name, 
        phone AS contact_number, 
        mobile_phone AS mobile_phone, 
        home_phone AS home_phone, 
        email AS contact_email, 
        id AS source_id, 
        department AS department, 
        lead_source AS lead_source, 
        NULL AS organization_id, 
        NULL AS employee_id, 
        account_id AS account_id, 
        NULL AS contact_age_group, 
        NULL AS contact_income, 
        NULL AS dependent, 
        NULL AS contact_type, 
        IS_DELETED AS active, 
        OWNER_ID AS owner_id,
        'D_CONTACT_DIM_LOAD' AS dw_session_nm, 
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
     FROM 
       source

    )    
    


select * from renamed
  );
