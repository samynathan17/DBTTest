
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_lead  as (
    


    WITH lead AS (
       select *  from salesforce.lead 
    ),opportunity as(
        select *  from salesforce.opportunity 
    ),renamed as(
    SELECT
        md5(cast(
    
    coalesce(cast(lead.id as 
    varchar
), '')

 as 
    varchar
)) AS lead_id,
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
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
        FROM
          lead left join opportunity on lead.owner_id = opportunity.owner_id 
    )    
    


select * from renamed
  );
