
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_UAT_Testing.yearwise_segment_fact_sales  as (
    WITH PERIOD AS(
     Select *,
        CASE
            WHEN TYPE='Year' THEN cast (split(FULLY_QUALIFIED_LABEL,'FY ')[1] as integer) ELSE NULL END as r_year_num,
        CASE
            WHEN TYPE='Quarter' THEN SUBSTRING(FULLY_QUALIFIED_LABEL, 2, 3) ELSE NULL END as r_Quarter_name,
        CASE
            WHEN TYPE='Month' THEN split(FULLY_QUALIFIED_LABEL,'FY ')[0] ELSE NULL END as r_month_name   
      from SF_RKLIVE_06012021.PERIOD 
 ), segment_raw AS (

     Select 
        0 as r_amount,
        count(*) as r_count, 
        7 as raw_metric_id,
        'SF_RKLIVE_06012021' as r_entity_id,
        lead_stg.INDUSTRY as r_segmentName,
        per_stg.r_year_num
    from  SF_RKLIVE_06012021.LEAD lead_stg,PERIOD per_stg
    where 1=1
    and to_date(lead_stg.CREATED_DATE) >= per_stg.start_date
    and to_date(lead_stg.CREATED_DATE) <= per_stg.end_date 
    group by lead_stg.INDUSTRY,per_stg.r_year_num

    union 

    Select 
        sum(Opp_stg.amount) as r_amount,
        count(Opp_stg.ID) as r_count,
        11 as raw_metric_id,
        'SF_RKLIVE_06012021' as r_entity_id,
        Opp_stg.owner_id as r_segmentName,
        per_stg.r_year_num
        from SF_RKLIVE_06012021."OPPORTUNITY" Opp_stg,PERIOD per_stg
    where 1=1
    and Is_closed = 'true'
    and IS_won = 'false'
    and to_date(Opp_stg.close_date) >= per_stg.start_date
    and to_date(Opp_stg.close_date) <= per_stg.end_date 
    group by Opp_stg.owner_id,per_stg.r_year_num
    
    union 

    Select 
        sum(Opp_stg.amount) as r_amount,
        count(Opp_stg.ID) as r_count,
        14 as raw_metric_id,
        'SF_RKLIVE_06012021' as r_entity_id,
        Opp_stg.name as r_segmentName,
        per_stg.r_year_num
        from SF_RKLIVE_06012021."OPPORTUNITY" Opp_stg,PERIOD per_stg
    where 1=1
    and Is_closed = 'true'
    and IS_won = 'false'
    and to_date(Opp_stg.close_date) >= per_stg.start_date
    and to_date(Opp_stg.close_date) <= per_stg.end_date 
    group by Opp_stg.name,per_stg.r_year_num

    union 

    Select 
        sum(Opp_stg.amount) as r_amount,
        count(Opp_stg.ID) as r_count,
        22 as raw_metric_id,
        'SF_RKLIVE_06012021' as r_entity_id,
        Opp_stg.name as r_segmentName,
        per_stg.r_year_num
        from SF_RKLIVE_06012021."OPPORTUNITY" Opp_stg,PERIOD per_stg
    where 1=1
    and IS_won = 'true'
    and to_date(Opp_stg.close_date) >= per_stg.start_date
    and to_date(Opp_stg.close_date) <= per_stg.end_date 
    group by Opp_stg.name,per_stg.r_year_num

    union 

    Select 
        0 as r_amount,
        count(lead_stg.ID) as r_count,
        18 as raw_metric_id,
        'SF_RKLIVE_06012021' as r_entity_id,
        lead_stg.LEAD_SOURCE as r_segmentName,
        per_stg.r_year_num
        from SF_RKLIVE_06012021."LEAD" lead_stg,PERIOD per_stg
    where 1=1
    and to_date(lead_stg.CREATED_DATE) >= per_stg.start_date
    and to_date(lead_stg.CREATED_DATE) <= per_stg.end_date 
    group by lead_stg.LEAD_SOURCE,per_stg.r_year_num

    union 

    Select 
        0 as r_amount,
        count(lead_stg.ID) as r_count,
        19 as raw_metric_id,
        'SF_RKLIVE_06012021' as r_entity_id,
        lead_stg.STATUS as r_segmentName,
        per_stg.r_year_num
        from SF_RKLIVE_06012021."LEAD" lead_stg,PERIOD per_stg
    where 1=1
    and to_date(lead_stg.CREATED_DATE) >= per_stg.start_date
    and to_date(lead_stg.CREATED_DATE) <= per_stg.end_date 
    group by lead_stg.STATUS,per_stg.r_year_num

    union 

    Select 
        0 as r_amount,
        count(acc_stg.ID) as r_count,
        28 as raw_metric_id,
        'SF_RKLIVE_06012021' as r_entity_id,
        acc_stg.owner_id as r_segmentName,
        per_stg.r_year_num
        from SF_RKLIVE_06012021."ACCOUNT" acc_stg,PERIOD per_stg
    where 1=1
    and to_date(acc_stg.CREATED_DATE) >= per_stg.start_date
    and to_date(acc_stg.CREATED_DATE) <= per_stg.end_date 
    group by acc_stg.owner_id,per_stg.r_year_num

    union 

    Select 
        0 as r_amount,
        count(lead_stg.ID) as r_count,
        30 as raw_metric_id,
        'SF_RKLIVE_06012021' as r_entity_id,
        lead_stg.owner_id as r_segmentName,
        per_stg.r_year_num
        from SF_RKLIVE_06012021."LEAD" lead_stg,PERIOD per_stg
    where 1=1
    and to_date(lead_stg.CREATED_DATE) >= per_stg.start_date
    and to_date(lead_stg.CREATED_DATE) <= per_stg.end_date 
    group by lead_stg.owner_id,per_stg.r_year_num

    union 

    Select 
        0 as r_amount,
        count(*) as r_count,
        31 as raw_metric_id,
        'SF_RKLIVE_06012021' as r_entity_id,
        concat(lead_stg.street,' ',lead_stg.city,' ',lead_stg.state,' ',lead_stg.postal_code,' ',lead_stg.country) as r_segmentName,
        per_stg.r_year_num
        from SF_RKLIVE_06012021."LEAD" lead_stg,PERIOD per_stg
    where 1=1
    and to_date(lead_stg.CREATED_DATE) >= per_stg.start_date
    and to_date(lead_stg.CREATED_DATE) <= per_stg.end_date 
    group by concat(lead_stg.street,' ',lead_stg.city,' ',lead_stg.state,' ',lead_stg.postal_code,' ',lead_stg.country),per_stg.r_year_num

 ),fact_segment as(
    select 
        sum(sales_f.amount) as f_amount, 
        sum(sales_f.count) as f_count,
        segment_name as f_segmentName,
        metric_id,
        sales_f.entity_id,
        timeframe_d.year,
        sales_f.timeframe_type

    from "DBT_SALESDATAFLO"."FACT_SALES_SEGMENTED" Sales_f, "DBT_SALESDATAFLO"."DIM_TIMEFRAME" timeframe_d
    where 1=1
    and sales_f.entity_id = timeframe_d.source_type
    --and sales_f.entity_id = 'SF_RKLIVE_06012021'
    --and sales_f.metric_id = 1
    and sales_f.timeframe_type = 'Y'--'M','Q','W','D','PIT'
    and timeframe_d.Yearend_flag = 'TRUE'
    and sales_f.report_date = timeframe_d.year_end
    --and timeframe_d.year = 2018
  
    group by entity_id,segment_name,metric_id,timeframe_d.year,sales_f.timeframe_type

 ),result_set as (
    select
        r_amount,
        f_amount,
        (r_amount-f_amount) as amount_difference,
        r_count,
        f_count,
        (r_count-f_count) as count_difference,
        r_segmentName,
        f_segmentName,
        raw_metric_id,
        metric_id as f_metric_id,
        entity_id,
        r_year_num,
        year,
        timeframe_type,
        
        CASE
            WHEN r_amount <> f_amount THEN 'true'
            WHEN r_count <> f_count THEN 'true'
            WHEN raw_metric_id <> metric_id THEN 'true'
            WHEN r_entity_id <> entity_id THEN 'true'
            WHEN r_year_num <> year THEN 'true'
            WHEN r_segmentName <> f_segmentName THEN 'true'
            ELSE 'false'
            END as value_mismatch
            
    from fact_segment fact1,segment_raw raw1
    where 1=1
        and metric_id=raw_metric_id
        and fact1.entity_id = raw1.r_entity_id
        and fact1.year= raw1.r_year_num
        and fact1.f_segmentName=raw1.r_segmentName   

    )

Select * from result_set
  );
