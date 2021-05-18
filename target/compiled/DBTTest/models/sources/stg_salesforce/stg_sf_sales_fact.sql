with timeframe as (
  select *  from DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_timeframe 
  where TimeFrameID = current_date
),oppo_snap AS(
    SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_opportunity
    Where IS_WON = 'TRUE'
),Metrics_Calc AS(
    SELECT
        current_date AS Report_Dt,
        oppo_snap.OPP_ACCOUNT_ID  AS account_id,
        oppo_snap.OPP_EMPLOYEE_ID AS employee_id,
        '1' as METRIC_ID,
        'Productivity'  AS METRIC_CATEGORY,
        'D' as TimeFrame_Type,
        sum(oppo_snap.AMOUNT) as AMOUNT,
        count(*) as COUNT,
        sum(oppo_snap.AMOUNT)/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from oppo_snap 
        left join timeframe 
        on nvl(oppo_snap.last_modified_date,oppo_snap.created_date) between timeframe.DAY_START and timeframe.DAY_END
        group by
        Report_Dt,
        account_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY,
        TimeFrame_Type,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date AS Report_Dt,
        oppo_snap.ACCOUNT_ID  AS account_id,
        oppo_snap.OWNER_ID AS employee_id,
        '1' as METRIC_ID,
        'Productivity'  AS METRIC_CATEGORY,
        'W' as TimeFrame_Type,
        sum(oppo_snap.AMOUNT) as AMOUNT,
        count(*) as COUNT,
        sum(oppo_snap.AMOUNT)/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from oppo_snap 
        left join timeframe 
        on nvl(oppo_snap.last_modified_date,oppo_snap.created_date) between timeframe.WEEK_START and timeframe.WEEK_END
        group by
        Report_Dt,
        account_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY,
        TimeFrame_Type,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date AS Report_Dt,
        oppo_snap.ACCOUNT_ID  AS account_id,
        oppo_snap.OWNER_ID AS employee_id,
        '1' as METRIC_ID,
        'Productivity'  AS METRIC_CATEGORY,
        'M' as TimeFrame_Type,
        sum(oppo_snap.AMOUNT) as AMOUNT,
        count(*) as COUNT,
        sum(oppo_snap.AMOUNT)/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from oppo_snap 
        left join timeframe 
        on nvl(oppo_snap.last_modified_date,oppo_snap.created_date) between timeframe.MONTH_START and timeframe.MONTH_END
        group by
        Report_Dt,
        account_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY,
        TimeFrame_Type,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date AS Report_Dt,
        oppo_snap.ACCOUNT_ID  AS account_id,
        oppo_snap.OWNER_ID AS employee_id,
        '1' as METRIC_ID,
        'Productivity'  AS METRIC_CATEGORY,
        'Q' as TimeFrame_Type,
        sum(oppo_snap.AMOUNT) as AMOUNT,
        count(*) as COUNT,
        sum(oppo_snap.AMOUNT)/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from oppo_snap 
        left join timeframe 
        on nvl(oppo_snap.last_modified_date,oppo_snap.created_date) between timeframe.QUARTER_START and timeframe.QUARTER_END
        group by
        Report_Dt,
        account_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY,
        TimeFrame_Type,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date  AS Report_Dt,
        oppo_snap.ACCOUNT_ID  AS account_id,
        oppo_snap.OWNER_ID AS employee_id,
        '1' as METRIC_ID,
        'Productivity'  AS METRIC_CATEGORY,
        'Y' as TimeFrame_Type,
        sum(oppo_snap.AMOUNT) as AMOUNT,
        count(*) as COUNT,
        sum(oppo_snap.AMOUNT)/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from oppo_snap 
        left join timeframe 
        on nvl(oppo_snap.last_modified_date,oppo_snap.created_date) between timeframe.YEAR_START and timeframe.YEAR_END
        group by
        Report_Dt,
        account_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY,
        TimeFrame_Type,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
 )
SELECT * from Metrics_Calc