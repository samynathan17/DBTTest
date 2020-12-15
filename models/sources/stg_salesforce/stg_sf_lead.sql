{% if not var("enable_salesforce_source") %}
{{
    config(
        enabled=false
    )
}}
{% endif %}

{% if var("salesforce_crm_etl_name") == 'fivetran' %}
    WITH lead AS (
       select *  from {{ var('salesforce_schema_name') }}.{{ var('salesforce_lead_table_name') }} 
    ),opportunity as(
        select *  from {{ var('salesforce_schema_name') }}.{{ var('salesforce_opportunity_table_name') }} 
    ),renamed as(
    SELECT
        {{ dbt_utils.surrogate_key('lead.id') }} AS lead_id,
        NULL AS account_id,
        lead.LEAD_SOURCE AS lead_name,
        lead.ID AS source_id,
        concat(COALESCE(lead.street,' ',lead.city,' ',lead.state,' ',lead.postal_code,' ',lead.country)) AS lead_contact_address,
        lead.STATUS AS STATUS,
        opportunity.CREATED_DATE AS opp_stage_start_dt,
        opportunity.CLOSE_DATE AS opp_stage_end_dt,
        NULL AS opp_stage_id,
        opportunity.STAGE_NAME AS opp_stage_name,
        NULL AS product_id,
        NULL AS campaign_id,
        NULL AS lead_to_opp_flag,
        lead.IS_CONVERTED AS lead_lost_flag,
        lead.CONVERTED_DATE AS lead_CONVERTED_DATE,
        lead.CONVERTED_OPPORTUNITY_ID AS CONVERTED_OPPORTUNITY_ID,
        NULL AS lead_lost_dt,
        NULL AS lead_lost_reason,
        lead.INDUSTRY AS Industry,
        'D_LEAD_DIM_LOAD' AS DW_SESSION_NM,
        {{ dbt_utils.current_timestamp() }} AS DW_INS_UPD_DTS 
        FROM
          lead left join opportunity on lead.owner_id = opportunity.owner_id 
    )    
    
{% endif %}

select * from renamed

