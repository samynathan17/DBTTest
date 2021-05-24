
  create or replace  view DATAFLOTEST_DATABASE.dbt_test.stg_facebook_ads__basic_ad_tmp  as (
    select * from DATAFLOTEST_DATABASE.facebook_ads.basic_ad
  );
