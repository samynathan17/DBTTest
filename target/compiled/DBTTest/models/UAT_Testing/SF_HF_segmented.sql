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
      select CLDR_DATE,CLDR_YEAR_START_DT as start_date,CLDR_YEAR_END_DT as end_date,year,'Year' as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,cast(year as varchar(1000)) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR 
     union
     select CLDR_DATE,CLDR_MNTH_STRT_DT as start_date,CLDR_MNTH_END_DT as end_date,year,'Month' as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,UPPER(MONTH_NAME) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR
    union
     select CLDR_DATE,WEEK_START_DATE as start_date,WEEK_END_DATE as end_date,year,'Week'as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,CONCAT('W',cast(CLDR_WEEK_NUM as varchar(1000))) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR
     union
     select CLDR_DATE,CLDR_QTR_STRT_DT as start_date,CLDR_QTR_END_DT as end_date,year,'Quarter' as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,UPPER(CLDR_QTR) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR

),segr_metric AS (
    --- SF  New Leads by industry 7
       select 
            count(source_id) as r_count,
            0 AS r_amount,
            7 AS r_metric_id,
            INDUSTRY as r_segment_name,
            Source_type as r_Source_type, 
            PERIOD.TYPE as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Lead ,PERIOD  
        where 
         timeframe_type is not null
         and to_date(CREATED_DATE) between PERIOD.start_date and PERIOD.end_date
        group by 4,5,6,7,8

         -- New Leads by Lead Source 18
     union
     select 
            count(source_id) as r_count,
            0 AS r_amount,
            18 AS r_metric_id,
            LEAD_SOURCE as r_segment_name,
            Source_type as r_Source_type, 
            PERIOD.TYPE as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Lead ,PERIOD  
        where 
         timeframe_type is not null
         and to_date(CREATED_DATE) between PERIOD.start_date and PERIOD.end_date
        group by 4,5,6,7,8 

      union    --New Leads by Lead Status 19      
     select 
            count(source_id) as r_count,
            0 AS r_amount,
            19 AS r_metric_id,
            STATUS as r_segment_name,
            Source_type as r_Source_type, 
            PERIOD.TYPE as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Lead ,PERIOD  
        where 
         timeframe_type is not null
         and to_date(CREATED_DATE) between PERIOD.start_date and PERIOD.end_date
        group by 4,5,6,7,8 

      union    --Accounts by Type 28      
     select 
            count(source_id) as r_count,
            0 AS r_amount,
            28 AS r_metric_id,
            acc.TYPE as r_segment_name,
            Source_type as r_Source_type, 
            PERIOD.TYPE as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Account acc ,PERIOD  
        where 
         timeframe_type is not null
         and to_date(CREATED_DATE) between PERIOD.start_date and PERIOD.end_date
        group by 4,5,6,7,8 
       
      union    --Leads by emp_id= 30     
     select 
            count(source_id) as r_count,
            0 AS r_amount,
            30 AS r_metric_id,
            owner_id as r_segment_name,
            Source_type as r_Source_type, 
            PERIOD.TYPE as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Lead ,PERIOD  
        where 
         timeframe_type is not null
         and to_date(CREATED_DATE) between PERIOD.start_date and PERIOD.end_date
        group by 4,5,6,7,8  

      union    --Leads by location= 31   
     select 
            count(source_id) as r_count,
            0 AS r_amount,
            31 AS r_metric_id,
            concat(led.street,' ',led.city,' ',led.state,' ',led.postal_code,' ',led.country) as r_segment_name,
            Source_type as r_Source_type, 
            PERIOD.TYPE as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Lead as led ,PERIOD  
        where 
         timeframe_type is not null
         and to_date(CREATED_DATE) between PERIOD.start_date and PERIOD.end_date
        group by 4,5,6,7,8   
     
      union    --Opportunities by type = 32  
     select 
            count(source_id) as r_count,
            sum(oppo.AMOUNT) AS r_amount,
            32 AS r_metric_id,
            oppo.TYPE as r_segment_name,
            Source_type as r_Source_type, 
            PERIOD.TYPE as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Opportunity as oppo ,PERIOD  
        where 
         timeframe_type is not null
         and to_date(CREATED_DATE) between PERIOD.start_date and PERIOD.end_date
        group by 4,5,6,7,8   
  -- HS
       union    --Deals by Original Source Data= 52 
      select 
            count(deal.Source_deal_id) as r_count,
            COALESCE(sum(PROPERTY_AMOUNT),0) AS r_amount,
            52 AS r_metric_id,
            OPPORTUNITY_STG.Source as r_segment_name,
            deal.Source_type as r_Source_type, 
            calendar.TYPE as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Deal deal left join DBT_SALESDATAFLO.Stg_Deal_Stage as OPPORTUNITY_STG on OPPORTUNITY_STG.SOURCE_DEAL_ID = deal.Source_DEAL_ID 
        and OPPORTUNITY_STG.Source_type = deal.Source_type  inner join calendar on to_date(deal.PROPERTY_CREATEDATE)=CLDR_DATE
        where 
         timeframe_type is not null
         and to_date(deal.PROPERTY_CREATEDATE) between calendar.start_date and calendar.end_date
        group by 4,5,6,7,8   
    
    union   --Deals Created by Pipeline 62

        select
           
            count(Source_DEAL_ID) as r_count,
            COALESCE(sum(PROPERTY_AMOUNT),0) AS r_amount,
            62 AS r_metric_id,
            DEAL_PIPELINE_STAGE_ID as r_segment_name,
            Source_type as r_Source_type,
            type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Deal deal inner join calendar on to_date(deal.PROPERTY_CREATEDATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(PROPERTY_CREATEDATE) between calendar.start_date and calendar.end_date 
         group by 4,5,6,7,8
    
    union   --Revenue by Company 85

        select
           
            count(Source_ID) as r_count,
            COALESCE(sum(PROPERTY_ANNUALREVENUE),0) AS r_amount,
            85 AS r_metric_id,
            PROPERTY_NAME as r_segment_name,
            Source_type as r_Source_type,
            type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
        from DBT_SALESDATAFLO.Stg_Company inner join calendar on to_date(PROPERTY_CREATEDATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(PROPERTY_CREATEDATE) between calendar.start_date and calendar.end_date 
         group by 4,5,6,7,8



 

),seg_fs AS(
    select sum(count) as f_count,sum(amount)as f_amount,cast(entity_id as varchar(1000)) as f_entity_id,
    metric_id as f_metric_id,segment_name as f_segment_name,tmf.year as f_year,timeframe_type as f_timeframe_type,
    cast(tmf.year as varchar(10)) as f_types_timeframe from DBT_SALESDATAFLO.FACT_SALES_SEGMENTED as sf,DBT_SALESDATAFLO.DIM_TIMEFRAME as tmf
    where 
        TIMEFRAME_TYPE='Y'
        and sf.entity_id = tmf.source_type
        and REPORT_DATE=tmf.year_end
        and Yearend_flag='TRUE'
    group by 3,4,5,6,7,8
    union
    select sum(count) as f_count,sum(amount)as f_amount,cast(entity_id as varchar(1000)) as f_entity_id,
    metric_id as f_metric_id,segment_name as f_segment_name,tmf.year as f_year,timeframe_type as f_timeframe_type,
    UPPER(MONTH_NAME) as f_types_timeframe  from DBT_SALESDATAFLO.FACT_SALES_SEGMENTED as sf,DBT_SALESDATAFLO.DIM_TIMEFRAME as tmf
    where 
        TIMEFRAME_TYPE='M'
        and sf.entity_id = tmf.source_type
        and REPORT_DATE=tmf.MONTH_END
        and MONTHEND_FLAG='TRUE'
    group by 3,4,5,6,7,8

    union
    select sum(count) as f_count,sum(amount)as f_amount,cast(entity_id as varchar(1000)) as f_entity_id,
    metric_id as f_metric_id,segment_name as f_segment_name,tmf.year as f_year,timeframe_type as f_timeframe_type,
    tmf.QUTR_NUMBER as f_types_timeframe from DBT_SALESDATAFLO.FACT_SALES_SEGMENTED as sf,DBT_SALESDATAFLO.DIM_TIMEFRAME as tmf
    where 
        TIMEFRAME_TYPE='Q'
        and sf.entity_id = tmf.source_type
        and REPORT_DATE=tmf.QUARTER_END
        and QUARTEREND_FLAG='TRUE'
    group by 3,4,5,6,7,8

    union
    select sum(count) as f_count,sum(amount)as f_amount,cast(entity_id as varchar(1000)) as f_entity_id,
    metric_id as f_metric_id,segment_name as f_segment_name,tmf.year as f_year,timeframe_type as f_timeframe_type,
    tmf.WEEK_NUM as f_types_timeframe from DBT_SALESDATAFLO.FACT_SALES_SEGMENTED as sf,DBT_SALESDATAFLO.DIM_TIMEFRAME as tmf
    where 
        TIMEFRAME_TYPE='W'
        and sf.entity_id = tmf.source_type
        and REPORT_DATE=tmf.WEEK_END
        and WEEKEND_FLAG='TRUE'
    group by 3,4,5,6,7,8

),compare_result AS(
    select 
    r_count,
    f_count,
    r_amount,
    f_amount,
    r_metric_id,
    f_metric_id,
    r_Source_type,
    f_entity_id,
    r_segment_name,
    f_segment_name,
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
            WHEN case when r_type='Week' then 'W' else null end <> f_timeframe_type THEN 'YES'
            WHEN r_timeframe_type <> f_types_timeframe THEN 'YES'
            WHEN r_year <> f_year THEN 'YES'
            ELSE 'NO'
            END as value_mismatch

    from segr_metric ,seg_fs where segr_metric.r_metric_id=seg_fs.f_metric_id 
    and r_segment_name = f_segment_name
    and SUBSTRING(CAST(r_type AS varchar(1100)),1,1) = f_timeframe_type
    and TRIM(r_timeframe_type)= TRIM(f_types_timeframe)
    and r_year=f_year
    and r_Source_type=f_entity_id


)


select * from segr_metric --where r_type='Year' and r_metric_id= 85