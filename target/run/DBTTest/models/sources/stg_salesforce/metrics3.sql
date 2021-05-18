
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_staging.metrics3  as (
    with date_range as 
(
    

/*
call as follows:

date_spine(
    "day",
    "to_date('01/01/2016', 'mm/dd/yyyy')",
    "dateadd(week, 1, current_date)"
)

*/

with rawdata as (

    

    

    with p as (
        select 0 as generated_number union all select 1
    ), unioned as (

    select

    
    p0.generated_number * pow(2, 0)
     + 
    
    p1.generated_number * pow(2, 1)
     + 
    
    p2.generated_number * pow(2, 2)
     + 
    
    p3.generated_number * pow(2, 3)
     + 
    
    p4.generated_number * pow(2, 4)
     + 
    
    p5.generated_number * pow(2, 5)
     + 
    
    p6.generated_number * pow(2, 6)
     + 
    
    p7.generated_number * pow(2, 7)
     + 
    
    p8.generated_number * pow(2, 8)
     + 
    
    p9.generated_number * pow(2, 9)
     + 
    
    p10.generated_number * pow(2, 10)
     + 
    
    p11.generated_number * pow(2, 11)
    
    
    + 1
    as generated_number

    from

    
    p as p0
     cross join 
    
    p as p1
     cross join 
    
    p as p2
     cross join 
    
    p as p3
     cross join 
    
    p as p4
     cross join 
    
    p as p5
     cross join 
    
    p as p6
     cross join 
    
    p as p7
     cross join 
    
    p as p8
     cross join 
    
    p as p9
     cross join 
    
    p as p10
     cross join 
    
    p as p11
    
    

    )

    select *
    from unioned
    where generated_number <= 2183
    order by generated_number



),

all_periods as (

    select (
        
  

    dateadd(
        day,
        row_number() over (order by 1) - 1,
        to_date('01/01/2017', 'dd/mm/yyyy')
        )



    ) as date_day
    from rawdata

),

filtered as (

    select *
    from all_periods
    where date_day <= dateadd(year, 2, current_date)

)

select * from filtered


),
 timeframe as (
  select * from DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_timeframe 
  join date_range 
  on TimeFrameID = date_range.date_day
),lead AS(
    SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_lead
    Where upper(lead_to_opp_flag) = 'TRUE'
),Metrics_Calc AS(
    SELECT
        current_date AS Report_Dt,
        lead.entity_id  AS entity_id,
        lead.EMPLOYEE_ID AS employee_id,
        '3' as METRIC_ID,
        '4'  AS METRIC_CATEGORY_ID,
        'D' as TimeFrame_Type,
        null as AMOUNT,
        count(*) as COUNT,
        null as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from lead 
        join timeframe 
        on cast( LEAD_CREATED_DATE as date) between timeframe.DAY_START and timeframe.DAY_END
        join date_range
        on TimeFrameID = date_range.date_day
        group by
        Report_Dt,
        entity_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY_ID,
        TimeFrame_Type,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date AS Report_Dt,
        lead.entity_id  AS entity_id,
        lead.EMPLOYEE_ID AS employee_id,
        '3' as METRIC_ID,
        '4'  AS METRIC_CATEGORY_ID,
        'W' as TimeFrame_Type,
        null as AMOUNT,
        count(*) as COUNT,
        null as average,     
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from lead 
        join timeframe 
        on cast( LEAD_CREATED_DATE as date) between timeframe.WEEK_START and timeframe.WEEK_END
        and cast( LEAD_CREATED_DATE as date) <= TimeFrameID
        join date_range
        on TimeFrameID = date_range.date_day
        group by
        Report_Dt,
        entity_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY_ID,
        TimeFrame_Type,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date AS Report_Dt,
        lead.entity_id  AS entity_id,
        lead.EMPLOYEE_ID AS employee_id,
        '3' as METRIC_ID,
        '4'  AS METRIC_CATEGORY_ID,
        'M' as TimeFrame_Type,
        null as AMOUNT,
        count(*) as COUNT,
        null as average,       
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from lead 
        join timeframe 
        on cast( LEAD_CREATED_DATE as date) between timeframe.MONTH_START and timeframe.MONTH_END
        and cast( LEAD_CREATED_DATE as date) <= TimeFrameID
        join date_range
        on TimeFrameID = date_range.date_day
        group by
        Report_Dt,
        entity_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY_ID,
        TimeFrame_Type,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date AS Report_Dt,
        lead.entity_id  AS entity_id,
        lead.EMPLOYEE_ID AS employee_id,
        '3' as METRIC_ID,
        '4'  AS METRIC_CATEGORY_ID,
        'Q' as TimeFrame_Type,
        null as AMOUNT,
        count(*) as COUNT,
        null as average,     
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from lead 
        join timeframe 
        on cast( LEAD_CREATED_DATE as date) between timeframe.QUARTER_START and timeframe.QUARTER_END
        and cast( LEAD_CREATED_DATE as date) <= TimeFrameID
        join date_range
        on TimeFrameID = date_range.date_day
        group by
        Report_Dt,
        entity_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY_ID,
        TimeFrame_Type,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
     Union
        SELECT
        current_date  AS Report_Dt,
        lead.entity_id  AS entity_id,
        lead.EMPLOYEE_ID AS employee_id,
        '3' as METRIC_ID,
        '4'  AS METRIC_CATEGORY_ID,
        'Y' as TimeFrame_Type,
        null as AMOUNT,
        count(*) as COUNT,
        null as average,     
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
     from lead 
        join timeframe 
        on cast( LEAD_CREATED_DATE as date) between timeframe.YEAR_START and timeframe.YEAR_END
        and cast( LEAD_CREATED_DATE as date) <= TimeFrameID
        join date_range
        on TimeFrameID = date_range.date_day
        group by
        Report_Dt,
        entity_id,
        employee_id,
        METRIC_ID,
        METRIC_CATEGORY_ID,
        TimeFrame_Type,
        DW_SESSION_NM,
        DW_INS_UPD_DTS
 )
SELECT * from Metrics_Calc
  );
