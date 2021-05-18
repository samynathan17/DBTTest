
  create or replace  view DATAFLOTEST_DATABASE.dbt_test_staging.sales_seg_fact  as (
    SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics5
union
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics7
union
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics11 
union
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics12  
union
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics14 
union
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics18 
union
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics19 
union
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics22 
union
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics25 
union
SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.metrics26
  );
