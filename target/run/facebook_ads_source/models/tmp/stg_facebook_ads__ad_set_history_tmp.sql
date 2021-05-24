
  create or replace  view DATAFLOTEST_DATABASE.dbt_test.stg_facebook_ads__ad_set_history_tmp  as (
    select * from DATAFLOTEST_DATABASE.facebook_ads.ad_set_history
  );
