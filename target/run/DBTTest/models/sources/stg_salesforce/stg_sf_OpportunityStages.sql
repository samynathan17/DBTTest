
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_OpportunityStages  as (
    


    WITH source AS (
       select *  from salesforce.OPPORTUNITY_STAGE 
    ),renamed as(
        SELECT
        md5(cast(
    
    coalesce(cast(id as 
    varchar
), '')

 as 
    varchar
))  AS stage_id,
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
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
     FROM
       source
    )    
    


select * from renamed
  );
