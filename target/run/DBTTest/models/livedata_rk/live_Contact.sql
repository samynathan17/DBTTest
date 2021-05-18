
  create or replace  view DATAFLOTEST_DATABASE.dbt_test.live_Contact  as (
    select * from SALESFORCE_RK.CONTACT WHERE CREATED_DATE <= '2010-10-21T01:21:08+00:00'
  );
