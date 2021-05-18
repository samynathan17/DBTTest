

      create or replace transient table DATAFLOTEST_DATABASE.dbt_test_SF_RKLIVE_06012021.period  as
      (select * from "RKLIVE_NEWDATA"."PERIOD"
      );
    