

      create or replace transient table DATAFLOTEST_DATABASE.dbt_test_livedata_rk.Account  as
      (select * from SALESFORCE_RK.ACCOUNT WHERE CREATED_DATE  BETWEEN  '2017-01-01T01:21:08+00:00' and '2018-12-31T01:21:08+00:00'
      );
    