
  create or replace  view DATAFLOTEST_DATABASE.dbt_test.live_Campaign  as (
    select * from SALESFORCE_RK.CAMPAIGN WHERE CREATED_DATE <= '2010-10-21T01:21:08+00:00'
  );
