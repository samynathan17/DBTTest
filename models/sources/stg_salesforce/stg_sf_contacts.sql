{% if not var("enable_salesforce_source") %}
{{
    config(
        enabled=false
    )
}}
{% endif %}

{% if var("salesforce_crm_etl_name") == 'fivetran' %}
    WITH source AS (
       select *  from {{ var('salesforce_schema_name') }}.{{ var('salesforce_contact_table_name') }} 
    ),renamed as(
    SELECT 
        {{ dbt_utils.surrogate_key('id') }} AS contact_id, 
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
        {{ dbt_utils.current_timestamp() }} AS DW_INS_UPD_DTS 
     FROM 
       source

       --jion user tble &  NULL AS organization_id cmpy name, NULL AS employee_id,

    )    
    
{% endif %}

select * from renamed

