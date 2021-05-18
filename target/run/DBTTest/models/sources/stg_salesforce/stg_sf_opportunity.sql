
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_opportunity  as (
    


    WITH OPPORTUNITY AS (
       select *  from DBT_TEST_LIVEDATA_RK.opportunity 
    ),contact AS(
        select *  from DBT_TEST_LIVEDATA_RK.contact    
    ),
    emp AS(
        select *  from DBT_TEST_LIVEDATA_RK.user    
    ),
    
      OPPORTUNITY_LINE_ITEM AS(
      select NULL AS OPPORTUNITY_ID,NULL AS PRODUCT_2_ID,NULL AS PRODUCT_CODE,NULL AS TOTAL_PRICE
      )
     

    ,OPPORTUNITY_STAGE AS(
        select *  from DBT_TEST_LIVEDATA_RK.OPPORTUNITY_STAGE    
    )
    ,renamed as(
    SELECT
        md5(cast(
    
    coalesce(cast(OPPORTUNITY.id as 
    varchar
), '')

 as 
    varchar
)) AS opp_id,
        OPPORTUNITY.NAME AS opp_name,
        OPPORTUNITY.TYPE AS opp_Type,
        cast('fivetran' as varchar(50)) AS opp_entity_id, 
        OPPORTUNITY.ACCOUNT_ID AS opp_account_id,        
        OPPORTUNITY.OWNER_ID AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY_STAGE.SORT_ORDER AS opp_stage_id,
        OPPORTUNITY.IS_WON as OPP_WON,
        OPPORTUNITY.IS_CLOSED as OPP_CLOSED,
        OPPORTUNITY.stage_name AS opp_stage_name,
        -- 
        --   OPPORTUNITY.PROBABILITY as OPP_PROBABILITY,
        --   
        OPPORTUNITY.FORECAST_CATEGORY as OPP_FORECAST_CATEGORY,
        OPPORTUNITY.AMOUNT AS opp_amount,
        --OPPORTUNITY.EXPECTED_REVENUE as opp_EXPECTED_REVENUE,
        NULL AS opp_amount_without_disc,
        NULL AS opp_expectd_Clouser_Dt,
        OPPORTUNITY.CONTACT_ID AS Contact_id,
        contact.NAME AS opp_contact_name,
        contact.PHONE AS opp_contact_number,
        contact.EMAIL AS opp_contact_email,
        contact.MAILING_STREET AS opp_contact_address,
        OPPORTUNITY.CREATED_DATE AS opp_initial_create_dt,
        OPPORTUNITY.LAST_MODIFIED_DATE AS opp_last_updated_dt,
        NULL AS opp_prospect_Dt,
        NULL AS opp_stage_calc_id,
        OPPORTUNITY_STAGE.CREATED_DATE AS opp_stage_start_dt,
        OPPORTUNITY.CLOSE_DATE AS opp_stage_end_dt,        
        NULL AS lead_lost_reason,
        --OPPORTUNITY.CAMPAIGN_ID AS campaign_id,
        NULL AS opp_competitor,
        NULL AS opp_on_hold_flag,
        OPPORTUNITY_LINE_ITEM. PRODUCT_2_ID AS opp_product_id,
        OPPORTUNITY_LINE_ITEM. PRODUCT_CODE AS opp_product_name,
        NULL AS opp_sub_product_id,
        NULL AS opp_sub_product_name,
        OPPORTUNITY_LINE_ITEM. TOTAL_PRICE AS opp_product_amount,
        NULL AS opp_prd_amount_without_disc,
        NULL AS opp_prd_discount,
        OPPORTUNITY. STAGE_NAME AS opp_source_name,
        OPPORTUNITY. IS_DELETED AS opp_active,
        NULL AS DW_CURR_FLG,
        NULL AS EFFCT_START_DATE,
        NULL AS EFFCT_END_DATE,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY 
        left join emp on OPPORTUNITY.Owner_id  =  emp.id
        left join contact on emp.contact_id  =  contact.id
        left join OPPORTUNITY_LINE_ITEM on OPPORTUNITY.ID = OPPORTUNITY_LINE_ITEM.OPPORTUNITY_ID
        left join OPPORTUNITY_STAGE on OPPORTUNITY.stage_name = OPPORTUNITY_STAGE.MASTER_LABEL
     
    )    
    


select * from renamed
  );
