
  create or replace  view DATAFLOTEST_DATABASE.dbt_test.stg_twitter_ads__promoted_tweet_report_tmp  as (
    select *
from DATAFLOTEST_DATABASE.twitter_ads.promoted_tweet_report
  );
