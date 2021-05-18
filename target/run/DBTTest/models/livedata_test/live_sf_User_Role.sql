

      create or replace transient table DATAFLOTEST_DATABASE.dbt_test_livedata_test.live_sf_User_Role  as
      (select * from SALESFORCE_RK.USER_ROLE
      );
    