

      create or replace transient table DATAFLOTEST_DATABASE.dbt_test_marts.dim_TimeFrame  as
      (SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_timeframe
      );
    