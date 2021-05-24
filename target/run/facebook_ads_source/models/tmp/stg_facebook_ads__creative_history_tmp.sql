
  create or replace  view DATAFLOTEST_DATABASE.dbt_test.stg_facebook_ads__creative_history_tmp  as (
    select * from DATAFLOTEST_DATABASE.facebook_ads.creative_history
  );
