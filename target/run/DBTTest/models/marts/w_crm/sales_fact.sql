

      create or replace transient table DATAFLOTEST_DATABASE.dbt_test_marts.sales_fact  as
      (SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics1
union
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics3
union
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics10 
union
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics23
      );
    