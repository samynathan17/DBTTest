
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_staging.metrics12  as (
    with timeframe as (
  select *  from DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_timeframe 
  where TimeFrameID = current_date
),opportunity AS(
    SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_opportunity
    Where upper(OPP_WON) = 'FALSE' and upper(OPP_CLOSED) = 'TRUE'
),Metrics_Calc AS(
    SELECT
        current_date AS Report_Dt,
        opportunity.OPP_entity_id  AS entity_id,
        opportunity.OPP_EMPLOYEE_ID AS employee_id,
        '12' as METRIC_ID,
        '2'  AS METRIC_CATEGORY_ID,
        'D' as TimeFrame_Type,
        opportunity.OPP_EMPLOYEE_ID as Segment_name,
        null as AMOUNT,
        count(*) as COUNT,
        null as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from opportunity 
        join timeframe 
        on cast( OPP_INITIAL_CREATE_DT as date) between timeframe.DAY_START and timeframe.DAY_END
        group by
        Report_Dt,
        entity_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY_ID,
        TimeFrame_Type,
        Segment_name,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date AS Report_Dt,
        opportunity.OPP_entity_id  AS entity_id,
        opportunity.OPP_EMPLOYEE_ID AS employee_id,
        '12'  as METRIC_ID,
        '2'  AS METRIC_CATEGORY_ID,
        'W' as TimeFrame_Type,
         opportunity.OPP_EMPLOYEE_ID as Segment_name,
        null as AMOUNT,
        count(*) as COUNT,
        null as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from opportunity 
        join timeframe 
        on cast( OPP_INITIAL_CREATE_DT as date) between timeframe.WEEK_START and timeframe.WEEK_END
        group by
        Report_Dt,
        entity_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY_ID,
        TimeFrame_Type,
        Segment_name,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date AS Report_Dt,
        opportunity.OPP_entity_id  AS entity_id,
        opportunity.OPP_EMPLOYEE_ID AS employee_id,
        '12'  as METRIC_ID,
        '2'  AS METRIC_CATEGORY_ID,
        'M' as TimeFrame_Type,
        opportunity.OPP_EMPLOYEE_ID as Segment_name,
        null as AMOUNT,
        count(*) as COUNT,
        null as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from opportunity 
        join timeframe 
        on cast( OPP_INITIAL_CREATE_DT as date) between timeframe.MONTH_START and timeframe.MONTH_END
        group by
        Report_Dt,
        entity_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY_ID,
        TimeFrame_Type,
        Segment_name,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date AS Report_Dt,
        opportunity.OPP_entity_id  AS entity_id,
        opportunity.OPP_EMPLOYEE_ID AS employee_id,
        '12'  as METRIC_ID,
        '2'  AS METRIC_CATEGORY_ID,
        'Q' as TimeFrame_Type,
        opportunity.OPP_EMPLOYEE_ID as Segment_name,
        null as AMOUNT,
        count(*) as COUNT,
        null as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from opportunity 
        join timeframe 
        on cast( OPP_INITIAL_CREATE_DT as date) between timeframe.QUARTER_START and timeframe.QUARTER_END
        group by
        Report_Dt,
        entity_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY_ID,
        TimeFrame_Type,
        Segment_name,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date  AS Report_Dt,
        opportunity.OPP_entity_id  AS entity_id,
        opportunity.OPP_EMPLOYEE_ID AS employee_id,
        '12'  as METRIC_ID,
        '2'  AS METRIC_CATEGORY_ID,
        'Y' as TimeFrame_Type,
        opportunity.OPP_EMPLOYEE_ID as Segment_name,
        null as AMOUNT,
        count(*) as COUNT,
        null as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from opportunity 
        join timeframe 
        on cast( OPP_INITIAL_CREATE_DT as date) between timeframe.YEAR_START and timeframe.YEAR_END
        group by
        Report_Dt,
        entity_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY_ID,
        TimeFrame_Type,
        Segment_name,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
 )
SELECT * from Metrics_Calc
  );
