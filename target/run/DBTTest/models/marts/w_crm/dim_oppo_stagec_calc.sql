

      create or replace transient table DATAFLOTEST_DATABASE.dbt_test_marts.dim_oppo_stagec_calc  as
      (with opp_stage AS (
    SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_OpportunityStages
),oppo_snap AS(

    select *  from snapshots.OPPORTUNITY_SNAPSHOT_CHECK 
),oppo_stg_cal AS(

    SELECT
      md5(cast(
    
    coalesce(cast(opp_stage.STAGE_ID as 
    varchar
), '')

 as 
    varchar
)) AS opp_stage_calc_id,	
        opp_stage.STAGE_ID AS opp_stage_id,
        oppo_snap.STAGE_NAME AS opp_stage_name,
        oppo_snap.DBT_VALID_FROM AS opp_stage_start_datetime,
        oppo_snap.DBT_VALID_TO AS opp_stage_end_datetime,
        opp_stage.active_flag,
        'D_OPPO_STAGE_CALC_DIM_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS,
        oppo_snap.ID AS opp_id,	
        opp_stage.STAGE_POSITION AS stage_position,	
        case when DBT_VALID_TO is not null then 1 else 0 end AS is_stage_active_flag

     from opp_stage 
        left join oppo_snap on opp_stage.STAGE_NAME= oppo_snap.STAGE_NAME      
)

SELECT * from oppo_stg_cal
      );
    