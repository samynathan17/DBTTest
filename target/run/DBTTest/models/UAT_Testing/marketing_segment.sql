

      create or replace transient table DATAFLOTEST_DATABASE.dbt_test_UAT_Testing.marketing_segment  as
      (With calendar AS(
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
           
            coalesce(count(*), 0)  as r_value,
            93 AS r_metric_id,
            DEVICE_CATEGORY as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Platform_Device ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7  

      union

       select
           
            coalesce(sum(SESSIONS), 0)  as r_value,
            94 AS r_metric_id,
            CHANNEL_GROUPING as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Channel_Traffic ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7    
       
      union

       select
           
            coalesce(count(*), 0)  as r_value,
            95 AS r_metric_id,
            SOCIAL_NETWORK as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Social_Media_Acquisitions ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7  
      
      union
          select
            coalesce(Sum(SESSIONS), 0)  as r_value,
            99 AS r_metric_id,
            CHANNEL_GROUPING as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Channel_Traffic ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7     
      
      union
        select
           
            coalesce(Sum(SESSIONS), 0)  as r_value,
            101 AS r_metric_id,
            KEYWORD as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.stg_Adwords_Keyword ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and upper(KEYWORD)= 'ORGANIC'
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7 

      union
         select
            coalesce(Sum(GOAL_COMPLETIONS_ALL), 0)  as r_value,
            102 AS r_metric_id,
            CHANNEL_GROUPING as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Channel_Traffic ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7   

      union
       select
            coalesce(Sum(GOAL_COMPLETIONS_ALL), 0)  as r_value,
            108 AS r_metric_id,
            GOAL_COMPLETION_LOCATION as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Goal_Conversions ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7   

      union
       select
           
            coalesce(Sum(SESSIONS), 0)  as r_value,
            109 AS r_metric_id,
            KEYWORD as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Adwords_Keyword ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and upper(KEYWORD)='PAID'
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7    

      union
       select
            coalesce(Sum(GOAL_VALUE_ALL), 0)  as r_value,
            110 AS r_metric_id,
            CHANNEL_GROUPING as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Channel_Traffic ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7            

     union
       select
            coalesce(Sum(GOAL_VALUE_ALL), 0)  as r_value,
            112 AS r_metric_id,
            GOAL_COMPLETION_LOCATION as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Goal_Conversions ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7   

     union
       select
            coalesce(Sum(PAGEVIEWS_PER_SESSION), 0)  as r_value,
            114 AS r_metric_id,
            LANDING_PAGE_PATH as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Tracking ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7   

      union
       select
            coalesce(Count(*), 0)  as r_value,
            115 AS r_metric_id,
            PAGE_TITLE as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Traffic ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7  

      union
       select
            coalesce(Sum(SESSIONS), 0)  as r_value,
            120 AS r_metric_id,
            NETWORK_LOCATION as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Geo_Network ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7  

      union
       select
            coalesce(Sum(USERS), 0)  as r_value,
            125 AS r_metric_id,
            CHANNEL_GROUPING as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.stg_Channel_Traffic ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7 

     union
       select
            coalesce(Sum(PAGEVIEWS), 0)  as r_value,
            130 AS r_metric_id,
            cast(NEW_USERS as varchar) as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Social_Media_Acquisitions ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7                 
      
      union
       select
           
            coalesce(Sum(SESSIONS_WITH_EVENT), 0)  as r_value,
            131 AS r_metric_id,
            EVENT_CATEGORY  as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Events_Overview ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7  

      union
       select
           
            coalesce(Sum(SESSIONS), 0)  as r_value,
            139 AS r_metric_id,
            cast(USERS as varchar)  as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Channel_Traffic ga inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and upper(CHANNEL_GROUPING)='ORGANIC'
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7  
  --======================================== 2.GSC ===========================================================================
      union
       select
           
            coalesce(Sum(CLICKS), 0)  as r_value,
            196 AS r_metric_id,
            PAGE as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7  

     union
       select
           
            coalesce(Sum(CLICKS), 0)  as r_value,
            197 AS r_metric_id,
            KEYWORD as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Keyword_Site_Report_By_Site GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7      
   
      union
       select
           
            coalesce(Sum(CTR), 0)  as r_value,
            200 AS r_metric_id,
            PAGE as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7  

      union
       select
            coalesce(Sum(CTR), 0)  as r_value,
            201 AS r_metric_id,
            KEYWORD as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Keyword_Site_Report_By_Site GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7   
      
     union
       select
            coalesce(Sum(IMPRESSIONS), 0)  as r_value,
            202 AS r_metric_id,
            PAGE as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7   
      
      union
       select
            coalesce(Sum(IMPRESSIONS), 0)  as r_value,
            204 AS r_metric_id,
            KEYWORD as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Keyword_Site_Report_By_Site GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7   

      union
       select
            coalesce(Sum(POSITION), 0)  as r_value,
            205 AS r_metric_id,
            COUNTRY as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7   
      
      union
       select
            coalesce(Sum(POSITION), 0)  as r_value,
            206 AS r_metric_id,
            DEVICE as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7   
      
      union
       select
            coalesce(Sum(POSITION), 0)  as r_value,
            207 AS r_metric_id,
            KEYWORD as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Keyword_Site_Report_By_Site GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7   

      union
       select
            coalesce(Sum(POSITION), 0)  as r_value,
            208 AS r_metric_id,
            PAGE as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7     

      union
       select
            coalesce(Sum(CLICKS), 0)  as r_value,
            209 AS r_metric_id,
            DEVICE as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7   

      union
       select
            coalesce(Sum(CLICKS), 0)  as r_value,
            210 AS r_metric_id,
            SEARCH_TYPE as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7 
      
      union
       select
            coalesce(Sum(IMPRESSIONS), 0)  as r_value,
            211 AS r_metric_id,
            COUNTRY as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7

      union
       select
            coalesce(Sum(IMPRESSIONS), 0)  as r_value,
            212 AS r_metric_id,
            DEVICE as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7

      union
       select
            coalesce(Sum(IMPRESSIONS), 0)  as r_value,
            213 AS r_metric_id,
            SEARCH_TYPE as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7   

      union
       select
            coalesce(Sum(POSITION), 0)  as r_value,
            214 AS r_metric_id,
            SEARCH_TYPE as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7      

      union
       select
            coalesce(Sum(CTR), 0)  as r_value,
            215 AS r_metric_id,
            COUNTRY as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7

      union
       select
            coalesce(Sum(CTR), 0)  as r_value,
            216 AS r_metric_id,
            DEVICE as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7       

      union
       select
            coalesce(Sum(CTR), 0)  as r_value,
            217 AS r_metric_id,
            SEARCH_TYPE as r_segment_name,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
       from DBT_SALESDATAFLO.Stg_Page_Report GSC inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6,7                

),fs AS(

     select 
     sum(value) f_value,
     metric_id as f_metric_id,
     segment_name as f_segment_name,
     entity_code as f_entity_code,
     timeframe_type as f_timeframe_type,
     cldr.year as f_year,
     cast(cldr.year as varchar(1000)) as f_types_timeframe
      from DBT_SALESDATAFLO.FACT_MARKETING_SEGMENTED fm
        inner join DBT_SALESDATAFLO.DIM_CALENDAR as cldr on fm.REPORT_DATE=cldr.CLDR_DATE
     where 
        TIMEFRAME_TYPE='Y'
        --and fm.ENTITY_CODE = 'GSC_ANANDLIVE_14052021'
        and REPORT_DATE between cldr.CLDR_YEAR_START_DT and cldr.CLDR_YEAR_END_DT 
        --and METRIC_ID=198
        --and YEAREND_FLAG='TRUE'
     group by 2,3,4,5,6,7

     union

      select 
     sum(value) f_value,
     metric_id as f_metric_id,
     segment_name as f_segment_name,
     entity_code as f_entity_code,
     timeframe_type as f_timeframe_type,
     cldr.year as f_year,
     UPPER(CLDR_QTR) as f_types_timeframe
      from DBT_SALESDATAFLO.FACT_MARKETING_SEGMENTED fm
        inner join DBT_SALESDATAFLO.DIM_CALENDAR as cldr on fm.REPORT_DATE=cldr.CLDR_DATE
     where 
        TIMEFRAME_TYPE='Q'
        and REPORT_DATE between cldr.CLDR_QTR_STRT_DT and cldr.CLDR_QTR_END_DT 
        --and QUARTEREND_FLAG='TRUE'
     group by 2,3,4,5,6,7

     union

      select 
     sum(value) f_value,
     metric_id as f_metric_id,
     segment_name as f_segment_name,
     entity_code as f_entity_code,
     timeframe_type as f_timeframe_type,
     cldr.year as f_year,
     UPPER(MONTH_NAME) as f_types_timeframe
      from DBT_SALESDATAFLO.FACT_MARKETING_SEGMENTED fm
        inner join DBT_SALESDATAFLO.DIM_CALENDAR as cldr on fm.REPORT_DATE=cldr.CLDR_DATE
     where 
        TIMEFRAME_TYPE='M'
        and REPORT_DATE between cldr.CLDR_MNTH_STRT_DT and cldr.CLDR_MNTH_END_DT 
        --and MONTHEND_FLAG='TRUE'
     group by 2,3,4,5,6,7

     union

      select 
     sum(value) f_value,
     metric_id as f_metric_id,
     segment_name as f_segment_name,
     entity_code as f_entity_code,
     timeframe_type as f_timeframe_type,
     cldr.year as f_year,
     CONCAT('W',cast(CLDR_WEEK_NUM as varchar(1000))) as f_types_timeframe
      from DBT_SALESDATAFLO.FACT_MARKETING_SEGMENTED fm
        inner join DBT_SALESDATAFLO.DIM_CALENDAR as cldr on fm.REPORT_DATE=cldr.CLDR_DATE
     where 
        TIMEFRAME_TYPE='W'
        and REPORT_DATE between cldr.WEEK_START_DATE and cldr.WEEK_END_DATE 
        --and WEEKEND_FLAG='TRUE'
     group by 2,3,4,5,6,7


), compare_result AS(
    select 
    r_value,
    f_value,
    r_metric_id,
    f_metric_id,
    r_segment_name,
    f_segment_name,
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
    and r_segment_name = f_segment_name
    and SUBSTRING(CAST(r_type AS varchar(1100)),1,1) = f_timeframe_type
    and TRIM(r_timeframe_type)= TRIM(f_types_timeframe)
    and r_year=f_year
    and r_Source_type=f_entity_code


)  



select distinct * from compare_result -- where r_type='Month' and r_source_type ='GSC_ANANDLIVE_14052021' --and r_metric_id=93
      );
    