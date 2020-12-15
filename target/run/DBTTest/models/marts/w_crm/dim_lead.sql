

      create or replace transient table DATAFLOTEST_DATABASE.dbt_test_marts.dim_lead  as
      (SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_lead
      );
    