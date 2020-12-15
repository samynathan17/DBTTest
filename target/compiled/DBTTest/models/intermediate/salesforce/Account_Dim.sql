with stg_account as (
 SELECT * FROM DATAFLOTEST_DATABASE.dbt_test_staging.stg_sf_account
),Acount_mapping as(
    
    SELECT
    id AS Acount_ID,
    name AS Account_Name,
    type AS Account_Type,
    'D_CALENDAR_DIM_LOAD' AS DW_SESSION_NM,
    
    current_timestamp::
    timestamp_ntz

 AS DW_INS_UPD_DTS
    FROM stg_account
)

SELECT * FROM Acount_mapping