
  create or replace  view DATAFLOTEST_DATABASE.dbt_test.stg_linkedin__ad_analytics_by_creative_tmp  as (
    select *
from DATAFLOTEST_DATABASE.linkedin_ads.ad_analytics_by_creative
  );
