{% if not var("enable_salesforce_source") %}
{{
    config(
        enabled=false
    )
}}
{% endif %}

{% if var("salesforce_crm_etl_name") == 'fivetran' %}

with dates as (

    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="to_date('01/01/2020', 'mm/dd/yyyy')",
        end_date="dateadd(week, 53, current_date)"
       )
    }}
) ,renamed as(
select
      d.date_day as cldr_date,
      cast({{ dbt_utils.date_trunc('month',  'd.date_day')}} as date) as cldr_mnth_strt_dt,    
       cast({{ dbt_utils.last_day('d.date_day', 'month') }} as date) as cldr_mnth_end_dt,
        cast({{ dbt_utils.date_trunc('quarter', 'd.date_day')}} as date) as cldr_qtr_strt_dt,
        cast({{ dbt_utils.last_day('d.date_day', 'quarter') }} as date) as cldr_qtr_end_dt,
        cast({{ dbt_utils.date_trunc('year', 'd.date_day')}} as date) as cldr_year_start_dt,
        cast({{ dbt_utils.last_day('d.date_day', 'year') }} as date) as cldr_year_end_dt,
        cast({{ dbt_utils.date_trunc('week', 'd.date_day')}} as date) as week_start_date,
        cast({{ dbt_utils.last_day('d.date_day', 'week') }} as date) as week_end_date,
        {{ dbt_date.day_name('d.date_day', short=true) }} as day_name,
      {{ dbt_date.month_name('d.date_day', short=true) }} as month_name,
        cast({{ dbt_date.date_part('day', 'd.date_day') }} as {{ dbt_utils.type_int() }}) as cldr_day_num,
        cast({{ dbt_date.date_part('week', 'd.date_day') }} as {{ dbt_utils.type_int() }}) as cldr_week_num,
        cast({{ dbt_date.date_part('quarter', 'd.date_day') }} as {{ dbt_utils.type_int() }}) as cldr_qtr_num,
        cast({{ dbt_date.date_part('year', 'd.date_day') }} as {{ dbt_utils.type_int() }}) as year,
        cast(
            case
                when {{ dbt_date.date_part('dayofweek', 'd.date_day') }} = 0 then 7
                else {{ dbt_date.date_part('dayofweek',  'd.date_day')  }}
            end as {{ dbt_utils.type_int() }}
            ) as day_of_week,
        case
            when {{ dbt_date.date_part('dayofweek',  'd.date_day') }} = 0 then 'Y'
            else 'N'
        end as weekend_flag,   
      {{ dbt_utils.current_timestamp() }} as DW_INS_UPD_DTS,
      'D_CALENDAR_DIM_LOAD' as DW_SESSION_NM
from
    dates d
order by 1)

{% endif %}

select * from renamed