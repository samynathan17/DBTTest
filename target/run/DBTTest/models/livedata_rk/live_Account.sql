
  create or replace  view DATAFLOTEST_DATABASE.dbt_test.live_Account  as (
    select * from SALESFORCE_RK.ACCOUNT WHERE CREATED_DATE <= '2010-10-21T01:21:08+00:00'
  );
