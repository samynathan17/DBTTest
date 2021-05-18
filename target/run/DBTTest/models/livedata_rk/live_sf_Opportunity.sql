
  create or replace  view DATAFLOTEST_DATABASE.dbt_test.live_sf_Opportunity  as (
    select * from SALESFORCE_RK.OPPORTUNITY WHERE CREATED_DATE <= '2010-10-21T01:21:08+00:00'
  );
