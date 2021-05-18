

      create or replace transient table DATAFLOTEST_DATABASE.dbt_test_marts.sales_segmented_fact  as
      (SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics5
union all
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics7
union all
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics11 
union all
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics14 
union all
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics18 
union all
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics19 
union all
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics22 
union all
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics25 
union all
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics26
      );
    