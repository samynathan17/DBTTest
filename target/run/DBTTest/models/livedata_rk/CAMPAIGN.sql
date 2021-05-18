

      create or replace transient table DATAFLOTEST_DATABASE.dbt_test_SF_RKLIVE_06012021.CAMPAIGN  as
      (select * from "RKLIVE_NEWDATA"."CAMPAIGN" 
WHERE CREATED_DATE  BETWEEN  '2017-02-01T01:21:08+00:00' and '2020-01-31T01:21:08+00:00'
      );
    