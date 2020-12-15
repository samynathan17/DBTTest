{% if not var("enable_salesforce_source") %}
{{
    config(
        enabled=false
    )
}}
{% endif %}

{% if var("salesforce_crm_etl_name") == 'fivetran' %}
    WITH source AS (

    select * from {{ var('salesforce_schema_name') }}.{{ var('salesforce_account_table_name') }} 

    ),renamed as (
      select
        {{ dbt_utils.surrogate_key('id') }} AS Account_ID,
        NAME AS Account_Name,
        TYPE AS Account_Type,
        ID AS Source_ID,
        IS_DELETED AS Active_Flag,
        ACCOUNT_NUMBER AS ACCOUNT_NUMBER,
        INDUSTRY AS INDUSTRY,
        ANNUAL_REVENUE AS ANNUAL_REVENUE,
        OWNER_ID AS OWNER_ID,
        'D_ACCOUNT_DIM_LOAD' AS DW_SESSION_NM,
        {{ dbt_utils.current_timestamp() }} AS DW_INS_UPD_DTS 
    FROM source
    )
    
{% elif var("sles_crm_etl") == 'stitch' %}
    WITH source AS (
      select * from {{ var('salesforce_schema_name') }}.{{ var('salesforce_account_table_name') }} where not is_deleted
    ),renamed as (
      select
      
        id ,
        name,
        -- keys
        parent_id,
        owner_id 
        from source
       )

{% endif %}

select * from renamed 

