
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_staging.demo  as (
    with timeframe as (
  select *  from DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_timeframe 
  where TimeFrameID = current_date
),oppo_snap AS(
    select *  from snapshots.OPPORTUNITY_SNAPSHOT_CHECK 
    Where upper(STAGE_NAME) = 'CLOSED WON'
),Metrics1 AS(
    SELECT
        current_date AS Report_Dt,
        oppo_snap.ACCOUNT_ID  AS account_id,
        oppo_snap.OWNER_ID AS employee_id,
        '1' as METRIC_ID,
        'Productivity'  AS METRIC_CATEGORY,
        'D' as TimeFrame_Type,
        oppo_snap.AMOUNT as AMOUNT,
        count(*) as COUNT,
        oppo_snap.AMOUNT/decode(count(*),0,1,count(*)) as average,      
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
        AMOUNT,
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
        oppo_snap.AMOUNT as AMOUNT,
        count(*) as COUNT,
        oppo_snap.AMOUNT/decode(count(*),0,1,count(*)) as average,      
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
        AMOUNT,
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
        oppo_snap.AMOUNT as AMOUNT,
        count(*) as COUNT,
        oppo_snap.AMOUNT/decode(count(*),0,1,count(*)) as average,      
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
        AMOUNT,
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
        oppo_snap.AMOUNT as AMOUNT,
        count(*) as COUNT,
        oppo_snap.AMOUNT/decode(count(*),0,1,count(*)) as average,      
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
        AMOUNT,
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
        oppo_snap.AMOUNT as AMOUNT,
        count(*) as COUNT,
        oppo_snap.AMOUNT/decode(count(*),0,1,count(*)) as average,      
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
        AMOUNT,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
 ),
 oppo_snap1 AS(
    select *  from snapshots.OPPORTUNITY_SNAPSHOT_CHECK 
    Where upper(STAGE_NAME) = 'CLOSED LOST'
),
Metrics2 AS(
    SELECT
        current_date AS Report_Dt,
        oppo_snap1.ACCOUNT_ID  AS account_id,
        oppo_snap1.OWNER_ID AS employee_id,
        '1' as METRIC_ID,
        'Productivity'  AS METRIC_CATEGORY,
        'D' as TimeFrame_Type,
        oppo_snap1.AMOUNT as AMOUNT,
        count(*) as COUNT,
        oppo_snap1.AMOUNT/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from oppo_snap1 
        left join timeframe 
        on nvl(oppo_snap1.last_modified_date,oppo_snap1.created_date) between timeframe.DAY_START and timeframe.DAY_END
        group by
        Report_Dt,
        account_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY,
        TimeFrame_Type,
        AMOUNT,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date AS Report_Dt,
        oppo_snap1.ACCOUNT_ID  AS account_id,
        oppo_snap1.OWNER_ID AS employee_id,
        '1' as METRIC_ID,
        'Productivity'  AS METRIC_CATEGORY,
        'W' as TimeFrame_Type,
        oppo_snap1.AMOUNT as AMOUNT,
        count(*) as COUNT,
        oppo_snap1.AMOUNT/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from oppo_snap1 
        left join timeframe 
        on nvl(oppo_snap1.last_modified_date,oppo_snap1.created_date) between timeframe.WEEK_START and timeframe.WEEK_END
        group by
        Report_Dt,
        account_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY,
        TimeFrame_Type,
        AMOUNT,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date AS Report_Dt,
        oppo_snap1.ACCOUNT_ID  AS account_id,
        oppo_snap1.OWNER_ID AS employee_id,
        '1' as METRIC_ID,
        'Productivity'  AS METRIC_CATEGORY,
        'M' as TimeFrame_Type,
        oppo_snap1.AMOUNT as AMOUNT,
        count(*) as COUNT,
        oppo_snap1.AMOUNT/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from oppo_snap1 
        left join timeframe 
        on nvl(oppo_snap1.last_modified_date,oppo_snap1.created_date) between timeframe.MONTH_START and timeframe.MONTH_END
        group by
        Report_Dt,
        account_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY,
        TimeFrame_Type,
        AMOUNT,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date AS Report_Dt,
        oppo_snap1.ACCOUNT_ID  AS account_id,
        oppo_snap1.OWNER_ID AS employee_id,
        '1' as METRIC_ID,
        'Productivity'  AS METRIC_CATEGORY,
        'Q' as TimeFrame_Type,
        oppo_snap1.AMOUNT as AMOUNT,
        count(*) as COUNT,
        oppo_snap1.AMOUNT/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from oppo_snap1 
        left join timeframe 
        on nvl(oppo_snap1.last_modified_date,oppo_snap1.created_date) between timeframe.QUARTER_START and timeframe.QUARTER_END
        group by
        Report_Dt,
        account_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY,
        TimeFrame_Type,
        AMOUNT,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date  AS Report_Dt,
        oppo_snap1.ACCOUNT_ID  AS account_id,
        oppo_snap1.OWNER_ID AS employee_id,
        '1' as METRIC_ID,
        'Productivity'  AS METRIC_CATEGORY,
        'Y' as TimeFrame_Type,
        oppo_snap1.AMOUNT as AMOUNT,
        count(*) as COUNT,
        oppo_snap1.AMOUNT/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from oppo_snap1 
        left join timeframe 
        on nvl(oppo_snap1.last_modified_date,oppo_snap1.created_date) between timeframe.YEAR_START and timeframe.YEAR_END
        group by
        Report_Dt,
        account_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY,
        TimeFrame_Type,
        AMOUNT,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
 ),
Metrics_Calc as (
    Select * from Metrics1
    Union
    Select * from Metrics2
)
SELECT * from Metrics_Calc
  );
