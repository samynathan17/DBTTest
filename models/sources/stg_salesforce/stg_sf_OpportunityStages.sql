{% if not var("enable_salesforce_source") %}
{{
    config(
        enabled=false
    )
}}
{% endif %}

{% if var("salesforce_crm_etl_name") == 'fivetran' %}
    WITH source AS (
       select *  from {{ var('salesforce_schema_name') }}.{{ var('salesforce_oppo_stage_table_name') }} 
    ),renamed as(
        SELECT
        {{ dbt_utils.surrogate_key('id') }}  AS stage_id,
        MASTER_LABEL AS stage_name,
        SORT_ORDER AS stage_position,
        NULL AS account_id,
        IS_ACTIVE AS active_flag,
        ID AS Source_id,
        FORECAST_CATEGORY AS FORECAST_CATEGORY,
        NULL AS lead_opp_flag,
        IS_CLOSED AS IS_CLOSED,
        IS_WON AS IS_WON,
        DEFAULT_PROBABILITY AS OPPORTUNITY_STAGE,
        'D_OPPORTUNITYSTAGES_DIM_LOAD'  AS 	DW_SESSION_NM,
        {{ dbt_utils.current_timestamp() }} AS DW_INS_UPD_DTS 
     FROM
       source
    )    
    
{% endif %}

select * from renamed

