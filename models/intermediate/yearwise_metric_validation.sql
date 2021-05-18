 WITH PERIOD AS(
     Select *,
        CASE
            WHEN TYPE='Year' THEN cast (split(FULLY_QUALIFIED_LABEL,'FY ')[1] as integer) ELSE NULL END as r_year_num,
        CASE
            WHEN TYPE='Quarter' THEN SUBSTRING(FULLY_QUALIFIED_LABEL, 2, 3) ELSE NULL END as r_Quarter_name,
        CASE
            WHEN TYPE='Month' THEN split(FULLY_QUALIFIED_LABEL,'FY ')[0] ELSE NULL END as r_month_name   
      from SF_RKLIVE_06012021.PERIOD 
 ), metric1 AS (

    Select
        sum(Opp_stg.amount) as r_amount ,
        count(Opp_stg.ID) as r_count,
        1 as raw_metric_id,
        'SF_RKLIVE_06012021' as r_entity_id,
        per_stg.r_year_num
        from SF_RKLIVE_06012021.OPPORTUNITY as Opp_stg,PERIOD as per_stg
        where 1=1
        and Is_closed = 'true'
        and IS_won = 'true'
        and to_date(close_date) >= per_stg.start_date
        and to_date(close_date) <= per_stg.end_date
        group by 5 

        union

        Select
        sum(Opp_stg.amount) as r_amount ,
        count(Opp_stg.ID) as r_count,
        10 as raw_metric_id,
        'SF_RKLIVE_06012021' as r_entity_id,
        per_stg.r_year_num
        from SF_RKLIVE_06012021.OPPORTUNITY as Opp_stg,PERIOD as per_stg
        where 1=1
        and IS_won = 'false'
        and Is_closed = 'true'
        and to_date(close_date) >= per_stg.start_date
        and to_date(close_date) <= per_stg.end_date
        group by 5 

        union 

        Select 
            0 as r_amount,
            count(*) as r_count, 
            3 as raw_metric_id,
            'SF_RKLIVE_06012021' as r_entity_id,
            per_stg.r_year_num
            from  SF_RKLIVE_06012021.LEAD lead_stg,PERIOD per_stg
        where 1=1
        and lead_stg.IS_CONVERTED='true' 
        and to_date(CREATED_DATE) >= per_stg.start_date
        and to_date(CREATED_DATE) <= per_stg.end_date
        group by 5

        union

        Select 
            0 as r_amount,
            count(*) as r_count, 
            4 as raw_metric_id,
            'SF_RKLIVE_06012021' as r_entity_id,
            per_stg.r_year_num
            from  SF_RKLIVE_06012021.LEAD lead_stg,PERIOD per_stg
        where 1=1
        and lead_stg.IS_CONVERTED='false' 
        and to_date(CREATED_DATE) >= per_stg.start_date
        and to_date(CREATED_DATE) <= per_stg.end_date
        group by 5

        union

        Select  
            0 as r_amount,
            count(*) as r_count, 
            27 as raw_metric_id,
            'SF_RKLIVE_06012021' as r_entity_id,
            per_stg.r_year_num 
        from "SF_RKLIVE_06012021"."ACCOUNT" acc_stg,PERIOD per_stg
        where 1=1
        and to_date(CREATED_DATE) >= per_stg.start_date
        and to_date(CREATED_DATE) <= per_stg.end_date
        group by 5

        union 

        Select 
            0 as r_amount,
            count(*) as r_count, 
            29 as raw_metric_id,
            'SF_RKLIVE_06012021' as r_entity_id,
            per_stg.r_year_num 
        from SF_RKLIVE_06012021.CONTACT contact_stg,PERIOD per_stg
        where 1=1    
        and to_date(CREATED_DATE) >= per_stg.start_date
        and to_date(CREATED_DATE) <= per_stg.end_date
        group by 5

    ),FACT_SALES as(
    select 
        sum(sales_f.amount) as f_amount, 
        sum(sales_f.count) as f_count,
        metric_id,
        sales_f.entity_id,
        timeframe_d.year
    from "DBT_SALESDATAFLO"."FACT_SALES" Sales_f, "DBT_SALESDATAFLO"."DIM_TIMEFRAME" timeframe_d
    where 1=1
    and sales_f.entity_id = timeframe_d.source_type
    and sales_f.entity_id = 'SF_RKLIVE_06012021'
    --and sales_f.metric_id = 1
    and sales_f.timeframe_type = 'Y'--'M','Q','W','D','PIT'
    and timeframe_d.Yearend_flag = 'TRUE'
    and sales_f.report_date = timeframe_d.year_end
    --and timeframe_d.year = 2018
    group by entity_id,metric_id,timeframe_d.year
    
    ),result_set as (
    select
        r_amount,
        f_amount,
        (r_amount-f_amount) as amount_difference,
        r_count,
        f_count,
        (r_count-f_count) as count_difference,
        raw_metric_id,
        metric_id as f_metric_id,
        entity_id,
        r_year_num,
        year,
        
        CASE
            WHEN r_amount <> f_amount THEN 'true'
            WHEN r_count <> f_count THEN 'true'
            WHEN raw_metric_id <> metric_id THEN 'true'
            WHEN r_entity_id <> entity_id THEN 'true'
            WHEN r_year_num <> year THEN 'true'
            ELSE 'false'
            END as value_mismatch
            
    from FACT_SALES fact1,metric1 raw1
    where 1=1
        and metric_id=raw_metric_id
        and fact1.entity_id = raw1.r_entity_id
        and fact1.year= raw1.r_year_num   

    )

   select * from  result_set
