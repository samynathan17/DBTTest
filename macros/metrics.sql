{% macro run_metrics(clause, metric_id, metric_catagory_id) -%}

with opportunity AS(
    SELECT * FROM {{ ref('stg_sf_opportunity') }}
    Where {{ clause }}
),date_range as 
(
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="to_date('01/01/2017', 'dd/mm/yyyy')",
        end_date="dateadd(year, 2, current_date)"
       )
    }}
),
 timeframe as (
  select * from {{ ref('stg_sf_timeframe') }} 
  join date_range 
  on TimeFrameID = date_range.date_day
  ),Metrics_Calc AS(
    SELECT
        TimeFrameID AS Report_Dt,
        opportunity.opp_entity_id  AS entity_id,
        opportunity.OPP_EMPLOYEE_ID AS employee_id,
        cast('{{ metric_id }}' as number) as METRIC_ID,
        cast( '{{ metric_catagory_id }}' as number)  AS METRIC_CATEGORY_ID,
        'D' as TimeFrame_Type,
        sum(opportunity.OPP_AMOUNT) as AMOUNT,
        count(*) as COUNT,
        sum(opportunity.OPP_AMOUNT)/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        {{ dbt_utils.current_timestamp() }} AS DW_INS_UPD_DTS
     from opportunity 
        join timeframe 
        on cast( OPP_INITIAL_CREATE_DT as date) between timeframe.DAY_START and timeframe.DAY_END
        and cast( OPP_INITIAL_CREATE_DT as date) <= TimeFrameID 
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
        TimeFrameID AS Report_Dt,
        opportunity.opp_entity_id  AS entity_id,
        opportunity.OPP_EMPLOYEE_ID AS employee_id,
        cast('{{ metric_id }}' as number) as METRIC_ID,
        cast( '{{ metric_catagory_id }}' as number)  AS METRIC_CATEGORY_ID,
        'W' as TimeFrame_Type,
        sum(opportunity.OPP_AMOUNT) as AMOUNT,
        count(*) as COUNT,
        sum(opportunity.OPP_AMOUNT)/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        {{ dbt_utils.current_timestamp() }} AS DW_INS_UPD_DTS
     from opportunity 
        join timeframe 
        on cast( OPP_INITIAL_CREATE_DT as date) between timeframe.WEEK_START and timeframe.WEEK_END 
        and cast( OPP_INITIAL_CREATE_DT as date) <= TimeFrameID
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
        TimeFrameID AS Report_Dt,
        opportunity.opp_entity_id  AS entity_id,
        opportunity.OPP_EMPLOYEE_ID AS employee_id,
        cast('{{ metric_id }}' as number) as METRIC_ID,
        cast( '{{ metric_catagory_id }}' as number)  AS METRIC_CATEGORY_ID,
        'M' as TimeFrame_Type,
        sum(opportunity.OPP_AMOUNT) as AMOUNT,
        count(*) as COUNT,
        sum(opportunity.OPP_AMOUNT)/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        {{ dbt_utils.current_timestamp() }} AS DW_INS_UPD_DTS
     from opportunity 
        join timeframe 
        on cast( OPP_INITIAL_CREATE_DT as date) between timeframe.MONTH_START and timeframe.MONTH_END
        and cast( OPP_INITIAL_CREATE_DT as date) <= TimeFrameID
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
        TimeFrameID AS Report_Dt,
        opportunity.opp_entity_id  AS entity_id,
        opportunity.OPP_EMPLOYEE_ID AS employee_id,
        cast('{{ metric_id }}' as number) as METRIC_ID,
        cast( '{{ metric_catagory_id }}' as number)  AS METRIC_CATEGORY_ID,
        'Q' as TimeFrame_Type,
        sum(opportunity.OPP_AMOUNT) as AMOUNT,
        count(*) as COUNT,
        sum(opportunity.OPP_AMOUNT)/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        {{ dbt_utils.current_timestamp() }} AS DW_INS_UPD_DTS
     from opportunity 
        join timeframe 
        on cast( OPP_INITIAL_CREATE_DT as date) between timeframe.QUARTER_START and timeframe.QUARTER_END
        and cast( OPP_INITIAL_CREATE_DT as date) <= TimeFrameID
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
        TimeFrameID  AS Report_Dt,
        opportunity.opp_entity_id  AS entity_id,
        opportunity.OPP_EMPLOYEE_ID AS employee_id,
        cast('{{ metric_id }}' as number) as METRIC_ID,
        cast( '{{ metric_catagory_id }}' as number)  AS METRIC_CATEGORY_ID,
        'Y' as TimeFrame_Type,
        sum(opportunity.OPP_AMOUNT) as AMOUNT,
        count(*) as COUNT,
        sum(opportunity.OPP_AMOUNT)/decode(count(*),0,1,count(*)) as average,      
        'D_SALES_FACT_LOAD' AS DW_SESSION_NM,
        {{ dbt_utils.current_timestamp() }} AS DW_INS_UPD_DTS
     from opportunity 
        join timeframe 
        on cast( OPP_INITIAL_CREATE_DT as date) between timeframe.YEAR_START and timeframe.YEAR_END
        and cast( OPP_INITIAL_CREATE_DT as date) <= TimeFrameID
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
where employee_id = '0050g000005ep9OAAQ'
order by Report_Dt
{%- endmacro %}