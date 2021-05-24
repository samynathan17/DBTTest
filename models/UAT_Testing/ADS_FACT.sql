With calendar AS(
      select CLDR_DATE, CLDR_YEAR_START_DT as start_date,CLDR_YEAR_END_DT as end_date,year,'Year' as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,cast(year as varchar(1000)) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR 
     union
     select CLDR_DATE, CLDR_MNTH_STRT_DT as start_date,CLDR_MNTH_END_DT as end_date,year,'Month' as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,UPPER(MONTH_NAME) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR
    union
     select CLDR_DATE,WEEK_START_DATE as start_date,WEEK_END_DATE as end_date,year,'Week'as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,CONCAT('W',cast(CLDR_WEEK_NUM as varchar(1000))) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR
     union
     select CLDR_DATE,CLDR_QTR_STRT_DT as start_date,CLDR_QTR_END_DT as end_date,year,'Quarter' as type,MONTH_NAME,CLDR_WEEK_NUM,CLDR_QTR,UPPER(CLDR_QTR) as timeframe_type from DBT_SALESDATAFLO.DIM_CALENDAR

),r_ads AS(
            --==================== 1.LI_ADS ====================================================================
      select
           
            Sum(cost_in_local_currency) as r_value,
            172 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Ad_Analytics_By_Creative eng inner join calendar on to_date(DAY)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DAY) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6

      union
        select
           
            coalesce(sum(clicks), 0)  as r_value,
            173 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Ad_Analytics_By_Creative eng inner join calendar on to_date(DAY)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DAY) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6
      union
        select
           
            coalesce(Sum(impressions), 0)  as r_value,
            175 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Ad_Analytics_By_Creative eng inner join calendar on to_date(DAY)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DAY) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6
      union
        select
           
            coalesce(Sum(clicks)/ Sum(impressions), 0)  as r_value,
            177 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Ad_Analytics_By_Creative eng inner join calendar on to_date(DAY)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DAY) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6
      union
        select
           
            Sum(cost_in_local_currency)/ NULLIF(Sum(clicks),0)  as r_value,
            179 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Ad_Analytics_By_Creative eng inner join calendar on to_date(DAY)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DAY) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6   

      ---========================== 2.GA ADS ===========================================

      union
        select
           
            coalesce(sum(cost), 0)  as r_value,
            172 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Final_URL_Performance eng inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6   

      union
        select
            coalesce(Sum(clicks), 0)  as r_value,
            173 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Final_URL_Performance eng inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6      

      union
        select
            coalesce(Sum(impressions), 0)  as r_value,
            175 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Final_URL_Performance eng inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6      

      union
        select
            coalesce(Sum(clicks)/ Sum(impressions), 0)  as r_value,
            177 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Final_URL_Performance eng inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6      

      union
        select
            coalesce(sum(cost)/ Sum(clicks), 0)  as r_value,
            179 AS r_metric_id,
            Source_type as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from DBT_SALESDATAFLO.Stg_Final_URL_Performance eng inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6   

      
       -- =============== 3. FB_ADS ===========================================================   

       union
        select
           
            coalesce(sum(spend), 0)  as r_value,
            172 AS r_metric_id,
            'FB_ADS_DRGRILL_30032021' as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from FB_ADS_DRGRILL_30032021.BASIC_AD BASIC_AD inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6   

         union
        select
           
            coalesce(sum(INLINE_LINK_CLICKS), 0)  as r_value,
            173 AS r_metric_id,
            'FB_ADS_DRGRILL_30032021' as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from FB_ADS_DRGRILL_30032021.BASIC_AD BASIC_AD inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6  

      union
        select
           
            coalesce(sum(impressions), 0)  as r_value,
            175 AS r_metric_id,
            'FB_ADS_DRGRILL_30032021' as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from FB_ADS_DRGRILL_30032021.BASIC_AD BASIC_AD inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6     

       union
        select
           
            coalesce(sum(CTR), 0)  as r_value,
            177 AS r_metric_id,
            'FB_ADS_DRGRILL_30032021' as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from FB_ADS_DRGRILL_30032021.BASIC_AD BASIC_AD inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6   

       union
        select
           
            coalesce(sum(CPC), 0)  as r_value,
            179 AS r_metric_id,
            'FB_ADS_DRGRILL_30032021' as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from FB_ADS_DRGRILL_30032021.BASIC_AD BASIC_AD inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6        

       union
        select
           
            coalesce(sum(CPM), 0)  as r_value,
            188 AS r_metric_id,
            'FB_ADS_DRGRILL_30032021' as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from FB_ADS_DRGRILL_30032021.BASIC_AD BASIC_AD inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6    

        union
        select
           
            coalesce(sum(REACH), 0)  as r_value,
            189 AS r_metric_id,
            'FB_ADS_DRGRILL_30032021' as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from FB_ADS_DRGRILL_30032021.BASIC_AD BASIC_AD inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6            
      
       union
        select
           
            coalesce(sum(FREQUENCY), 0)  as r_value,
            190 AS r_metric_id,
            'FB_ADS_DRGRILL_30032021' as r_Source_type,
            calendar.type as r_type,
            timeframe_type as r_timeframe_type,
            year as r_year
      from FB_ADS_DRGRILL_30032021.BASIC_AD BASIC_AD inner join calendar on to_date(DATE)=CLDR_DATE
         where 
         timeframe_type is not null
         and to_date(DATE) between calendar.start_date and calendar.end_date 
         group by 3,4,5,6            

) 

select * from r_ads where 1=1
--and r_metric_id=172 
and r_source_type='FB_ADS_DRGRILL_30032021'
