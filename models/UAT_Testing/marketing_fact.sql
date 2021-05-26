With calendar AS(
      select CLDR_DATE, CLDR_YEAR_START_DT as start_date,CLDR_YEAR_END_DT as end_date,year,'Year' as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,cast(year as varchar(1000)) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR 
     union
     select CLDR_DATE, CLDR_MNTH_STRT_DT as start_date,CLDR_MNTH_END_DT as end_date,year,'Month' as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,UPPER(MONTH_NAME) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR
    union
     select CLDR_DATE,WEEK_START_DATE as start_date,WEEK_END_DATE as end_date,year,'Week'as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,CONCAT('W',cast(CLDR_WEEK_NUM as varchar(1000))) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR
     union
     select CLDR_DATE,CLDR_QTR_STRT_DT as start_date,CLDR_QTR_END_DT as end_date,year,'Quarter' as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,UPPER(CLDR_QTR) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR

),r_metric AS(
         
         ---========================= 1.GA =====================================================
        select
           
            coalesce(sum(SESSIONS_PER_USER), 0)  as r_value,
            139 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Session ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6   

     union

     select
           
            coalesce(sum(SESSIONS), 0)  as r_value,
            140 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Channel_Traffic ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6       
      
      union

     select
           
            coalesce(sum(PERCENT_NEW_SESSIONS), 0)  as r_value,
            141 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Social_Media_Acquisitions ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6       
     
     union

     select
           
            coalesce(sum(NEW_USERS), 0)  as r_value,
            142 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Social_Media_Acquisitions ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6       

      union

     select
           
            coalesce(sum(PAGEVIEWS), 0)  as r_value,
            143 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Social_Media_Acquisitions ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6       

     union

     select
           
            coalesce(sum(PAGEVIEWS_PER_SESSION), 0)  as r_value,
            144 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Page_Tracking ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6        

     union

     select
           
            coalesce(sum(BOUNCE_RATE), 0)  as r_value,
            145 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Session ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6          

     union

     select
           
            coalesce(sum(AVG_SESSION_DURATION), 0)  as r_value,
            147 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Social_Media_Acquisitions ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6        

      union

     select
           
            coalesce(sum(GOAL_COMPLETIONS_ALL), 0)  as r_value,
            151 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Goal_Conversions ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6          

      union

     select
           
            coalesce(sum(GOAL_CONVERSION_RATE_ALL), 0)  as r_value,
            152 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Goal_Conversions ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6                          
     
     union

     select
           
            coalesce(sum(TRANSACTIONS_PER_SESSION), 0)  as r_value,
            158 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Social_Media_Acquisitions ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6   

     union

     select
           
            coalesce(sum(TOTAL_EVENTS), 0)  as r_value,
            163 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Events_Overview ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6      

     union

     select
           
            coalesce(Sum(TRANSACTIONS)/decode(Sum(NEW_USERS),0,1), 0)  as r_value,
            164 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Social_Media_Acquisitions ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6                   

     union

     select
           
            coalesce(Sum(TIME_ON_PAGE), 0)  as r_value,
            166 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Page_Tracking ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6                                             
      union

     select
           
            coalesce(Sum(UNIQUE_PAGEVIEWS), 0)  as r_value,
            167 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Page_Tracking ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6                  

    ---========================= 2.GSC =====================================================
       union

        select
           
            coalesce(sum(clicks), 0)  as r_value,
            195 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Site_Report_By_Site site inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6   

     union
        select
           
            coalesce(sum(impressions), 0)  as r_value,
            198 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Site_Report_By_Site site inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6         

    union
        select
           
            coalesce(sum(CTR), 0)  as r_value,
            199 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Site_Report_By_Site site inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6   

),fs AS(

     select 
     sum(value) f_value,
     metric_id as f_metric_id,
     entity_code as f_entity_code,
     timeframe_type as f_timeframe_type,
     cldr.year as f_year,
     cast(cldr.year as varchar(1000)) as f_types_timeframe
      from DBT_SALESDATAFLO.FACT_MARKETING fm
        inner join DBT_SALESDATAFLO.DIM_CALENDAR as cldr on fm.REPORT_DATE=cldr.CLDR_DATE
     where 
        TIMEFRAME_TYPE='Y'
        --and fm.ENTITY_CODE = 'GSC_ANANDLIVE_14052021'
        and REPORT_DATE between cldr.CLDR_YEAR_START_DT and cldr.CLDR_YEAR_END_DT 
        --and METRIC_ID=198
        --and YEAREND_FLAG='TRUE'
     group by 2,3,4,5,6

     union

      select 
     sum(value) f_value,
     metric_id as f_metric_id,
     entity_code as f_entity_code,
     timeframe_type as f_timeframe_type,
     cldr.year as f_year,
     UPPER(CLDR_QTR) as f_types_timeframe
      from DBT_SALESDATAFLO.FACT_MARKETING fm
        inner join DBT_SALESDATAFLO.DIM_CALENDAR as cldr on fm.REPORT_DATE=cldr.CLDR_DATE
     where 
        TIMEFRAME_TYPE='Q'
        and REPORT_DATE between cldr.CLDR_QTR_STRT_DT and cldr.CLDR_QTR_END_DT 
        --and QUARTEREND_FLAG='TRUE'
     group by 2,3,4,5,6

     union

      select 
     sum(value) f_value,
     metric_id as f_metric_id,
     entity_code as f_entity_code,
     timeframe_type as f_timeframe_type,
     cldr.year as f_year,
     UPPER(MONTH_NAME) as f_types_timeframe
      from DBT_SALESDATAFLO.FACT_MARKETING fm
        inner join DBT_SALESDATAFLO.DIM_CALENDAR as cldr on fm.REPORT_DATE=cldr.CLDR_DATE
     where 
        TIMEFRAME_TYPE='M'
        and REPORT_DATE between cldr.CLDR_MNTH_STRT_DT and cldr.CLDR_MNTH_END_DT 
        --and MONTHEND_FLAG='TRUE'
     group by 2,3,4,5,6

     union

      select 
     sum(value) f_value,
     metric_id as f_metric_id,
     entity_code as f_entity_code,
     timeframe_type as f_timeframe_type,
     cldr.year as f_year,
     CONCAT('W',cast(CLDR_WEEK_NUM as varchar(1000))) as f_types_timeframe
      from DBT_SALESDATAFLO.FACT_MARKETING fm
        inner join DBT_SALESDATAFLO.DIM_CALENDAR as cldr on fm.REPORT_DATE=cldr.CLDR_DATE
     where 
        TIMEFRAME_TYPE='W'
        and REPORT_DATE between cldr.WEEK_START_DATE and cldr.WEEK_END_DATE 
        --and WEEKEND_FLAG='TRUE'
     group by 2,3,4,5,6


), compare_result AS(
    select 
    r_value,
    f_value,
    r_metric_id,
    f_metric_id,
    r_Source_type,
    f_entity_code,
    r_type,
    f_timeframe_type,
    r_timeframe_type,
    f_types_timeframe,
    r_year,
    f_year,
    CASE
            WHEN r_value <> f_value THEN 'YES'
            WHEN r_metric_id <> f_metric_id THEN 'YES'
            WHEN r_Source_type <> f_entity_code THEN 'YES'
            WHEN case when r_type='Year' then 'Y' else null end <> f_timeframe_type THEN 'YES'
            WHEN case when r_type='Month' then 'M' else null end <> f_timeframe_type THEN 'YES'
            WHEN case when r_type='Quarter' then 'Q' else null end <> f_timeframe_type THEN 'YES'
            WHEN case when r_type='Week' then 'W' else null end <> f_timeframe_type THEN 'YES' --Month,Year,Quarter,Week
            WHEN r_timeframe_type <> f_types_timeframe THEN 'YES'
            WHEN r_year <> f_year THEN 'YES'
            ELSE 'NO'
            END as value_mismatch

    from r_metric ,fs where r_metric.r_metric_id=fs.f_metric_id 
    and SUBSTRING(CAST(r_type AS varchar(1100)),1,1) = f_timeframe_type
    and TRIM(r_timeframe_type)= TRIM(f_types_timeframe)
    and r_year=f_year
    and r_Source_type=f_entity_code


)



select * from compare_result --where r_type='Year' and r_metric_id=140 --and f_entity_code='GSC_ANANDLIVE_14052021'   
