{% if var("salesforce_crm_etl_name") == 'fivetran' %}
    WITH source AS (

    select * from {{ var('salesforce_schema_name') }}.{{ var('salesforce_Campaign_table_name') }} 

    ),renamed as (

      SELECT
        NULL AS Account_ID,
        {{ dbt_utils.surrogate_key('id') }} AS Campaign_ID,
        NAME AS Campaign_Name,
        IS_ACTIVE AS active_flag,
        ID AS Source_ID,
        TYPE AS TYPE,
        STATUS AS STATUS,
        START_DATE AS START_DATE,
        END_DATE AS END_DATE,
        EXPECTED_REVENUE AS EXPECTED_REVENUE,
        BUDGETED_COST AS BUDGETED_COST,
        ACTUAL_COST AS ACTUAL_COST,
        EXPECTED_RESPONSE AS EXPECTED_RESPONSE,
        NUMBER_SENT AS NUMBER_SENT,
        NUMBER_OF_LEADS AS NUMBER_OF_LEADS,
        NUMBER_OF_CONVERTED_LEADS AS NUMBER_OF_CONVERTED_LEADS,
        NUMBER_OF_CONTACTS AS NUMBER_OF_CONTACTS,
        NUMBER_OF_RESPONSES AS NUMBER_OF_RESPONSES,
        NUMBER_OF_OPPORTUNITIES AS NUMBER_OF_OPPORTUNITIES,
        NUMBER_OF_WON_OPPORTUNITIES AS NUMBER_OF_WON_OPPORTUNITIES,
        AMOUNT_ALL_OPPORTUNITIES AS AMOUNT_ALL_OPPORTUNITIES,
        AMOUNT_WON_OPPORTUNITIES AS AMOUNT_WON_OPPORTUNITIES,
        'D_CAMPAIGN_DIM_LOAD'  AS 	DW_SESSION_NM,
        {{ dbt_utils.current_timestamp() }} AS DW_INS_UPD_DTS 
     FROM
        source
      
      )

  select * from  renamed  

{% endif %}  