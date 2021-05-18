
  create or replace  view DATAFLOTEST_DATABASE.dbt_test.live_sf_User_Role  as (
    select * from SALESFORCE_RK.USER_ROLE
  );
