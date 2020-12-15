{% if not var("enable_salesforce_source") %}
{{
    config(
        enabled=false
    )
}}
{% endif %}

{% if var("salesforce_crm_etl_name") == 'fivetran' %}
    WITH source AS (
        SELECT * from {{ var('salesforce_schema_name') }}.{{ var('salesforce_product_table_name') }} 
    ),renamed as(
        SELECT
            NULL AS account_id,
            {{ dbt_utils.surrogate_key('id') }} AS product_id,
            ID AS Source_id,
            PRODUCT_CODE AS product_code,
            NAME AS product_name,
            IS_ACTIVE AS active_flag,
            QUANTITY_UNIT_OF_MEASURE AS Quantity_UOM,
            'D_PRODUCT_DIM_LOAD'  AS DW_SESSION_NM,
            {{ dbt_utils.current_timestamp() }} AS DW_INS_UPD_DTS 
         FROM
            source 
     
    )    
    

{% endif %}

select * from renamed

