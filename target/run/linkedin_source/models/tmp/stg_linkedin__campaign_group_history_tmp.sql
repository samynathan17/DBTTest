
  create or replace  view DATAFLOTEST_DATABASE.dbt_test.stg_linkedin__campaign_group_history_tmp  as (
    select *
from DATAFLOTEST_DATABASE.linkedin_ads.campaign_group_history
  );
