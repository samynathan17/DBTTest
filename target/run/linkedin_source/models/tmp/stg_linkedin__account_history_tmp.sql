
  create or replace  view DATAFLOTEST_DATABASE.dbt_test.stg_linkedin__account_history_tmp  as (
    select *
from DATAFLOTEST_DATABASE.linkedin_ads.account_history
  );
