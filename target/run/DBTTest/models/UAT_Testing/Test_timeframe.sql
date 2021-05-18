

      create or replace transient table DATAFLOTEST_DATABASE.dbt_test_UAT_Testing.Test_timeframe  as
      (With timeframe AS (
  select TIMEFRAMEID,SOURCE_TYPE,year,week_start as start_date,week_end as end_date,'Week' as type,WEEK_NUM,MONTH_NAME,QUTR_NUMBER,WEEK_NUM as timeframe_type  from DBT_SALESDATAFLO.DIM_TIMEFRAME where UPPER(weekend_flag)='TRUE'
  union 
  select TIMEFRAMEID,SOURCE_TYPE,year,month_start as start_date,month_end as end_date,'Month' as type,WEEK_NUM,MONTH_NAME,QUTR_NUMBER,MONTH_NAME as timeframe_type from DBT_SALESDATAFLO.DIM_TIMEFRAME where UPPER(monthend_flag)='TRUE'
  union 
  select TIMEFRAMEID,SOURCE_TYPE,year,QUARTER_START as start_date,QUARTER_END as end_date,'Quarter' as type,WEEK_NUM,MONTH_NAME,QUTR_NUMBER,QUTR_NUMBER as timeframe_type  from DBT_SALESDATAFLO.DIM_TIMEFRAME where UPPER(QUARTEREND_FLAG)='TRUE'
  union 
  select TIMEFRAMEID,SOURCE_TYPE,year,YEAR_START as start_date,YEAR_END as end_date,'Year' as type,WEEK_NUM,MONTH_NAME,QUTR_NUMBER, cast(year as varchar(10)) as timeframe_type  from DBT_SALESDATAFLO.DIM_TIMEFRAME where UPPER(YEAREND_FLAG)='TRUE'
  
  ),r_metric AS (
    select 
            count(source_id) as r_count,
            sum(OPPORTUNITY.AMOUNT) AS r_amount,
            1 AS r_metric_id,
            OPPORTUNITY.Source_type as r_Source_type, 
            timeframe.type as r_type,
            timeframe_type as r_timeframe_type,
            WEEK_NUM as r_week_num,MONTH_NAME as r_month_name,QUTR_NUMBER as r_qutr_num,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Opportunity as OPPORTUNITY,timeframe --inner join timeframe on to_date(OPPORTUNITY.CREATED_DATE) = timeframe.TIMEFRAMEID
        where OPPORTUNITY.IS_WON='true'
         and OPPORTUNITY.IS_CLOSED='true'
         and timeframe_type is not null
         and to_date(close_date) between timeframe.start_date and timeframe.end_date
         --and to_date(close_date) between '2017-01-01' and '2021-03-31'
        group by 4,5,6,7,8,9,10
 ),fs AS(
    select sum(count) as f_count,
            sum(AMOUNT) AS f_amount,
            metric_id AS f_metric_id,
            ENTITY_ID as f_entity_id, 
            TIMEFRAME_TYPE as f_timeframe_type,
            cast(tmf.year as varchar(1000)) as f_types_timeframe,
            tmf.year as f_year
          from DBT_SALESDATAFLO.FACT_SALES as sf,DBT_SALESDATAFLO.DIM_TIMEFRAME  tmf  
    where 
        TIMEFRAME_TYPE='Y'
        and sf.entity_id = tmf.source_type
        and REPORT_DATE=tmf.year_end
        and Yearend_flag='TRUE'
    group by 3,4,5,6,7

 ), compare_result AS(
    select 
    r_count,
    f_count,
    r_amount,
    f_amount,
    r_metric_id,
    f_metric_id,
    r_Source_type,
    f_entity_id,
    r_type,
    f_timeframe_type,
    r_timeframe_type,
    f_types_timeframe,
    r_year,
    f_year,
    CASE
            WHEN r_count <> f_count THEN 'YES'
            WHEN r_amount <> f_amount THEN 'YES'
            WHEN r_metric_id <> f_metric_id THEN 'YES'
            WHEN r_Source_type <> f_entity_id THEN 'YES'
            WHEN case when r_type='Year' then 'Y' else null end <> f_timeframe_type THEN 'YES'
            WHEN case when r_type='Month' then 'M' else null end <> f_timeframe_type THEN 'YES'
            WHEN case when r_type='Quarter' then 'Q' else null end <> f_timeframe_type THEN 'YES' --Month,Year,Quarter,Week
            WHEN r_timeframe_type <> f_types_timeframe THEN 'YES'
            WHEN r_year <> f_year THEN 'YES'
            ELSE 'NO'
            END as value_mismatch

    from fs inner join r_metric on fs.f_metric_id=r_metric.r_metric_id where fs.f_metric_id=r_metric.r_metric_id
    --and case when r_type='Year' then cast('Y' as varchar(100)) else null end = cast(f_timeframe_type as varchar(1000)) ='Y'
    and SUBSTRING(CAST(r_type AS varchar(100)),1,1) = f_timeframe_type
    and TRIM(r_timeframe_type)= TRIM(f_types_timeframe)
    and r_year=f_year
    and r_Source_type=f_entity_id


)

select * from compare_result where f_timeframe_type='Y' and f_metric_id=1  and f_entity_id='SF_RKLIVE_06012021'
      );
    