
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_opportunity  as (
    


    WITH OPPORTUNITY AS (
       select *  from salesforce.opportunity 
    ),contact AS(
        select *  from salesforce.contact    
    ),OPPORTUNITY_LINE_ITEM AS(
        select *  from salesforce.OPPORTUNITY_LINE_ITEM    
    
    ),OPPORTUNITY_STAGE AS(
        select *  from salesforce.OPPORTUNITY_STAGE    
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
        OPPORTUNITY.TYPE AS Type,
        OPPORTUNITY.ACCOUNT_ID AS opp_account_id,
        NULL AS opp_employee_id,
        OPPORTUNITY.ID AS Source_id,
        OPPORTUNITY.AMOUNT AS opp_amount,
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
        OPPORTUNITY_STAGE.id AS opp_stage_id,
        OPPORTUNITY_STAGE.MASTER_LABEL AS opp_stage_name,
        NULL AS lead_lost_reason,
        OPPORTUNITY.CAMPAIGN_ID AS campaign_id,
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
        OPPORTUNITY. OWNER_ID AS OWNER_ID,
        NULL AS DW_CURR_FLG,
        NULL AS EFFCT_START_DATE,
        NULL AS EFFCT_END_DATE,
        'D_OPPORTUNITY_DIM_LOAD'  AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS 
      FROM
        OPPORTUNITY 
        left join contact on OPPORTUNITY.Owner_id  =  contact.Owner_id
        left join OPPORTUNITY_LINE_ITEM on OPPORTUNITY.ID = OPPORTUNITY_LINE_ITEM.OPPORTUNITY_ID
        left join OPPORTUNITY_STAGE on OPPORTUNITY.stage_name = OPPORTUNITY_STAGE.MASTER_LABEL

    )    
    


select * from renamed
  );
