WITH PERIOD AS(
     Select TYPE,start_date,end_date,
            CASE
             WHEN TYPE='Year' OR TYPE='Quarter' or TYPE='Month' THEN cast (split(FULLY_QUALIFIED_LABEL,'FY ')[1] as varchar(1100)) 
            ELSE NULL end as year ,
        CASE
             WHEN TYPE='Year' THEN cast (split(FULLY_QUALIFIED_LABEL,'FY ')[1] as varchar(1100)) 
            ELSE NULL end as timeframe_type from SF_RKLIVE_06012021.PERIOD
       union
        Select TYPE,start_date,end_date,
        CASE
             WHEN TYPE='Year' OR TYPE='Quarter' or TYPE='Month' THEN cast (split(FULLY_QUALIFIED_LABEL,'FY ')[1] as varchar(1100)) 
            ELSE NULL end as year ,
        CASE
           WHEN TYPE='Month' THEN UPPER(LTRIM(RTRIM(REPLACE(split(FULLY_QUALIFIED_LABEL,'FY ')[0],'"', '')))) ELSE NULL END as timeframe_type from SF_RKLIVE_06012021.PERIOD
        union
        Select TYPE,start_date,end_date,
        CASE
             WHEN TYPE='Year' OR TYPE='Quarter' or TYPE='Month' THEN cast (split(FULLY_QUALIFIED_LABEL,'FY ')[1] as varchar(1100)) 
            ELSE NULL end as year ,
        CASE
             WHEN TYPE='Quarter'  THEN UPPER(LTRIM(RTRIM(CAST(SUBSTRING(FULLY_QUALIFIED_LABEL, 2, 3) AS varchar(100))))) ELSE NULL END as timeframe_type from SF_RKLIVE_06012021.PERIOD
        
),calendar AS(
      select CLDR_DATE, CLDR_YEAR_START_DT as start_date,CLDR_YEAR_END_DT as end_date,year,'Year' as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,cast(year as varchar(1000)) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR 
     union
     select CLDR_DATE, CLDR_MNTH_STRT_DT as start_date,CLDR_MNTH_END_DT as end_date,year,'Month' as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,UPPER(MONTH_NAME) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR
    union
     select CLDR_DATE,WEEK_START_DATE as start_date,WEEK_END_DATE as end_date,year,'Week'as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,CONCAT('W',cast(CLDR_WEEK_NUM as varchar(1000))) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR
     union
     select CLDR_DATE,CLDR_QTR_STRT_DT as start_date,CLDR_QTR_END_DT as end_date,year,'Quarter' as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,UPPER(CLDR_QTR) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR

),r_metric AS (
    --- SF  oppor_won-1
       select 
            count(source_id) as r_count,
            sum(OPPORTUNITY.AMOUNT) AS r_amount,
            1 AS r_metric_id,
            Source_type as r_Source_type, 
            PERIOD.TYPE as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Opportunity as OPPORTUNITY,PERIOD  
        where OPPORTUNITY.IS_WON='true'
         and OPPORTUNITY.IS_CLOSED='true'
         and timeframe_type is not null
         and to_date(close_date) between PERIOD.start_date and PERIOD.end_date
         --and to_date(close_date) between '2017-01-01' and '2021-03-31'
        group by 4,5,6,7

         union   --Oppor loss -10
        select 
            count(source_id) as r_count,
            sum(OPPORTUNITY.AMOUNT) AS r_amount,
            10 AS r_metric_id,
            Source_type as r_Source_type, 
            PERIOD.TYPE as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Opportunity as OPPORTUNITY,PERIOD  
        where OPPORTUNITY.IS_WON='false'
         and OPPORTUNITY.IS_CLOSED='true'
         and timeframe_type is not null
         and to_date(close_date) between PERIOD.start_date and PERIOD.end_date
        group by 4,5,6,7

        union --converted_leads-3
        select 
            count(source_id) as r_count,
            0 AS r_amount,
            3 AS r_metric_id,
            Source_type as r_Source_type, 
            PERIOD.TYPE as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Lead,PERIOD  
        where UPPER(IS_CONVERTED) = 'TRUE'
         and timeframe_type is not null
         and to_date(CONVERTED_DATE) between PERIOD.start_date and PERIOD.end_date
        group by 4,5,6,7

       union --new leads -4
        select 
            count(source_id) as r_count,
            0 AS r_amount,
            4 AS r_metric_id,
            Source_type as r_Source_type, 
            PERIOD.TYPE as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Lead,PERIOD  
        where UPPER(IS_CONVERTED) = 'FALSE'
         and upper(status)='NEW'
         and timeframe_type is not null
         and to_date(CREATED_DATE) between PERIOD.start_date and PERIOD.end_date
        group by 4,5,6,7

        union --accounts -27
        select 
            count(source_id) as r_count,
            0 AS r_amount,
            27 AS r_metric_id,
            Source_type as r_Source_type, 
            PERIOD.TYPE as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Account,PERIOD  
        where 1=1
         and timeframe_type is not null
         and to_date(CREATED_DATE) between PERIOD.start_date and PERIOD.end_date
        group by 4,5,6,7

        union --contact -29
        select 
            count(source_id) as r_count,
            0 AS r_amount,
            29 AS r_metric_id,
            Source_type as r_Source_type, 
            PERIOD.TYPE as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Contact,PERIOD  
        where 1=1
         and timeframe_type is not null
         and to_date(CREATED_DATE) between PERIOD.start_date and PERIOD.end_date
        group by 4,5,6,7

       --HS
        union   --deal won -1 PROPERTY_HS_CREATEDATE
        select
           
            count(Source_DEAL_ID) as r_count,
            COALESCE(sum(PROPERTY_AMOUNT),0) AS r_amount,
            1 AS r_metric_id,
            Source_type as r_Source_type,
            type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year 
        from DBT_SALESDATAFLO.Stg_Deal deal inner join calendar on deal.PROPERTY_CLOSEDATE=CLDR_DATE
         where Upper(DEAL_PIPELINE_STAGE_ID) like '%CLOSED%WON%' 
         and PROPERTY_HS_IS_CLOSED='true'
         and timeframe_type is not null
         and to_date(PROPERTY_CLOSEDATE) between calendar.start_date and calendar.end_date 
         group by 4,5,6,7
       
        union   -- Deal Los -10
        select
           
            COALESCE(count(Source_DEAL_ID),0) as r_count,
            COALESCE(sum(PROPERTY_AMOUNT),0) AS r_amount,
            10 AS r_metric_id,
            Source_type as r_Source_type,
            type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Deal deal  inner join calendar on deal.PROPERTY_CLOSEDATE=CLDR_DATE
         where Upper(DEAL_PIPELINE_STAGE_ID) like '%CLOSED%LOS%' 
         and PROPERTY_HS_IS_CLOSED='true'
         and timeframe_type is not null
         and to_date(PROPERTY_CLOSEDATE) between calendar.start_date and calendar.end_date 
         group by 4,5,6,7

      union -- calls -39
        select
           
            count(Source_ID) as r_count,
            0 AS r_amount,
            39 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Engagement eng inner join calendar on to_date(CREATED_AT)=CLDR_DATE
         where Upper(eng.TYPE) ='CALL'
         and timeframe_type is not null
         and to_date(CREATED_AT) between calendar.start_date and calendar.end_date 
         group by 4,5,6,7

    union -- Task completed -89
        select
           
            count(Source_ID) as r_count,
            0 AS r_amount,
            89 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Engagement eng inner join calendar on to_date(CREATED_AT)=CLDR_DATE
         where Upper(eng.TYPE) ='TASK'
         and timeframe_type is not null
         and to_date(CREATED_AT) between calendar.start_date and calendar.end_date 
         group by 4,5,6,7     

    union -- (Marketing MEETING) -71
        select
           
            count(Source_ID) as r_count,
            0 AS r_amount,
            71 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Engagement eng inner join calendar on to_date(CREATED_AT)=CLDR_DATE
         where Upper(eng.TYPE) ='MEETING'
         and timeframe_type is not null
         and to_date(CREATED_AT) between calendar.start_date and calendar.end_date 
         group by 4,5,6,7      

    union -- (Notes) -76
        select
           
            count(Source_ID) as r_count,
            0 AS r_amount,
            76 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Engagement eng inner join calendar on to_date(CREATED_AT)=CLDR_DATE
         where Upper(eng.TYPE) ='NOTE'
         and timeframe_type is not null
         and to_date(CREATED_AT) between calendar.start_date and calendar.end_date 
         group by 4,5,6,7       

    union -- (Emails Logged) -66
        select
           
            count(Source_ID) as r_count,
            0 AS r_amount,
            66 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Engagement eng inner join calendar on to_date(CREATED_AT)=CLDR_DATE
         where Upper(eng.TYPE) ='EMAIL'
         and timeframe_type is not null
         and to_date(CREATED_AT) between calendar.start_date and calendar.end_date 
         group by 4,5,6,7            








),fs AS(
    select sum(count) as f_count,
    sum(amount)as f_amount,cast(entity_id as varchar(1000)) as f_entity_id ,metric_id as f_metric_id,tmf.year as f_year,timeframe_type as f_timeframe_type,
    cast(tmf.year as varchar(1000)) as f_types_timeframe from DBT_SALESDATAFLO.FACT_SALES as sf,DBT_SALESDATAFLO.DIM_TIMEFRAME tmf
    where 
        TIMEFRAME_TYPE='Y'
        and sf.entity_id = tmf.source_type
        and REPORT_DATE=tmf.year_end
        and Yearend_flag='TRUE'
    group by 3,4,5,6,7
 union
    select sum(count) as f_count,sum(amount)as f_amount,entity_id as f_entity_id ,metric_id as f_metric_id,tmf.year as f_year,timeframe_type as f_timeframe_type,
    UPPER(MONTH_NAME) as f_types_timeframe from DBT_SALESDATAFLO.FACT_SALES as sf,DBT_SALESDATAFLO.DIM_TIMEFRAME  tmf
    where 
        TIMEFRAME_TYPE='M'
        and sf.entity_id = tmf.source_type
        and REPORT_DATE=tmf.MONTH_END
        and MONTHEND_FLAG='TRUE'
    group by 3,4,5,6,7

  union 
  
    select sum(count) as f_count,sum(amount)as f_amount,entity_id as f_entity_id ,metric_id as f_metric_id,tmf.year as f_year,timeframe_type as f_timeframe_type,tmf.QUTR_NUMBER as f_types_timeframe from DBT_SALESDATAFLO.FACT_SALES as sf,DBT_SALESDATAFLO.DIM_TIMEFRAME  tmf
    where 
        TIMEFRAME_TYPE='Q'
        and sf.entity_id = tmf.source_type
        and REPORT_DATE=tmf.QUARTER_END
        and QUARTEREND_FLAG='TRUE'
    group by 3,4,5,6,7

  union 
  
    select sum(count) as f_count,sum(amount)as f_amount,entity_id as f_entity_id ,metric_id as f_metric_id,tmf.year as f_year,timeframe_type as f_timeframe_type,tmf.WEEK_NUM as f_types_timeframe from DBT_SALESDATAFLO.FACT_SALES as sf,DBT_SALESDATAFLO.DIM_TIMEFRAME  tmf
    where 
        TIMEFRAME_TYPE='W'
        and sf.entity_id = tmf.source_type
        and REPORT_DATE=tmf.WEEK_END
        and WEEKEND_FLAG='TRUE'
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
            WHEN case when r_type='Quarter' then 'Q' else null end <> f_timeframe_type THEN 'YES'
            WHEN case when r_type='Week' then 'W' else null end <> f_timeframe_type THEN 'YES' --Month,Year,Quarter,Week
            WHEN r_timeframe_type <> f_types_timeframe THEN 'YES'
            WHEN r_year <> f_year THEN 'YES'
            ELSE 'NO'
            END as value_mismatch

    from r_metric ,fs where r_metric.r_metric_id=fs.f_metric_id 
    --and case when r_type='Year' then cast('Y' as varchar(100)) else null end = cast(f_timeframe_type as varchar(1000)) ='Y'
    and SUBSTRING(CAST(r_type AS varchar(1100)),1,1) = f_timeframe_type
    and TRIM(r_timeframe_type)= TRIM(f_types_timeframe)
    and r_year=f_year
    and r_Source_type=f_entity_id


)

select * from compare_result  --where 1=1
--r_timeframe_type='W'
--  and r_metric_id=66
--  and r_type='Month'








